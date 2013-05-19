var launchpad = (function () {

  return function (elementId) {
	var element = !elementId ? $('body') : $('#' + elementId);
	init(element);
  };
  
  function init(element) {
	var callbackUrl = "http://launchp.herokuapp.com/dev/userCallback";
  
	var wrapper = $('<div/>').addClass('launchpad-wrapper'),
		header = $('<div/>').addClass('launchpad-header'),
		body = $('<div/>').addClass('launchpad-body'),
		footer = $('<div/>').addClass('launchpad-footer');

	header.html('<h3 class="launchpad-header-text">LaunchPad</h3>');
	footer.html('<small>Learn more</small>');

	var fbButton = $('<button/>').addClass('launchpad-facebook').html('Facebook'),
		twButton = $('<button/>').html('Twiiter'),
		googButton = $('<button/>').html('Google');
		

	fbButton.on('click', function() {
		window.location = 'http://launchp.herokuapp.com/dev/facebook?return_url=' + callbackUrl;
	});

	twButton.on('click', function() {
		alert('yolo');
	});

	googButton.on('click', function() {
		alert('yolo');
	});

	body.append(fbButton);
	body.append(twButton);
	body.append(googButton);

	wrapper.append(header);
	wrapper.append(body);
	wrapper.append(footer);

	element.html(wrapper);
  }

})();