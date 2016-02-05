var counter = 0;
var interval;
var TimeInterval=1;

function countDown(){
	counter = 0;
	interval = setInterval(function() {
	    counter++;
	    if(counter == TimeInterval){
	    	clearInterval(interval);
	    	hideFacebookErrors();
			document.location='./index.jsp';
	    }else if (counter % 1 == 0) {
//	        $( '#text' ).remove();
//	        $( '#validateEmailMiddle' ).append('<span id="text">'+(TimeInterval - counter)+'</span>');
	    } 
	}, 1000);
}

function checkValidEmail(email){
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  if(emailReg.test(email)){
		  return true;
	  }else{
		  return false;
	  }
}

function hideFacebookErrors(){
	$( '.facebookErrors' ).hide();	
}

$(document).ready(function () {
	$( '#FBform' ).submit(function(){
//		hideFacebookErrors();
		var vValid=true;
		var name=$( '#BussinesNameFB' );
		var businessCategory=$( '#BussinesCategoryFB' ).val();
		
		if(name.val().length < 1 ){
			alert(ErrorRNameNULL);
//			$( '#errorFBNameNULL' ).fadeIn();
			vValid=false;
		}
		
		if(businessCategory == "0"){
			alert(ErrorRBCNULL);
//			$( '#errorFBBCNULL' ).fadeIn();
			vValid=false;
		}
		
		if(vValid){
			$.post('jsp/registrationByFacebookLogic.jsp',{				
				name:name.val(),
				businessCategory:businessCategory,			
				FBId:FBId,
				FBEmail:FBEmail
				},function(msg){
					if(msg.result === 'OK'){
						document.location='./main.jsp';
					}else if(msg.result === "alreadyExist" ){
						alert(msg.value);
					}else if(msg.result === "alreadyExistSendRedirect"){
//						$( '#errorFBRedirectToIndex' ).fadeIn('slow');
						alert(AlreadyRegisteredToIndex);
					//	countDown();
						document.location='./index.jsp';
					}else if(msg.result === "NO" ){
						alert(msg.value);
					}
			},"json");
		}
		return false;
	});
});