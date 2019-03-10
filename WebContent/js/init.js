//Hook up the tweet display

$(document).ready(function() {
						   
	$(".countdown").countdown({
				date: "16 dec 2018 14:30:00",
				format: "on"
			},
			
			function() {
				// callback function
			});

});	