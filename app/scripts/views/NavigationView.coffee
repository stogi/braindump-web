define (require) ->

	$ = require 'jquery'

	class NavigationView

		constructor: ->
			@name

		getElement: ->
			$ "<div>#{@name}</div>"
