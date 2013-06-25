define (require) ->
	NavigationView = require 'views/NavigationView'
	templates = require 'templates'

	describe 'NavigationView', ->

		view = null

		beforeEach ->
			view = new NavigationView
			view.template = templates.NavigationView

		describe 'render()', ->

			it 'returns reference to view', ->
				view.render().should.be.equal view

			it 'appends template', ->
				console.log view.render().el
				view.render().$('.navbar').should.have.length 1
