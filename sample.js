/** comments */
function sign_out(){
	$("#loading").show();
	$.get("log_in",{logout:"true"},function(){
		window.location=";
	});
}
