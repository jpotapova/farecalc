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
  })

  grunt.loadNpmTasks 'assemble'

  grunt.registerTask('default', ['assemble'])
