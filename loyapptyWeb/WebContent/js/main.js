var time = new Date();	
var tabStrip;

$(document).ready(function() {
	$( "input:submit, button", ".demo" ).button();
	$( ".demo" ).click(function() { return false; });

	tabStrip =  $("#tabstrip").kendoTabStrip({
		contentUrls: [
		              'profile.jsp',
		              'suscriptor.jsp',
		              'service.jsp',
//		              'alerts.jsp',
		              'credits.jsp',
		              'creditsReport.jsp',
		              'flyer.jsp',
		              ]
	}).data("kendoTabStrip");

	var getItem = function (target) {
	var itemIndex = target[0].value;
	return tabStrip.tabGroup.children("li").eq(itemIndex);
	},
	select = function(e) {
		if (e.type != "keypress" || kendo.keys.ENTER == e.keyCode)
			tabStrip.select(getItem($("#tabIndex")));
	};
    $(".selectTab").click(select);
    $("#tabIndex").keypress(select);
    $.get('jsp/firsTimeLoginLogic.jsp',function(msg){
    	if(msg.value === "YES"){
        	tabStrip.select("#profiletab");
    	}else{
        	tabStrip.select("#servicetab");
    	}
    },"json");
 /*   $.post('jsp/creditReviewLogic.jsp',function(msg){
    	$("#credits_aviable_main").before('<span id="credits_number">'+msg.credits+'</span>');
	},"json");
 */   
    $('#question_mark_1').qtip({
    	   content: 'This is an active list element',
    	   show: 'mouseover',
    	   hide: 'mouseout'
    });
    refreshCredits("low");
});

$.post('jsp/profileReviewLogic.jsp',function(msg){
	if(isCustomImageMain === '0'){
		$('#logoimage').attr('src','images/logo2.png?'+time.getTime());
	}else{
		if(msg.logo.indexOf("CAT_IMG_") != 0){
			$( '#logoimage' ).attr('src',fileBaseLoad+msg.logo+'?'+time.getTime());
		}else{
			$('#logoimage').attr('src','images/logo2.png?'+time.getTime());
		}
	}
},"json");

(function ($) {
	$.fn.qrcodeImage = function(url, id) { 
		return 'https://chart.googleapis.com/chart?cht=qr&chs=500x500&chl='+url+'&chld=H|0';
	};
})(jQuery);

//low credits dialog
var buttonOpts = {};
buttonOpts[BuyNow] = function() {
	tabStrip.select("#creditstab");
	$( this ).dialog( "close" );
};		

buttonOpts[BuyLater] = function() {
	$( this ).dialog( "close" );
};

$("#dialog_minimum_low_credits").dialog({
	autoOpen: false,
	height: 200,
	width: 450,
//	resize: "auto",
	modal: true,
	buttons: buttonOpts,close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	},beforeClose: function() {
		$( '#Credits_Dialog_Msg' ).remove();
	}
});

function refreshCredits(type){
	$.get('jsp/creditReviewLogic.jsp',function(msg){
		$('#credits_number').remove();
		$("#credits_aviable_main").before('<span id="credits_number">'+msg.credits+'</span>');
		msg.credits=msg.credits.replace(",","").replace(".","");
		if( parseInt(msg.credits,10) <=  parseInt(MinimunCredits,10)){
			$( '#dialog_minimum_low_credits' ).dialog('open');
			if( type === 'low'){
				$( '#dialog_minimum_low_credits' ).append('<p id="Credits_Dialog_Msg">'+LowCreditsMsg+'</p>'); 
			}else if( type === 'insufficient'){
				$( '#dialog_minimum_low_credits' ).append('<p id="Credits_Dialog_Msg">'+NoCreditsMsg+'</p>'); 
			}
		}
	},"json");
}