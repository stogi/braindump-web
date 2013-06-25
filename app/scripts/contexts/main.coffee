define
	applicationName: 'Braindump'

	navigationView:
		create:
			module: 'views/NavigationView'

			args: [
				{ el: '.navigation' }
			]

		properties:
			applicationName: { $ref: 'applicationName' }

		ready: 'render'

	plugins: [
		{ module: 'wire/debug' }
	]