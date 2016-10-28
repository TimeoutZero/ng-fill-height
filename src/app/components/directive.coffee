'use strict'

angular.module("ngFillHeight.directives")
  .directive 'ngFillHeight', ($parse) ->

    ngFillHeightLink = (scope, element, attrs) ->
      ngFillHeightOption = ($parse attrs.ngFillHeight)(scope)

      if typeof ngFillHeightOption isnt 'object'
        console.error 'The value of ngFillHeight has to be an Object'
        return

      parentObject = angular.element(ngFillHeightOption.parentSelector)
      currObject =  angular.element(element)

      ngFillHeightOption.api = {
        recalcHeight : () ->
          
          recurrFunc = (increment) ->
            currObject.height(currObject.height() + increment)

          recurrFunc(10) while parentObject.height() >= parentObject.prop('scrollHeight')

          recurrFunc(-1) while parentObject.height() < parentObject.prop('scrollHeight')
      }

    return {
      restrict: 'A'
      link : ngFillHeightLink
    }
