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

	plugins: [
		{ module: 'wire/debug' }
	]