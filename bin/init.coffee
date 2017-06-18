#!/usr/bin/env coffee

Fs = require('fs-extra')
Path = require('path')
ChildProcess = require('child_process')
BUtil = require('bumble-util')

# These are the packages installed installed with --save-dev

NPM_DEV_PACKAGES = [
  
  "bumble-docs@0.5.3"
  "bumble-test@0.4.1"

  "grunt@0.4.5"
  "grunt-available-tasks@0.6.1"
  "grunt-coffee-react@2.4.1"
  "grunt-contrib-clean@1.0.0"
  "grunt-contrib-coffee@1.0.0"
  "grunt-contrib-cssmin@0.14.0"
  "grunt-contrib-watch@0.6.1"
  "grunt-coveralls@1.0.1"
  "grunt-newer@1.1.2"
  "grunt-react@0.12.3"
  "grunt-scp@0.1.8"
  "grunt-shell@1.1.2"
  "grunt-sync@0.5.2"
  "grunt-webpack@1.0.11"
  
  "babel-core@6.5.2"
  "babel-loader@6.2.3"
  "babel-preset-es2015@6.5.0"
  "babel-preset-react@6.5.0"
  "babel-preset-stage-2@6.17.0"
  "cjsx-loader@2.1.0"
  "coffee-loader@0.7.2"
  
  "webpack"
  
  "glob"
  "lodash"
  
  ]
  
filesToCopy = [
  'Gruntfile.coffee'
  'webpack.config.coffee'
  'webpack.config.min.coffee'
]

for file in filesToCopy
  unless Fs.existsSync("./#{file}") 
    console.log "creating: ./#{file}"
    Fs.copySync("node_modules/bumble-build/bin/lib/#{file}", "./#{file}")

BUtil.installNodePackage(npmPackage, {addFlags: "--save-dev"}) for npmPackage in NPM_DEV_PACKAGES
BUtil.systemCmd("grunt")

console.log "\n\nAll done.  You may need to install grunt-cli globally like `sudo npm install -g grunt-cli` \n\n\n"
