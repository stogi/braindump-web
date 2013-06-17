define
	message: 'Hello World! Again!'

	navigationView:
		create: 'views/NavigationView'
		properties:
			name: $ref: 'message'
