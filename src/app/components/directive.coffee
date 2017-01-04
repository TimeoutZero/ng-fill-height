'use strict'

angular.module("ngFillHeight.directives")
  .directive 'ngFillHeight', ($parse, $log) ->

    ngFillHeightLink = (scope, element, attrs) ->
      ngFillHeightOption = ($parse attrs.ngFillHeight)(scope)
      ngFillHeightOption.minHeight = ngFillHeightOption.minHeight or 0
      ngFillHeightOption.maxCallNumber or= 10000

      if typeof ngFillHeightOption isnt 'object'
        console.error 'The value of ngFillHeight has to be an Object'
        return

      parentObject = angular.element(ngFillHeightOption.parentSelector)
      currObject   =  angular.element(element)
      timesCalled  = 0

      ngFillHeightOption.api =
        recalcHeight : () ->

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
      scope: {}
      link : ngFillHeightLink
    }
