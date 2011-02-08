// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(".src_link").fancybox({
	'hideOnContentClick': true
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



