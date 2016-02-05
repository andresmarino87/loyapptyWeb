/*
 * 
 * Autor: Andrés Mariño
 * 
 */

//Se valida el login

$(function(){
	$( '#login_form' ).submit(function(){		
		hideIndexErrors();
		var vValid=true;
		var aux=$( '#language_select' ).val();
		var email=$('#email');
		var password=$('#password');
		var cookieCheck='0';
		
		//Verifications
		if(email.hasClass("watermark") && vValid){
			jAlert(EmailNotNull, notification);
			vValid=false;
		}else{
			if(!(checkValidEmail(email.val())) && vValid){
				jAlert(EmailNotNull, notification);
				vValid=false;
			}
		}

		if(password.hasClass("watermark") && vValid){
			jAlert(PwdNotNull, notification);
			vValid=false;
		}else{
			if(password.val().length<6){
				jAlert(PwdNotNull, notification);
				vValid=false;	
			}
			
		}
		
		if($('#index_Remember_Me').is(":checked")){
			cookieCheck='1';
		}
		
		setLanguage( aux );		
		if(vValid){
			$.post('jsp/loginLogic.jsp',{email:email.val(),password:password.val(),cookieCheck:cookieCheck,isCustom:isCustom},function(msg){		
				if(msg.result === 'OK'){
					document.location='./main.jsp';
				}else if(msg.result === 'InvalidPwd'){
					jAlert(msg.value, notification);
				}else if(msg.result === 'NO'){
					jAlert(msg.value, notification);
				}else if(msg.result === 'FATAL'){
					jAlert(msg.value, notification);
					document.location='./index.jsp';
				}		
			},"json");
		}
		return false;
	});
});