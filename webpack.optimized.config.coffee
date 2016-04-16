
###
  optimized config makes dist/react-datum.min.js
###

fs = require('fs')
_ = require('lodash')
Webpack = require("webpack")
Path = require("path")

baseConfig = require('./webpack.config')

requireFile = './__webpack.optimized.config'
configFile =  Path.join("node_modules/bumble-build/", '__webpack.optimized.config')

userConfig = if fs.existsSync(configFile + '.js') || fs.existsSync(configFile + '.coffee') 
  test = require(requireFile) 
else 
  {}


# assume run from project root this the user of this package's package
userPackage = JSON.parse(fs.readFileSync('package.json'))

optimizedConfig =
  debug: false,
  output:
    filename: "#{userPackage.name}.min.js"
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
