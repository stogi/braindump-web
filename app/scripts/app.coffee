define (require) ->
	modules = require 'modules'

	wire = require 'wire'
	context = require 'contexts/main'

	wire context
