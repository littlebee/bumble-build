# bumble-build

## Installation

**Install from NPM:**

```bash

npm install --save-dev bumble-build 
node_modules/bumble-build/bin/init.coffee

```

A build setup using grunt, webpack, [bumble-docs](https://github.com/littlebee/bumble-docs), [bumble-test](https://github.com/littlebee/bumble-test), ... that proabably will not work with your code.

This package is selfishly supported.  I hate repeating code.  This is the grunt + webpack + bumble_* build used by [react-datum](http://zulily.github.io/react-datum/docs/) and [tilegrid](http://zulily.github.io/tilegrid/docs/) packaged for shared build stuff used by both (maybe more) packages.

See react-datum [grunt file](https://github.com/zulily/react-datum/blob/master/Gruntfile.coffee), [webpack.config](https://github.com/zulily/react-datum/blob/master/webpack.config.coffee) for example usage.

See [bumble-docs](https://github.com/littlebee/bumble-docs) for information on documentation generator used.

## Grunt

See also the [Grunt Getting Started](http://gruntjs.com/getting-started) for more information on grunt.  The init.coffee script will install all of the necessary npm packages except:

** You must install grunt-cli globally **
```bash
sudo npm install -g grunt-cli
```


You can 

```bash
grunt build
```

or clean and build:

```bash
grunt clean build 
```

or watch for changes to src and rebuild dist files:
```bash
grunt watch
```

To see all of the tasks offered:
```
~/projects/zulily/tilegrid$ grunt
Running "availabletasks:tasks" (availabletasks) task
build  =>  Builds everything including docs, examples
clean  ->  Remove all compiled files. Use `grunt clean build` to rebuild everything from scratch (distrib|docs)
docs   =>  Build the docs. To publish to github.io, you must pull master into gh-pages
test   =>  Builds everything and then run tests in /test
watch   >  Watch for changing files and calls build. Also watches examples and docs
```

you can also get more fancy and make modifications / additions to the standard config:
```coffee-script
# my Gruntfile.coffee

BumbleBuild = require('bumble-build')
module.exports = (grunt) -> BumbleBuild.gruntConfig grunt, 
  cssmin: 
    options: 
      shorthandCompacting
```

## Convention 
We assume some defaults about the locations of things and if everyone at least put things in the same place, ....

from project root:

|path or file|content description|         
|docs/      | Generated documentation goesa here. Some directories in here will be wiped by running `grunt clean` |
|dist/      | Generated webpack bundles go here
|src/       | Source code for app or package |
|examples/  | Source code for examples that get included in static docs. see [bumble-docs]|
|index.js   | This file is the default entry point for the package and resulting webpack. |
|package.json| see next section |

## package.json

The **name** attribute from your package.json is used for nameing distribution files created by webpack.  The camel cased name attribute from package.json is also used as the default output.library for webpack config.  The **main** attribute from package.json file is used as default **entry** for webpack config.  

## webpack.\*.config

You can override specific webpack configuration details by providing a webpack.config.coffee or webpack.config.js file in your project root directory.   Your webpack.config file only need specify the things you want in addition to, or to override from bumble-build webpack config.

Currently, bumble-build looks for the following webpack config files:
webpack.config.(js|coffee) - the base unoptimized configuration
webpack.optimized.config.(js|coffee) - the minified & optimized configuration 

Example, specify a different set of entry points for webpack (in file named webpack.config.js in your project root):
```javascript
// I need webpack hot loading now, damnit!  (coming soon)
module.exports = {
  entry: [
    "webpack-dev-server/client?http://localhost:3000",  
    "webpack/hot/only-dev-server",
    "./myAwesomePackage.js"          // My app / package main set of module.exports
  ]
}
```






