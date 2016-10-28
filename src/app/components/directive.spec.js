
// describe("ng-fill-height's", function () {

//   describe('directive', function () {
//     var uiLimitTo = null;

//     beforeEach(module('ngFillHeight.directives'));
//     beforeEach(inject(function (_ngFillHeight_) {
//       uiLimitTo = _ngFillHeight_;
//     }));

//     describe("when there's an list as input", function () {
//       var input        = null;
//       var limitedInput = null;

//       describe("and it's using an property to identify a model", function () {

//       beforeEach(function(){
//           input        = [{id: 1}, {id: 2}, {id: 3}];
//           limitedInput = uiLimitTo(input, 2, {id: 3}, 'id');
//         });

//         it('Limits the input by limitNumber', function () {
//           expect(limitedInput).toEqual(jasmine.any(Array));
//           expect(limitedInput.length).toEqual(2);
//         });

//         it("Removes item at model's position and ensures that the model is present", function () {
//           expect(limitedInput[limitedInput.length - 1])
//             .toEqual(jasmine.objectContaining({
//               id: 3
//             }));
//         });
//       });
//     });
//   });
// });
