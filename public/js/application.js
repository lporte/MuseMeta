$(document).ready(function() {
	$('.flip-it').bind({
	    click: function() {
	        $('#js-flip .card').toggleClass('flipped');
	    },
	});
});