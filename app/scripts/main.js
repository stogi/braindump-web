require.config({
	paths: {
		jquery: '../bower_components/jquery/jquery',
		bootstrap: 'vendor/bootstrap'
	},

	packages: [
		{ name: 'meld', location: '../bower_components/meld', main: 'meld' },
		{ name: 'poly', location: '../bower_components/poly', main: 'poly' },
		{ name: 'wire', location: '../bower_components/wire', main: 'wire' },
		{ name: 'when', location: '../bower_components/when', main: 'when' }
	],

	shim: {
		bootstrap: {
			deps: ['jquery'],
			exports: 'jquery'
		}
	}
});

require([
	'wire',
	'contexts/main',
	'jquery',
	'bootstrap'
], function(
	wire,
	context,
	$
) {
	wire(context).then(
		function(wiredContext) {
			console.log(wiredContext.message);
			console.log('Running jQuery %s', $().jquery);

			$('.hero-unit').append(wiredContext.navigationView.getElement());
		},
		function(error) {
			console.log(error);
			throw error;
		}
	);
}, function(e) { throw e; });

//require([
//	'wire!contexts/main',
//	'jquery',
//	'bootstrap'
//], function(
//	context,
//	$
//) {
//	console.log(context.message);
//	console.log('Running jQuery %s', $().jquery);
//
//	$('.hero-unit').append(context.navigationView.getElement());
//});