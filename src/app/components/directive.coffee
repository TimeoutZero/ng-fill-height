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
      timesCalled  = 0

      ngFillHeightOption.api =
        recalcHeight : () ->
          unless parentObject.length then throw new Error("no parent found using #{ngFillHeightOption.parentSelector}")
          unless currObject.length   then throw new Error("no parent found using #{ngFillHeightOption.selector}")
          return  # test version

          recurrFunc = (increment) ->
            currObject.height(currObject.height() + increment)
            timesCalled++
            return

          if parentObject.prop('scrollHeight') and timesCalled <= ngFillHeightOption.maxCallNumber
            recurrFunc(10) while currObject.height() < ngFillHeightOption.minHeight or parentObject.height() >= parentObject.prop('scrollHeight')

            recurrFunc(-1) while currObject.height() > ngFillHeightOption.minHeight and parentObject.height() < parentObject.prop('scrollHeight')
          else
            $log.warn("[ng-fill-height] : Maximum number of calls reached (#{ngFillHeightOption.maxCallNumber})")

          return currObject.height()


    return {
      restrict: 'A'
      scope: {
        ngFillHeight: "="
      }
      link : ngFillHeightLink
    }
