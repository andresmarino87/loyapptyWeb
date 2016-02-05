//funcion logout
$(document).ready(function(){
	$('#logout').click(function(){
		$.post('jsp/logoutLogic.jsp',function(msg){
			document.location='./index.jsp';
		},"json");	
	});
}); 