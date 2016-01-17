#!/usr/bin/env coffee

Fs = require('fs-extra')
Path = require('path')
ChildProcess = require('child_process')
BUtil = require('bumble-util')

# install needed stuff

NPM_DEV_PACKAGES = [
  "grunt","grunt-available-tasks","grunt-coffee-react","grunt-contrib-clean","grunt-contrib-coffee",
  "grunt-contrib-cssmin","grunt-contrib-watch","grunt-newer","grunt-react","grunt-scp","grunt-shell",
  "grunt-sync"
]
  
unless Fs.existsSync('./Gruntfile.js') || Fs.existsSync('./Gruntfile.coffee') 
  console.log 'creating: ./Gruntfile.coffee'
  Fs.copySync('node_modules/bumble-build/bin/lib/Gruntfile.coffee', './Gruntfile.coffee')
  
BUtil.systemCmd("npm install --save-dev #{NPM_DEV_PACKAGES.join(' ')}")
BUtil.systemCmd("grunt")

console.log "\n\nAll done.  You need to install grunt-cli globally like `sudo npm install -g grunt-cli` \n\n\n"
  


