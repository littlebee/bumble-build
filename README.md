# bumble-build
A build setup using grunt, webpack, bumble-docs, bumble-test, ... that proabably will not work with your code.

This package is selfishly supported.  I hate repeating code.  This is the grunt + webpack + bumble_* build used by [react-datum](http://zulily.github.io/react-datum/docs/) and [tilegrid](http://zulily.github.io/tilegrid/docs/) packaged for shared build stuff used by both (maybe more) packages.

See react-datum [grunt file](https://github.com/zulily/react-datum/blob/master/Gruntfile.coffee), [webpack.config](https://github.com/zulily/react-datum/blob/master/webpack.config.coffee) for example usage


## gruntConfig(grunt)

this funtion returns a configuration object that should be returned from your Gruntfile.coffee like this:
```coffee-script
# my Gruntfile.coffee

BumbleBuild = require('bumble-build')
module.exports = (grunt) -> BumbleBuild.gruntConfig(grunt)

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

## webpack.\*.config

You can override specific webpack configuration details by providing a webpack.config.coffee or webpack.config.js file in your project root directory.   Your webpack.config file only need specify the things you want in addition to, or to override from bumble-build webpack config.

Currently, bumble-build looks for the following webpack config files:
webpack.config.(js|coffee) - the base unoptimized configuration
webpack.optimized.config.(js|coffee) - the minified & optimized configuration 



