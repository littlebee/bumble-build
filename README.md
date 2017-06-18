# bumble-build

## Installation

**Install from NPM:**

```bash

npm install --save-dev bumble-build 
node_modules/bumble-build/bin/init.coffee
```

** You must install grunt-cli globally **
```bash
sudo npm install -g grunt-cli
```

A build setup using grunt, webpack, [bumble-docs](https://github.com/littlebee/bumble-docs), [bumble-test](https://github.com/littlebee/bumble-test), ... that proabably will not work with your code.

This package is selfishly supported.  I hate repeating code.  This is the grunt + webpack + bumble_* build used by [react-datum](http://zulily.github.io/react-datum/docs/) and [tilegrid](http://zulily.github.io/tilegrid/docs/) packaged for shared build stuff used by both (maybe more) packages.

Basically just npm installs the needed grunt, babel and webpack development dependencies and then copies a Gruntfile.coffee and two webpack.*.coffee files into your project root directory.  You are free to change them after.  

* Rerunning bumble-build/bin/init will not overwrite the files. * You can customize the Gruntfile and two webpack config files as needed.  If you need to reset them, first remove them and then rerun bumble-build init script. 

See [bumble-docs](https://github.com/littlebee/bumble-docs) for information on documentation generator used.  Note that docs and examples are not built by default. You will need to run `grunt docs` from your project root and you may only want to do that in your gh-pages branch.  

## Grunt

See also the [Grunt Getting Started](http://gruntjs.com/getting-started) for more information on grunt.  The init.coffee script will install all of the necessary npm packages except:

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


## Tests

Any .coffee or .cjsx files found in the `test/` directory are assumed to be Mocha Chai compatible tests and are run when `grunt test` is executed. 

Any files in subfolders named '...lib/...' are ignored.   


## Conventions

We assume some defaults about the locations of things and if everyone at least put things in the same place, ....

from project root:

|path or file|content description|          
|docs/      | Generated documentation goesa here. Some directories in here will be wiped by running `grunt clean` |
|dist/      | Generated webpack bundles go here
|src/       | Source code for app or package |
|examples/  | Source code for examples that get included in static docs. see [bumble-docs]|
|test/      | Mocha tests for app |  
|index.js   | This file is the default entry point for the package and resulting webpack. |
|package.json| see next section |

## package.json

The **name** attribute from your package.json is used for nameing distribution files created by webpack.  The camel cased name attribute from package.json is also used as the default output.library for webpack config.  The **main** attribute from package.json file is used as default **entry** for webpack config.  







