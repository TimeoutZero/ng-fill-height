'use strict'

angular.module("ngFillHeight.directives")
  .directive 'ngFillHeight', ($parse, $log) ->

    ngFillHeightLink = (scope, element, attrs) ->
      ngFillHeightOption                 = scope.ngFillHeight
      ngFillHeightOption.minHeight       = ngFillHeightOption.minHeight or 0
      ngFillHeightOption.maxCallNumber or= 10000

      if typeof ngFillHeightOption isnt 'object'
        $log.error 'The value of ngFillHeight has to be an Object'
        return

      currObject   =  if angular.isString(ngFillHeightOption.contentSelector) then angular.element(element).find(ngFillHeightOption.contentSelector) else angular.element(element)
      parentObject =  currObject.closest(ngFillHeightOption.parentSelector)

      ###
      # Private Methods
      ###
      ngFillHeightOption._utils =
        getCssPropertyAsNumber: (element, propertyName) ->
          return parseInt(element.css(propertyName), 10) or 0

        getPadding: (element, specification) ->
          paddingProperty = 'padding'

          if specification
            paddingProperty += "-#{specification}"

          paddingProperty = ngFillHeightOption._utils.getCssPropertyAsNumber(element, paddingProperty)

          return paddingProperty

        getMarginAndBorderHeight: (element, specification) ->
          marginProperty = 'margin'
          borderProperty = 'border'

          if specification
            marginProperty += "-#{specification}"
            borderProperty += "-#{specification}-width"

          marginProperty = ngFillHeightOption._utils.getCssPropertyAsNumber(element, marginProperty)
          borderProperty = ngFillHeightOption._utils.getCssPropertyAsNumber(element, borderProperty)

          return marginProperty + borderProperty

      ###
      # Public API Methods
      ###
      ngFillHeightOption.api =

        recalcHeight : () ->
          unless parentObject.length then throw new Error("no parent found using #{ngFillHeightOption.parentSelector}")
          unless currObject.length   then throw new Error("no parent found using #{ngFillHeightOption.selector}")

          wrapperPaddingTop                  = ngFillHeightOption._utils.getPadding(parentObject, 'top')
          wrapperPaddingBottom               = ngFillHeightOption._utils.getPadding(parentObject, 'bottom')
          elementOffsetTop                   = currObject.position().top - parentObject.position().top
          elementBottomMarginAndBorderHeight = ngFillHeightOption._utils.getMarginAndBorderHeight(currObject ,'bottom')

          parentHeight  = parentObject.innerHeight() - ( wrapperPaddingTop + wrapperPaddingBottom )
          elementHeight = parentHeight - elementOffsetTop - elementBottomMarginAndBorderHeight - wrapperPaddingBottom

          if ngFillHeightOption.minHeight and elementHeight < ngFillHeightOption.minHeight
            elementHeight = ngFillHeightOption.minHeight

          return currObject.height(elementHeight)


    return {
      restrict: 'A'
      scope: {
        ngFillHeight: "="
      }
      link : ngFillHeightLink
    }
