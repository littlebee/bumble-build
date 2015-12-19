
###
  optimized config makes dist/react-datum.min.js
###

fs = require('fs')
_ = require('lodash')
Webpack = require("webpack")
Path = require("path")

baseConfig = require('./webpack.config')

userConfigFile = './__webpack.optimized.config'
userConfig = if fs.existsSync(userConfigFile) then require(userConfigFile) else {}

optimizedConfig =
  debug: false,
  output:
    filename: "react-datum.min.js"
  plugins: baseConfig.plugins.concat [
    new Webpack.optimize.DedupePlugin(),
    new Webpack.optimize.UglifyJsPlugin(
      compress:
        warnings: false
      mangle:
        except: ['$super', '$', 'exports', 'require']
    )
  ]

# user supplied config has precendence.  it is also baked into baseConfig with precendence
# doing it again here allows user to override stuff from the optimizedConfig above as well
exportConfig = _.defaultsDeep userConfig, optimizedConfig, baseConfig

#console.log exportConfig
module.exports = exportConfig
