define(['jquery'], function($) {

	var NavigationView = function() {
		this.name;
	};

	NavigationView.prototype.getElement = function() {
		return $('<div>' + this.name + '</div>');
	};

	return NavigationView;
});