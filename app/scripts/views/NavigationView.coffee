define (require) ->
	Backbone = require 'backbone'

	templates = require 'templates'

	class NavigationView extends Backbone.View

		template: templates.NavigationView

		render: ->
			data =
				applicationName: @applicationName

			@$el.html @template data

			@
