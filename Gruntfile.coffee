module.exports = (grunt) ->

  grunt.initConfig({

    assemble:
      options:
        partials:[
          'src/hbs/components/*.hbs'
        ]
      dev:
        files: [
          'dist/index.html':'src/hbs/index.hbs'
        ]
    less:
      dev:
        files:
          'dist/css/main.css':'src/less/main.less'
      prod:
        options:
          compress: true
        files:
          'dist/css/main.css':'src/less/main.less'
    watch:
      html:
        files: [
          'src/hbs/**/*.hbs'
        ]
        tasks: [
          'assemble'
        ]
      css:
        files: [
          'src/less/**/*.less'
        ]
        tasks: [
          'less:dev'
        ]
    concurrent:
      options:
        logConcurrentOutput: true
      dev: [
        'watch:html', 'watch:css'
      ]
    lesslint:
      src: ['src/less/main.less']
    copy:
      libs:
        expand: true
        cwd: 'src/js/libs/'
        src: ['**']
        dest: 'dist/js/libs/'
    uglify:
      dev:
        options:
          compress: false
          mangle: false
          beautify: true
        files:
          'dist/js/main.js': ['src/resources/bootstrap-less/js/tab.js']
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

  grunt.registerTask('default', [
    'assemble'
    'less:dev'
    'copy:libs'
    'uglify:dev' 
    'concurrent:dev'
  ])
  grunt.registerTask('lint', ['lesslint'])
  grunt.registerTask('prod', ['assemble', 'less:prod'])
