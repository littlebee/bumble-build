
###
  Unoptimized config makes dist/react-datum.js

  See also, https://github.com/felixhao28/using-coffee-react-for-frontend-dev-walkthrough
###
fs = require('fs-extra')
_ = require('lodash')

Path = require("path")
Glob = require("glob")
Webpack = require("webpack")
Inflection = require('inflection')


# assume run from project root this the user of this package's package
userPackage = JSON.parse(fs.readFileSync('package.json'))

# node.js will not allow us to require something from the user app's dir, so
# copy it to our root.  So the user can optionally provide overrides for 
# this type of webpack config
for confFile in Glob.sync('./webpack.*', nodir: true)
  # console.log "copying #{confFile} to node_modules/bumble-test"
  fs.copySync(confFile, Path.join("node_modules/bumble-build/", "__#{Path.basename(confFile)}"))

requireFile = './__webpack.config'
configFile =  Path.join("node_modules/bumble-build/", '__webpack.config')

userConfig = if fs.existsSync(configFile + '.js') || fs.existsSync(configFile + '.coffee') 
  require(requireFile) 
else 
  {}

# these can be overridden or added to using standard webpack config "externals" which should
# be an array of objects with [{key:{root:...}},{nextKey:{root:...}}]
externalsIndex = {
  'jquery': {
    root: 'jQuery'
    commonjs2: 'jquery',
    commonjs: 'jquery',
    amd: 'jquery'
  }
  'react': {
    root: 'React',
    commonjs2: 'react',
    commonjs: 'react',
    amd: 'react'
  }
  'react-dom': {
    root: 'ReactDOM',
    commonjs2: 'react-dom',
    commonjs: 'react-dom',
    amd: 'react-dom'
  }
  'backbone': {
    root: "Backbone"
    commonjs2: 'backbone'
    commonjs: 'backbone'
    amd: 'backbone'
  }
  'underscore': {
    root: "_"
    commonjs2: 'underscore'
    commonjs: 'underscore'
    amd: 'underscore'
  }
}

console.log externalsIndex
  
for userExternal of (userConfig.externals || [])
  key = _.keys(userExternal)[0] 
  externalsIndex[key] = _.defaults userExternal, externalsIndex[key]
delete userConfig.externals
# covert hash to array (why webpack, why??)
externals = {}
externals[key] = value for key, value of externalsIndex
  

loaders = [
  # 
  # DON'T USE THIS  if you do a require(`../css/someFile.css`) that file will fail to load in tests
  # If you need to include CSS for a component of this lib:
  #   - keep it minimal (let our users style and format)
  #   - please don't use inline styles as they are difficult for our user to override
  #   - put the css in a file that is of same or similar name to the components in the css/ dir
  #
  #   test: /\.css$/                         # required to write "require("./someFile.css")"
  #   loader: "style-loader!css-loader"
  # ,
  # required for bootstrap icons
  test: /\.(woff|woff2)$/
  loader: "url-loader?prefix=font/&limit=5000&mimetype=application/font-woff"
,
  test: /\.ttf$/
  loader: "file-loader?prefix=font/"
,
  test: /\.eot$/
  loader: "file-loader?prefix=font/"
,
  test: /\.svg$/
  loader: "file-loader?prefix=font/"
,
  test: require.resolve("jquery")
  loader: "expose?$"
,
  test: require.resolve("jquery")
  loader: "expose?jQuery"
,
#   test: require.resolve("react")
#   loader: "expose?React"
# ,
#   test: /\.jsx$/
#   loaders: ["react-hot", "jsx-loader?insertPragma=React.DOM"]
#   include: Path.join(__dirname, "src")
# ,
  test: /\.cjsx$/
  loaders: ['coffee', 'cjsx']
,
  test: /\.coffee$/ 
  loader: 'coffee-loader' 
,
  test: /\.jsx?$/,
  exclude: /node_modules/,
  loader: 'babel-loader',
  query: {
    presets:[ 'es2015', 'react', 'stage-2' ]
  }
,
  test: /\.(png|jpg|gif)$/
  loader: 'url-loader?limit=8192' # inline base64 URLs for <=8k images, direct URLs for the rest
  #test: /\.jpe?g$|\.gif$|\.png|\.ico$/, loader: 'file' 
,
  test: /\.json$/
  loader: 'json'
]


for userLoader in (userConfig.module?.loaders || [])
  existingLoader = _.find loaders, {test: userLoader.test}
  if existingLoader 
    _.extendDeep existingLoader, userLoader 
  else 
    loaders.push userLoader
delete userConfig.module.loaders if userConfig.module?.loaders?
  

exports = _.defaultsDeep userConfig,
  cache: true
  entry: [
    # "webpack-dev-server/client?http://localhost:3000", # WebpackDevServer host and port
    # "webpack/hot/only-dev-server",
    "./#{userPackage.main}" # Main app"s entry point
  ],
  output:
    path: "dist/"
    filename: "#{userPackage.name}.js"
    libraryTarget: "umd"
    library: Inflection.camelize(userPackage.name.replace(/[ \-]/g, "_"), false)
    publicPath: "dist/"
    
  debug: true,

  externals: externals

  resolve:
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"]
    modulesDirectories: ["src", "node_modules"]

  module:
    loaders: loaders
      
  plugins: [
    # #  this adds a lot of code to the bundle for hot loading feature
    # new Webpack.HotModuleReplacementPlugin()


    ## I think this and changing the debug setting above to `debug: false` above are all that
    ##   should be needed to produce an optimized minified package
    # new Webpack.optimize.DedupePlugin(),
    # new Webpack.optimize.UglifyJsPlugin
    #  compress:
    #    warnings: false
    #  mangle:
    #    except: ['$super', '$', 'exports', 'require']
  ]

console.log exports
module.exports = exports
