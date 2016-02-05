var counter = 0;
var interval;
var TimeInterval=1;

function countDown(){
	counter = 0;
	interval = setInterval(function() {
	    counter++;
	    if(counter == TimeInterval){
	    	clearInterval(interval);
			hideTwitterErrors();
			document.location='./index.jsp';
	    }else if (counter % 1 == 0) {
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

function hideTwitterErrors(){
	$( '.twitterErrors' ).hide();	
}

$(document).ready(function () {
	$( '#Tform' ).submit(function(){
//		hideTwitterErrors();
		var vValid=true;
		var email=$( '#EmailT' ).val();
		var name=$( '#BussinesNameT' );
		var businessCategory=$( '#BussinesCategoryT' ).val();

		if(email.length<1){
			alert(EmailNotNull);
//			$( '#errorTEmailRNULL' ).fadeIn();
			vValid=false;
		}else{
			if(!(checkValidEmail(email))){
				alert(EmailNotValid);
				//$( '#errorTValidEmail' ).fadeIn();
				vValid=false;
			}
		}
		
		if(name.val().length < 1 ){
			alert(ErrorRNameNULL);
			//$( '#errorTNameNULL' ).fadeIn();
			vValid=false;
		}
		
		if(businessCategory == "0"){
			alert(ErrorRBCNULL);
			//$( '#errorTBCNULL' ).fadeIn();
			vValid=false;
		}	
		
		if(vValid){
			$.post('jsp/registrationByTwitterLogic.jsp',{				
				email:email,
				name:name.val(),
				businessCategory:businessCategory,			
				TToken:TToken,
				TSecret:TSecret,
				TWho:TWho
				},function(msg){
					if(msg.result === 'OK'){
						document.location='./main.jsp';
					}else if(msg.result === "alreadyExist" ){
						alert(msg.value);
					}else if(msg.result === "alreadyExistSendRedirect" ){
						alert(AlreadyRegisteredToIndex);
//						$( '#errorTRedirectToIndex' ).fadeIn('slow');
						//countDown();
						document.location='./index.jsp';
					}else if(msg.result === "NO" ){
						alert(msg.value);
					}
			},"json");
		}
		return false;
	});
});