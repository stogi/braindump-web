#define (require) ->
#
#	NavigationView = require 'views/NavigationView'
#
#	describe 'NavigationView', ->
#
#		applicationName = null
#		view = null
#
#		beforeEach ->
#			applicationName = 'ApplicationName'
#
#			view = new NavigationView
#			view.applicationName = applicationName
#
#		describe 'render()', ->
#
#			result = null
#
#			beforeEach ->
#				result = view.render()
#
#			it 'returns reference to view', ->
#				result.should.equal view
#
#			it 'shows application name', ->
#				$applicationName = view.$('.application-name')
#				$applicationName.should.have.length 1
#				$applicationName.text().should.equal applicationName
