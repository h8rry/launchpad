var launchpad = (function () {

  return function (elementId, callbackUrl) {
    if(!elementId || !callbackUrl) {
        log("elementId or callbackUrl not provided");
        return;
    }
	var element = $('#' + elementId);
	init(element, callbackUrl);
  };

  function init(element, callbackUrl) {
  
	var wrapper = $('<div/>').addClass('launchpad-wrapper'),
		header = $('<div/>').addClass('launchpad-header'),
		body = $('<div/>').addClass('launchpad-body'),
		footer = $('<div/>').addClass('launchpad-footer');

	header.html('<h3 class="launchpad-header-text">Sign up/in with</h3>');
	footer.html('<small>by <a href="http://launchp.herokuapp.com/" target="_blank">LaunchPad</a></small>');

	var fbButton = $('<button/>').addClass('launchpad-facebook').html('Facebook'),
		liButton = $('<button/>').addClass('launchpad-linkedin').html('LinkedIn'),
		ghButton = $('<button/>').addClass('launchpad-github').html('GitHub');
		

	fbButton.on('click', function() {
		window.location = 'http://launchp.herokuapp.com/facebook/index?return_url=' + callbackUrl;
	});

	liButton.on('click', function() {
        window.location = 'http://launchp.herokuapp.com/linkedin/index?return_url=' + callbackUrl;
	});

    ghButton.on('click', function() {
        window.location = 'http://launchp.herokuapp.com/github/index?return_url=' + callbackUrl;
	});

	body.append(fbButton);
	body.append(liButton);
	body.append(ghButton);

	wrapper.append(header);
	wrapper.append(body);
	wrapper.append(footer);

	element.html(wrapper);
  }

  function log(message) {
      console.log("LaunchPad: " + message);
  }

})();