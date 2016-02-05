$.post('jsp/isClientSubscribeLogic.jsp',function(msg){
		if(msg.result === "OK"){
				if(msg.value === 'true'){
					$( '#credits_Center_Table_Msg' ).fadeIn();
					if(ambient==="0"){
						$( '#credits_Staging_Purchase_Table' ).fadeIn();
					}else{
						$( '#credits_Prod_Purchase_Table' ).fadeIn();						
					}
				}
			}
},"json");

$(	
	$( '#credits_Pincode_Validate_form' ).submit(function(){		
		var vValid=true;
		var cardId=$( '#credits_Card_Id' ).val();
		var pin=$( '#credits_Card_Pin' ).val();
		
		if(cardId.length === 0){
			vValid=false;
			jAlert(CardIdNotNull, notification);
		}

		if(pin.length === 0 && vValid){
			vValid=false;
			jAlert(PinNotNull, notification);
		}
		
		if(vValid){
		   	$.post('jsp/pinCodeValidateLogic.jsp',{cardId:cardId,pin:pin},function(msg){
		   		if(msg.result === "OK"){
		   			refreshCredits('low');
		   			clearPinCode();
		   			jAlert(msg.value, notification);
		   		}else if(msg.result === "CantValidate"){
		   			jAlert(msg.value, notification);
		   		}else if(msg.result === "invalidParameters"){
		   			jAlert(msg.value, notification);
		   		}else{
		   			jAlert(msg.value, notification);
		   		}
		   	},"json");
		}
		return false;
	})	
);

function clearPinCode (){
	$( '#credits_Card_Id' ).val('');
	$( '#credits_Card_Pin' ).val('');
}

//Prepaid Card Help
$("#prepaid_card_front_Qmark").click(function () {
	$("#prepaid_card_front_dialog").dialog('open');
});

$( "#prepaid_card_front_dialog" ).dialog({
	autoOpen: false,
	height: 320,
	width: 550,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}	
});
	
$("#prepaid_card_back_Qmark").click(function () {
	$("#prepaid_card_back_dialog").dialog('open');
});

$( "#prepaid_card_back_dialog" ).dialog({
		autoOpen: false,
		height: 320,
		width: 550,
		title: help,
		modal: true,
		buttons: {
			Ok: function() {
		$( this ).dialog( "close" );
	}
}
});	
