# Generated on 2013-06-13 using generator-webapp 0.2.3
LIVERELOAD_PORT = 35729
lrSnippet = require('connect-livereload')(port: LIVERELOAD_PORT)
mountFolder = (connect, dir) ->
	connect.static require('path').resolve(dir)

# Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'

module.exports = (grunt) ->
	# load all grunt tasks
	require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
	grunt.loadNpmTasks('grunt-karma')
	grunt.loadNpmTasks('grunt-symlink')

	# configurable paths
	yeomanConfig =
		app: 'app'
		dist: 'dist'
		test: 'test'
		tmp: '.tmp'

	grunt.initConfig
		yeoman: yeomanConfig
		watch:
			options:
				nospawn: true

			coffee:
				files: ['<%= yeoman.app %>/scripts/{,*/}*.coffee']
				tasks: ['coffee:dist']

			coffeeTest:
				files: ['test/spec/{,*/}*.coffee']
				tasks: ['coffee:test']

			compass:
				files: ['<%= yeoman.app %>/styles/{,*/}*.{scss,sass}']
				tasks: ['compass:server']

			handlebars:
				files: ['<%= yeoman.app %>/templates/{,*/}*.hbs']
				tasks: ['handlebars']

			livereload:
				options:
					livereload: LIVERELOAD_PORT

				files: [
					'<%= yeoman.app %>/*.html'
					'{.tmp,<%= yeoman.app %>}/styles/{,*/}*.css'
					'{.tmp,<%= yeoman.app %>}/scripts/{,*/}*.js'
					'{.tmp,<%= yeoman.app %>}/templates/{,*/}*.hbs'
					'<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
				]

		connect:
			options:
				port: 9000
				# change this to '0.0.0.0' to access the server from outside
				hostname: 'localhost'

			livereload:
				options:
					middleware: (connect) ->
						[
							lrSnippet
							mountFolder(connect, '.tmp')
							mountFolder(connect, yeomanConfig.app)
						]

			dist:
				options:
					middleware: (connect) ->
						[mountFolder(connect, yeomanConfig.dist)]

		open:
			server:
				path: 'http://localhost:<%= connect.options.port %>'

		clean:
			test: '<%= yeoman.app %>/scripts/templates.js'
			dist:
				files: [
					{
						dot: true
						src: [
							'<%= yeoman.tmp %>'
							'<%= yeoman.dist %>/*'
							'!<%= yeoman.dist %>/.git*'
						]
					}
				]
			server: '<%= yeoman.tmp %>'

		jshint:
			options:
				jshintrc: '.jshintrc'

			all: [
				'Gruntfile.js'
				'<%= yeoman.app %>/scripts/{,*/}*.js'
				'!<%= yeoman.app %>/scripts/vendor/*'
				'!<%= yeoman.app %>/scripts/templates.js'
			]

		coffee:
			dist:
				files: [
					{
						expand: true
						cwd: '<%= yeoman.app %>/scripts'
						src: '{,*/}*.coffee'
						dest: '.tmp/scripts'
						ext: '.js'
					}
				]

		compass:
			options:
				sassDir: '<%= yeoman.app %>/styles'
				cssDir: '.tmp/styles'
				generatedImagesDir: '.tmp/images/generated'
				imagesDir: '<%= yeoman.app %>/images'
				javascriptsDir: '<%= yeoman.app %>/scripts'
				fontsDir: '<%= yeoman.app %>/styles/fonts'
				importPath: '<%= yeoman.app %>/bower_components'
				httpImagesPath: '/images'
				httpGeneratedImagesPath: '/images/generated'
				httpFontsPath: '/styles/fonts'
				relativeAssets: false

			dist: {}

			server:
				options:
					debugInfo: true

		# not used since Uglify task does concat,
		# but still available if needed
		#concat:
		# dist: {}

		requirejs:
			dist:
				# Options: https://github.com/jrburke/r.js/blob/master/build/example.build.js
				options:
					# `name` and `out` is set by grunt-usemin
					baseUrl: yeomanConfig.tmp + '/scripts'
					optimize: 'none'
					# TODO: Figure out how to make sourcemaps work with grunt-usemin
					# https://github.com/yeoman/grunt-usemin/issues/30
					#generateSourceMaps: true
					# required to support SourceMaps
					# http://requirejs.org/docs/errors.html#sourcemapcomments
					preserveLicenseComments: false
					useStrict: true
					wrap: true
					#uglify2: {} // https://github.com/mishoo/UglifyJS2

		rev:
			dist:
				files:
					src: [
						'<%= yeoman.dist %>/scripts/{,*/}*.js'
						'<%= yeoman.dist %>/styles/{,*/}*.css'
						'<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp}'
						'<%= yeoman.dist %>/styles/fonts/*'
					]

		useminPrepare:
			options:
				dest: '<%= yeoman.dist %>'

			html: '<%= yeoman.app %>/index.html'

		usemin:
			options:
				dirs: ['<%= yeoman.dist %>']

			html: ['<%= yeoman.dist %>/{,*/}*.html']
			css: ['<%= yeoman.dist %>/styles/{,*/}*.css']

		imagemin:
			dist:
				files: [
					{
						expand: true
						cwd: '<%= yeoman.app %>/images'
						src: '{,*/}*.{png,jpg,jpeg}'
						dest: '<%= yeoman.dist %>/images'
					}
				]

		svgmin:
			dist:
				files: [
					{
						expand: true
						cwd: '<%= yeoman.app %>/images'
						src: '{,*/}*.svg'
						dest: '<%= yeoman.dist %>/images'
					}
				]

		cssmin:
			dist:
				files:
					'<%= yeoman.dist %>/styles/main.css': [
						'.tmp/styles/{,*/}*.css'
						'<%= yeoman.app %>/styles/{,*/}*.css'
					]

		htmlmin:
			dist:
				options: {}
					#removeCommentsFromCDATA: true
					 # https://github.com/yeoman/grunt-usemin/issues/44
					 #collapseWhitespace: true
					 #collapseBooleanAttributes: true
					 #removeAttributeQuotes: true
					 #removeRedundantAttributes: true
					 #useShortDoctype: true
					 #removeEmptyAttributes: true
					 #removeOptionalTags: true
				files: [
					{
						expand: true,
						cwd: '<%= yeoman.app %>'
						src: '*.html'
						dest: '<%= yeoman.dist %>'
					}
				]
		# Put files not handled in other tasks here
		copy:
			dist:
				files: [
					{
						expand: true
						dot: true
						cwd: '<%= yeoman.app %>'
						dest: '<%= yeoman.dist %>'
						src: [
							'*.{ico,png,txt}'
							'.htaccess'
							'images/{,*/}*.{webp,gif}'
							'styles/fonts/*'
						]
					}
					{
						expand: true
						cwd: '.tmp/images'
						dest: '<%= yeoman.dist %>/images'
						src: [
							'generated/*'
						]
					}
				]

		concurrent:
			server: [
				'coffee:dist'
				'compass:server'
				'handlebars'
			]
			dist: [
				'coffee'
				'compass:dist'
				'handlebars'
				'imagemin'
				'svgmin'
				'htmlmin'
			]

		bower:
			options:
				exclude: ['modernizr']

			all:
				rjsConfig: '<%= yeoman.app %>/scripts/main.js'

		symlink:
			js:
				dest: '.tmp/bower_components'
				relativeSrc: '../app/bower_components'
				options: type: 'dir'

			templates:
				dest: 'app/scripts/templates.js'
				relativeSrc: '../../.tmp/scripts/templates.js'

		handlebars:
			compile:
				options:
					amd: true
					processName: (fullPath) ->
						fullPath
							.replace(/^.*[\\\/]/, '') # Remove path.
							.replace(/\..*/, '')     # Remove extension.

				files:
					'<%= yeoman.tmp %>/scripts/templates.js': '<%= yeoman.app %>/templates/**/*.hbs'

		karma:
			options:
				configFile: 'karma.conf.coffee'

			ci:
				singleRun: true
				browsers: ['PhantomJS']

			dev: {}

	grunt.registerTask 'server', (target) ->
		if target is 'dist'
			return grunt.task.run ['build', 'open', 'connect:dist:keepalive']

		grunt.task.run [
			'clean'
			'concurrent:server'
			'connect:livereload'
			'open'
			'watch'
		]

	grunt.registerTask 'test', (environment, target) ->
		karma = 'karma:'
		karma += if environment then environment else 'ci'
		karma += if target then ':' + target else ''

		grunt.task.run [
			'clean'
			'handlebars'
			'symlink:templates'
			karma
		]

	grunt.registerTask 'build', [
		'clean'
		'useminPrepare'
		'concurrent:dist'
		'symlink:js'
		'requirejs'
		'cssmin'
		'concat'
		'uglify'
		'copy'
		'rev'
		'usemin'
	]

	grunt.registerTask 'default', [
		'jshint'
		'test'
		'build'
	]
