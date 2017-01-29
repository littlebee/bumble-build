###

  webpack setup and external grunt tasks borrowed from:
    https://github.com/felixhao28/using-coffee-react-for-frontend-dev-walkthrough

###

Path = require('path')
_ = require('lodash')


BUMBLE_DOCS_SCRIPTS = './node_modules/bumble-docs/bin/'
bumbleScriptCommand = (scriptFile, args="")-> 
  return "coffee #{Path.join(BUMBLE_DOCS_SCRIPTS, scriptFile)} #{args}"


module.exports = (grunt, initConfig={}) ->
  
  # load plugins
  # this loads all of the grunt-... packages in package.json.  clever
  require('load-grunt-tasks')(grunt, {config: 'node_modules/bumble-build/package'})
  pkg = grunt.file.readJSON("package.json")

  # configuration
  _.defaultsDeep initConfig, 
    pkg: pkg

    # args to initConfig method are the tasks
    clean:
      distrib: ["dist/#{pkg.name}.*"]
      
    cssmin: 
      options: 
        shorthandCompacting: false,
        keepBreaks: true
      distrib: 
        files: 
          "dist/#{pkg.name}.css": [
            'css/**/*.css'
          ]
    shell:
      buildExamples:
        command: bumbleScriptCommand('buildExamples.coffee')

      buildDocIndex:
        command: bumbleScriptCommand('buildDocIndex.coffee')
        
      buildApiDocs: 
        command: bumbleScriptCommand('buildApiDocs.coffee')
      
      deploy:
        options:
          # should gracefully fail if it doesn't find zukeeper src.  see comment at top of the script
          failOnError: false
        command: 'coffee ./scripts/deploy.coffee'
      
      npmInstall:
        command: 'npm install'
      
      test:
        command: 'node_modules/bumble-test/bin/testRunner.coffee'


    availabletasks:
      tasks:
        options:
          filter: 'include'
          tasks: ['build', 'test', 'watch',  'clean', 'docs']
          descriptions: 
            build: "Builds everything including docs, examples"
            test: "Builds everything and then run tests in /test"
            watch: "Watch for changing files and calls build. Also watches examples and docs"
            docs: "Build the docs. To publish to github.io, you must pull master into gh-pages"
            clean: "Remove all compiled files. Use `grunt clean build` to rebuild everything from scratch"

    watch:
      build:
        files: ["src/**/*", "css/**/*", "lib/**/*", "scripts/**/*", "webpack.config.coffee"]
        tasks: ["build"]


    webpack:
      distrib: require("./webpack.config.coffee")
      optimize: require("./webpack.optimized.config.coffee")

  grunt.initConfig initConfig

  # tasks
  grunt.registerTask 'test', ["shell:test"]
  grunt.registerTask 'distrib', ['cssmin:distrib', 'webpack:distrib', 'webpack:optimize','shell:deploy']
  grunt.registerTask 'docs',  ['shell:buildDocIndex', 'shell:buildApiDocs', 'shell:buildExamples']
  grunt.registerTask 'build', ['distrib'] 
  grunt.registerTask 'default', ['availabletasks']
