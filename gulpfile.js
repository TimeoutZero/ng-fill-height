
var gutil = require('gulp-util');
var ngAnnotatePlugin = require('ng-annotate-webpack-plugin');
var bbComponentOptions = {};

bbComponentOptions.modules = {
  unitTests: {
    isEnabled: false
  },
  bundler: {
    webpackConfig: {
      output: {
        filename: '[name].js'
      },
      externals: {
        'angular' : 'angular'
      },
      plugins: [
        new ngAnnotatePlugin({
          add: true
        })
      ]
    }
  }
};

var bbAngularOptions = {
  modulesData: {
    scripts: {
      coffee: {
        sourcemaps: {
          active: false
        }
      }
    },

    unitTests: {
      testAutoConfig: {
        suppressCoverage: true
      }
    }
  }
};

if(gutil.env._[0] === 'bundle' || gutil.env._[0] === 'build'){
  require('basebuild-component')(bbComponentOptions);
} else {
  require('basebuild-angular')(bbAngularOptions);
}