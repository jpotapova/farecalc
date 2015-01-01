module.exports = (grunt) ->

  grunt.initConfig({

    assemble:
      options:
        partials:[
          'src/hbs/components/*.hbs'
        ]
        data: 'src/hbs/data/*.json'
      dev:
        files: [
          'dist/index.html':'src/hbs/index.hbs'
        ]
    concat:
      dev:
        files:
          'dist/css/main.css': ['src/resources/chartist/dist/chartist.min.css', '_build/css/main.css']
    less:
      dev:
        files:
          '_build/css/main.css':'src/less/main.less'
      prod:
        options:
          compress: true
        files:
          '_build/css/main.css':'src/less/main.less'
    watch:
      html:
        files: ['src/hbs/**/*.hbs']
        tasks: ['assemble']
      css:
        files: ['src/less/**/*.less']
        tasks: ['less:dev', 'concat:dev']
      js:
        files: [
          'src/coffee/*.coffee'
          'tests/coffee/**/*.coffee'
        ]
        tasks: [
          'coffee:dev', 'uglify:dev'
        ]
    concurrent:
      options:
        logConcurrentOutput: true
      dev: [
        'watch:html', 'watch:css', 'watch:js'
      ]
    lesslint:
      src: ['src/less/main.less']
    copy:
      libs:
        expand: true
        cwd: 'src/resources/jquery/dist/'
        src: ['jquery.min.js']
        dest: 'dist/js/libs/'
    coffee:
      dev:
        options:
          bare: true
        files:
          'src/js-compiled/main.js': [
            'src/coffee/appRouter.coffee'
            'src/coffee/*Model.coffee'
            'src/coffee/*Collection.coffee'
            'src/coffee/*View.coffee'
            'src/coffee/app.coffee'
          ]
      test:
        expand: true
        flatten: false
        cwd: 'tests/coffee'
        src: ['**/*.coffee']
        dest: 'tests/js-compiled/'
        ext: '.js'
    coffeelint:
      dev: [
        'src/coffee/*.coffee'
        'tests/coffee/**/*.coffee'
        'Gruntfile.coffee'
      ]
    casperjs:
      files: ['tests/js-compiled/**/*.js']
    uglify:
      dev:
        options:
          compress: false
          mangle: false
          beautify: true
        files:
          'dist/js/main.js': [
            'src/resources/chartist/dist/chartist.min.js'
            'src/resources/bootstrap-less/js/tab.js'
            'src/resources/underscore/underscore.js'
            'src/resources/backbone/backbone.js'
            'src/js-compiled/*.js'
          ]
      prod:
        options:
          compress: true
          mangle: true
        files:
          'dist/js/main.js': ['src/resources/bootstrap-less/js/tab.js']
  })

  grunt.loadNpmTasks 'assemble'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-lesslint'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-casperjs'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.registerTask('default', [
    'assemble'
    'less:dev'
    'copy:libs'
    'coffee:dev'
    'uglify:dev'
    'concat:dev'
    'concurrent:dev'
  ])
  grunt.registerTask('lint', ['coffeelint', 'lesslint'])
  grunt.registerTask('test', ['coffee:test', 'casperjs'])
  grunt.registerTask('prod', ['assemble', 'less:prod'])
