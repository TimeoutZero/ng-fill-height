
angular.module("ngFillHeight.constants")
  .constant 'ngFillHeightMock',
    biggerWrapper:
      wrapperHeight: 1000
      options:
        parentSelector : '.wrapper'
      template: """
        <div class="wrapper" style="height: 1000px;">
          <div ng-fill-height="fillHeightOptions" class="content"></div>
        </div>
      """

     biggerWrapperUsingFillHeightItself:
      wrapperHeight: 1000
      options:
        parentSelector   : '.wrapper'
        contentSelector  : '.content'
      template: """
        <div
          class="wrapper"
          ng-fill-height="fillHeightOptions"
          style="height: 1000px;">
          <div class="content"></div>
        </div>
      """

    biggerWrapperWhichHasAParent:
      wrapperHeight: 500
      grandpaHeight: 1000

      options:
        parentSelector   : '.wrapper'

      template: """
        <div class="grandpa"
          style="height: 1000px;">

          <div
            class="wrapper"
            style="height: 500px;">

            <div
              ng-fill-height="fillHeightOptions"
              class="content"></div>

          </div>
        </div>
      """

    shorterWrapperWhichHasAParentAnd:
      wrapperHeight: 500
      grandpaHeight: 1000

      options:
        parentSelector   : '.wrapper'
        minHeight        : 200

      template: """
        <div class="grandpa"
          style="height: 1000px;">

          <div
            class="wrapper"
            style="height: 100px;">

            <div
              ng-fill-height="fillHeightOptions"
              class="content"></div>

          </div>
        </div>
      """

    biggerWrapperWhichHasPadding:
      wrapperHeight: 1000
      padding: 100

      options:
        parentSelector: '.wrapper'

      template: """
        <div class="wrapper"
          style="height: 1000px; padding: 100px;">
            <div
              ng-fill-height="fillHeightOptions"
              class="content"></div>
        </div>
      """

    biggerWrapperWhichHasPaddingTopAndBottomWithDifferentValues:
      wrapperHeight: 1000
      paddingTop: 100
      paddingBottom: 50

      options:
        parentSelector: '.wrapper'

      template: """
        <div class="wrapper"
          style="height: 1000px; padding-top: 100px; padding-bottom: 50px;">
            <div
              ng-fill-height="fillHeightOptions"
              class="content"></div>
        </div>
      """

