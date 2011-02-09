// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


//$(".settings_link").fancybox({
////	'hideOnContentClick': true,
////	'transitionIn'	:	'elastic',
////	'transitionOut'	:	'elastic',
//	'speedIn'		:	600, 
//	'speedOut'		:	200
////	'overlayShow'	:	false,
////	'width'			:	800,
////	'height'			: 600

//});


	$(".settings_link").fancybox({
		'width'				: '75%',
		'height'				: '75%',
		'autoScale'     	: false,
		'transitionIn'		: 'none',
		'transitionOut'	: 'none',
		'type'				: 'iframe'
	});



$(function(){
	if ( $("#microposts").length>0 ){
		setTimeout(updateMicroposts,5000);
	}
});

function updateMicroposts() {  
	var current_user=$("#microposts").attr("data-current_user");
	$.getScript("/users/" + current_user + "/microposts.js")
	setTimeout(updateMicroposts, 5000);  
}  



