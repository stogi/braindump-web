define(function(require) {
	var $ = require('jquery');
	var wire = require('wire');

	var modules = require('modules');
	var context = require('contexts/main');

	wire(context).then(function(wiredContext) {
		console.log(wiredContext.message);
		console.log('Running jQuery %s', $().jquery);

		$('.hero-unit').append(wiredContext.navigationView.getElement());
	});

	return context;
});
