define
	applicationName: 'Braindump'

	navigationView:
		create:
			module: 'views/NavigationView'

			args: [
				{ el: 'header' }
			]

		properties:
			applicationName: { $ref: 'applicationName' }

		ready: 'render'

	plugins: [
		{ module: 'wire/debug' }
	]