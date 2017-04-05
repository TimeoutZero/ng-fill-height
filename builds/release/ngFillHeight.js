(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else if(typeof exports === 'object')
		exports["ngFillHeight"] = factory();
	else
		root["ngFillHeight"] = factory();
})(this, function() {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__(1);


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	// ###
	// # Module bundler
	// ###

	// Importing main module file
	__webpack_require__(2);

	// Importing all component's scripts
	var components = __webpack_require__(3);
	components.keys().forEach(components);

/***/ },
/* 2 */
/***/ function(module, exports) {

	'use strict';
	angular.module("ngFillHeight.vendors", []);

	angular.module("ngFillHeight.constants", ["ngFillHeight.vendors"]);

	angular.module("ngFillHeight.directives", ["ngFillHeight.vendors"]);

	angular.module("ngFillHeight.mocks", ["ngFillHeight.vendors"]);

	angular.module("ngFillHeight.scripts", ["ngFillHeight.constants", "ngFillHeight.directives", "ngFillHeight.mocks"]);

	angular.module("ngFillHeight", ["ngFillHeight.scripts", "ngFillHeight.vendors"]);


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	var map = {
		"./directive.coffee": 4
	};
	function webpackContext(req) {
		return __webpack_require__(webpackContextResolve(req));
	};
	function webpackContextResolve(req) {
		return map[req] || (function() { throw new Error("Cannot find module '" + req + "'.") }());
	};
	webpackContext.keys = function webpackContextKeys() {
		return Object.keys(map);
	};
	webpackContext.resolve = webpackContextResolve;
	module.exports = webpackContext;
	webpackContext.id = 3;


/***/ },
/* 4 */
/***/ function(module, exports) {

	'use strict';
	angular.module("ngFillHeight.directives").directive('ngFillHeight', ["$parse", "$log", function($parse, $log) {
	  var ngFillHeightLink;
	  ngFillHeightLink = function(scope, element, attrs) {
	    var currObject, ngFillHeightOption, parentObject, timesCalled;
	    ngFillHeightOption = scope.ngFillHeight;
	    ngFillHeightOption.minHeight = ngFillHeightOption.minHeight || 0;
	    ngFillHeightOption.maxCallNumber || (ngFillHeightOption.maxCallNumber = 10000);
	    if (typeof ngFillHeightOption !== 'object') {
	      $log.error('The value of ngFillHeight has to be an Object');
	      return;
	    }
	    currObject = angular.isString(ngFillHeightOption.contentSelector) ? angular.element(element).find(ngFillHeightOption.contentSelector) : angular.element(element);
	    parentObject = currObject.closest(ngFillHeightOption.parentSelector);
	    timesCalled = 0;
	    return ngFillHeightOption.api = {
	      recalcHeight: function() {
	        var recurrFunc;
	        if (!parentObject.length) {
	          throw new Error("no parent found using " + ngFillHeightOption.parentSelector);
	        }
	        if (!currObject.length) {
	          throw new Error("no parent found using " + ngFillHeightOption.selector);
	        }
	        return;
	        recurrFunc = function(increment) {
	          currObject.height(currObject.height() + increment);
	          timesCalled++;
	        };
	        if (parentObject.prop('scrollHeight') && timesCalled <= ngFillHeightOption.maxCallNumber) {
	          while (currObject.height() < ngFillHeightOption.minHeight || parentObject.height() >= parentObject.prop('scrollHeight')) {
	            recurrFunc(10);
	          }
	          while (currObject.height() > ngFillHeightOption.minHeight && parentObject.height() < parentObject.prop('scrollHeight')) {
	            recurrFunc(-1);
	          }
	        } else {
	          $log.warn("[ng-fill-height] : Maximum number of calls reached (" + ngFillHeightOption.maxCallNumber + ")");
	        }
	        return currObject.height();
	      }
	    };
	  };
	  return {
	    restrict: 'A',
	    scope: {
	      ngFillHeight: "="
	    },
	    link: ngFillHeightLink
	  };
	}]);


/***/ }
/******/ ])
});
;