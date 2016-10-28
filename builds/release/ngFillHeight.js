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

	// =============================================
	// Vendors
	// =============================================

	angular.module("ngFillHeight.vendors", []);

	// =============================================
	// Modules
	// =============================================
	// angular.module("ngFillHeight.controllers" , ["ngFillHeight.vendors"]);
	// angular.module("ngFillHeight.filters"     , ["ngFillHeight.vendors"]);
	// angular.module("ngFillHeight.factories"   , ["ngFillHeight.vendors"]);
	// angular.module("ngFillHeight.constants"   , ["ngFillHeight.vendors"]);
	// angular.module("ngFillHeight.services"    , ["ngFillHeight.vendors"]);
	angular.module("ngFillHeight.directives", ["ngFillHeight.vendors"]);
	// angular.module("ngFillHeight.mocks"       , ["ngFillHeight.vendors"]);
	// angular.module("ngFillHeight.configs"     , ["ngFillHeight.vendors"]);
	// angular.module("ngFillHeight.providers"   , ["ngFillHeight.vendors"]);


	// =============================================
	// Scripts Module
	// =============================================
	angular.module("ngFillHeight.scripts", [
	// "ngFillHeight.controllers",
	// "ngFillHeight.constants",
	// "ngFillHeight.filters"
	// "ngFillHeight.factories",
	// "ngFillHeight.services",
	"ngFillHeight.directives"]);

	// =============================================
	// Main Module
	// =============================================
	angular.module("ngFillHeight", ["ngFillHeight.scripts", "ngFillHeight.vendors"]);

/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	var map = {
		"./directive.coffee": 4,
		"./directive.spec.js": 5
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
	angular.module("ngFillHeight.directives").directive('ngFillHeight', ["$parse", function($parse) {
	  var ngFillHeightLink;
	  ngFillHeightLink = function(scope, element, attrs) {
	    var currObject, ngFillHeightOption, parentObject;
	    ngFillHeightOption = ($parse(attrs.ngFillHeight))(scope);
	    if (typeof ngFillHeightOption !== 'object') {
	      console.error('The value of ngFillHeight has to be an Object');
	      return;
	    }
	    parentObject = angular.element(ngFillHeightOption.parentSelector);
	    currObject = angular.element(element);
	    return ngFillHeightOption.api = {
	      recalcHeight: function() {
	        var recurrFunc, results;
	        recurrFunc = function(increment) {
	          return currObject.height(currObject.height() + increment);
	        };
	        while (parentObject.height() >= parentObject.prop('scrollHeight')) {
	          recurrFunc(10);
	        }
	        results = [];
	        while (parentObject.height() < parentObject.prop('scrollHeight')) {
	          results.push(recurrFunc(-1));
	        }
	        return results;
	      }
	    };
	  };
	  return {
	    restrict: 'A',
	    link: ngFillHeightLink
	  };
	}]);


/***/ },
/* 5 */
/***/ function(module, exports) {

	// empty (null-loader)
	"use strict";

/***/ }
/******/ ])
});
;