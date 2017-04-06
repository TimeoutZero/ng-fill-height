
describe 'ngFillHeight', ->
  describe 'directive', ->


    # ====
    # Variables
    # ====
    scope             = null
    isolatedScope     = null
    mock              = null
    $element          = null
    $compile          = $compile
    $content          = null
    html              = null
    body              = null

    # ====
    # Before
    # ====
    beforeEach module('ngFillHeight')
    beforeEach inject ($rootScope, _ngFillHeightMock_, _$compile_) ->
      scope    = $rootScope.$new()
      mock     = _ngFillHeightMock_
      $compile = _$compile_

      html     = angular.element('html')
      body     = angular.element('body')


    # ====
    # Tests
    # ====
    describe "when there's a wrapper", ->
      describe "and it's bigger than the content", ->
        beforeEach ->
          scope.fillHeightOptions = mock.biggerWrapper.options
          scope.$digest()

          $element     = $compile(mock.biggerWrapper.template)(scope)
          body.append($element)

          $content     = $element.find('.content')
          isolateScope = $content.isolateScope()
          isolateScope.$digest()
          return

        afterEach ->
          $element.remove()

        it "fills the entire wrapper using the content", ->
          scope.fillHeightOptions.api.recalcHeight()
          expect($content.height()).toEqual mock.biggerWrapper.wrapperHeight

        describe "and it's using fillHeight itself, but specifying a custom selector for the content", ->
          beforeEach ->
            scope.fillHeightOptions = mock.biggerWrapperUsingFillHeightItself.options
            scope.$digest()

            $element     = $compile(mock.biggerWrapperUsingFillHeightItself.template)(scope)
            body.append($element)

            $content     = $element.find(mock.biggerWrapperUsingFillHeightItself.options.contentSelector)
            isolateScope = $element.isolateScope()
            isolateScope.$digest()
            return

          afterEach ->
            $element.remove()

          it "fills the entire wrapper using the content", ->
            scope.fillHeightOptions.api.recalcHeight()
            expect($content.height()).toEqual mock.biggerWrapperUsingFillHeightItself.wrapperHeight

        ###
        # grandpa
        ###
        describe "which has a grandpa division", ->
          describe "and the wrapper is bigger than the content", ->
            beforeEach ->
              scope.fillHeightOptions = mock.biggerWrapperWhichHasAParent.options
              scope.$digest()

              $element     = $compile(mock.biggerWrapperWhichHasAParent.template)(scope)
              body.append($element)

              $content     = $element.find('.content')
              isolateScope = $content.isolateScope()
              isolateScope.$digest()
              return

            afterEach ->
              $element.remove()

            it "fills the entire wrapper using the content", ->
              scope.fillHeightOptions.api.recalcHeight()
              expect($content.height()).toEqual mock.biggerWrapperWhichHasAParent.wrapperHeight

        describe "and the wrapper is shorter than the content, but has a minHeight defined", ->
          beforeEach ->
            scope.fillHeightOptions = mock.shorterWrapperWhichHasAParentAnd.options
            scope.$digest()

            $element     = $compile(mock.shorterWrapperWhichHasAParentAnd.template)(scope)
            body.append($element)

            $content     = $element.find('.content')
            isolateScope = $content.isolateScope()
            isolateScope.$digest()
            return

          afterEach ->
            $element.remove()

          it "fills the entire wrapper using the content", ->
            scope.fillHeightOptions.api.recalcHeight()
            expect($content.height()).toEqual mock.shorterWrapperWhichHasAParentAnd.options.minHeight