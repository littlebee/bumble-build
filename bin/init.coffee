#!/usr/bin/env coffee

Fs = require('fs-extra')
Path = require('path')
ChildProcess = require('child_process')
BUtil = require('bumble-util')

# install needed stuff

NPM_DEV_PACKAGES = [
  "bumble-docs", "bumble-test"
  "grunt@0.4.5","grunt-available-tasks","grunt-coffee-react","grunt-contrib-clean","grunt-contrib-coffee",
  "grunt-contrib-cssmin","grunt-contrib-watch","grunt-newer","grunt-react","grunt-scp","grunt-shell",
  "grunt-sync", "grunt-webpack"
  "babel-core", "babel-loader", "babel-preset-react", "babel-preset-es2015", "coffee-loader", "cjsx-loader"
]

unless Fs.existsSync('./Gruntfile.js') || Fs.existsSync('./Gruntfile.coffee')
  console.log 'creating: ./Gruntfile.coffee'
  Fs.copySync('node_modules/bumble-build/bin/lib/Gruntfile.coffee', './Gruntfile.coffee')

BUtil.installNodePackage(npmPackage, {addFlags: "--save-dev"}) for npmPackage in NPM_DEV_PACKAGES
BUtil.systemCmd("grunt")

console.log "\n\nAll done.  You may need to install grunt-cli globally like `sudo npm install -g grunt-cli` \n\n\n"
