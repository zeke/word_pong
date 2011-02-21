$(document).ready(function(){
	$('#form').center();
	$('#pong').focus();
	
	Mode.set('antonymy');
});

$(window).resize(function() {
	$('#form').center();
});

jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", ( $(window).height() - this.height() ) / 2+$(window).scrollTop() + "px");
    this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft() + "px");
    return this;
};

Mode = {
	set: function(mode) {
		log(mode);
		log(configatron('modes.' + mode));
		$.setCookie('mode', mode); // store mode in a cookie
		$('#mode_display').html(configatron('modes.' + mode)); // update mode label
		$('#mode').val(mode); // update hidden form field
		$('ul.mode_select li a').removeClass('active'); // remove active style from all mode-switching links
		$('a#' + mode + '_mode_select').addClass('active'); // style the active mode-switching link
	}
};

// Logging function that accounts for browsers that don't have window.console
function log(m) {
	if (window.console) console.log(m);
}