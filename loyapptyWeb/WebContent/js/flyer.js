var time = new Date();
var aux;

$(function(){
	addName();
});

function addName(){
	$.post('jsp/profileReviewLogic.jsp',function(msg){
		aux=msg;
		$( '#flyer_Text_Slogan_BusinessName' ).val(msg.name);
		$( '.flyerPromotionalCode' ).empty();
		$( '#flyer_Promotional_Code_Append' ).append("<span class='flyer_Promotional_Code flyer_txt_blue'>"+promotionalMsgTag+": </span><span class='flyer_Promotional_Code'>"+msg.promotional_code+"</span>");
		$( '#flyer_Logo_input' ).attr('src',msg.baseImg+msg.logo+'?'+time.getTime());
		$( '#flyer_QRcode_image' ).attr('src',$().qrcodeImage(msg.qr,msg.name)+'?'+time.getTime());
	},"json");
}

$("#Qmark_qrcode").click(function () {
	$("#Qmark_qrcode_dialog").dialog('open');
});

/*
$("#flyer_Print_button").click(function () {
	$( '#flyer_wrapper' ).jqprint();
});
*/

$("#flyer_Print_button").click(function () {
	var mywindow = window.open();	
	mywindow.document.write('<html><head><link rel="stylesheet" type="text/css" href="css/styles.css" media="screen, print"/><link rel="stylesheet" type="text/css" href="css/styles.css" media="print"/></head><body>');
	mywindow.document.write('<div id="flyer_wrapper" ><table><tr><td><div id="flyer_container"><table width="95%" border="0" cellspacing="2" cellpadding="2"><tr>');
	mywindow.document.write('<td width="41%"><img id="flyer_Logo_input" src="'+aux.baseImg+aux.logo+'?'+time.getTime()+'" /></td><td width="59%" class="flyer_round_corners_back">');
	mywindow.document.write('<textarea name="txa_slogan" id="flyer_Text_Slogan_BusinessName" class="flyer_round_corners flyer_textarea" cols="45" rows="3" title="slogan">'+$('#flyer_Text_Slogan_BusinessName').val()+'</textarea>');
	mywindow.document.write('</td></tr><tr><td colspan="2" class="flyer_round_corners_back"><textarea name="txa_description" id="txa_description"  class="flyer_round_corners flyer_textarea"cols="45" rows="7">'+$('#txa_description').val()+'</textarea>');
	mywindow.document.write('</td></tr></table></div></td><td rowspan="2"><div id="flyer_qrcode" ><div id="hd_qr" class="flyer_qr_text flyer_round_top" style="float:right;"> <span class="flyer_txt_blue">'+scanThisMsgTag+'</span></div>');
	mywindow.document.write('<div id="flyer_QR"><img id="flyer_QRcode_image" src="'+$().qrcodeImage(aux.qr,aux.name)+'?'+time.getTime()+'" align="middle"/></div><div id="qr_code" class="flyer_qr_text flyer_round_bottom" style="float:left;"><span id="flyer_Promotional_Code_Append" class="flyer_txt"><span class="flyer_Promotional_Code flyer_txt_blue">'+promotionalMsgTag+': </span><span class="flyer_Promotional_Code">'+aux.promotional_code+'</span></span></div></div>');
	mywindow.document.write('</td></tr><tr><td><div></div><div class="flyer_cellphone_class"><img id="flyer_cellphone" src="images/imgApps.png" /></div></td></tr></table></div></body></html>');	
	
//	mywindow.document.write('<div id="contInnerWhite" style="display:inline-block;"><div id="flyerLeftContainer" style="float:left;width:50%;text-align:center;">');
//	mywindow.document.write('<br/><br/><span id="promotionalCode"><span style="font-size:20px;">'+promotionalMsgTag+':'+msg.promotional_code+'</span></span>');
//	mywindow.document.write('<img id="profile_QRcode_input" src="'+$().qrcodeProfile(msg.qr,msg.name)+'?'+d.getTime()+'" width="100%" align="left" /></div>');
//	mywindow.document.write('<div id="flyerRightContainer" style="width:50%;float:right;"><div id="flyerBusinessName"><p>'+msg.name+'</p></div>');
//	mywindow.document.write('<textarea id="flyerInputText">'+$("#flyerInputText").val()+'</textarea></div></div></body></html>');

	mywindow.document.close();	
	mywindow.print();
});

function openFlyerPrint(){
	window.open("http://www.w3schools.com");
}

$( "#Qmark_qrcode_dialog" ).dialog({
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

function shareTwitter(){
	var aux;
	$.post('jsp/profileReviewLogic.jsp',function(msg){
		aux=msg.name;
	    var url = "https://twitter.com/intent/tweet?url="+window.location+"&text="+aux+": "+encodeURIComponent($('#txa_description').val())+"";
	    var windowName = "popUp";
	    var windowSize = "1";
	    window.open(url, windowName, windowSize);
	    event.preventDefault();
	},"json");
	

}
function shareFacebook(){
	var aux;
	var loyappty;
	$.post('jsp/profileReviewLogic.jsp',function(msg){
		aux=msg.name;
		loyappty = "Loyappty";
	    var url = "https://www.facebook.com/dialog/feed?";
		  url += "app_id="+facebookAppId+"&";
		  url += "link=http://loyappty.com/app&";
//		  url += "picture="++"&";
		  url += "name="+aux+"&";
		  url += "caption="+aux+"&";
		  url += "description="+encodeURIComponent($('#txa_description').val())+"&";
		  url += "redirect_uri="+thisServerBase;
	    var windowName = "popUp";
	    var windowSize = "1";
	    window.open(url, windowName, windowSize);
	    event.preventDefault();
	},"json");
}

//function shareEmail(){
//	$.post('jsp/profileReviewLogic.jsp',function(msg){
//		aux=msg.name;
//		document.location = "mailto:?subject="+aux+"&body="+$('#textArea').val()+"";
//	},"json");
//}

function buildDialog(id, title, width, height) {
	$.post('jsp/profileReviewLogic.jsp',function(msg){
		aux=msg.name;
		loyappty = "Loyappty";
	    var url = "https://www.facebook.com/dialog/feed?";
		  url += "app_id=123050457758183&";
		  url += "link=http://localhost:9090/loyapptyWeb/&";
//		  url += "picture="++"&";
		  url += "name="+aux+"&";
		  url += "caption="+aux+"&";
		  url += "description="+$('#txa_description').val()+"&";
		  url += "redirect_uri=http://www.example.com/response";
	var dialog = $('<div id="' + id + '"></div>').html(
			 '<br/><br/><div align="center"> <table><tr><td><a onClick=\'shareFacebook(); return false;\' target="_blank"> <img src="images/icon_facebook.png" alt="facebook" width="64" height="64" align="right" border="0" /></a><a onClick=\'shareTwitter(); return false;\' target="_blank"><img src="images/icoTw.png" alt="Follow Us on Twitter" width="64" height="64" border="0" align="right" /></a></td></tr><tr><td align="center"><input type="button" id="but' + id + '" value="'+closeButton+'" onClick=\'$("#' + id + '").dialog("close"); $("#' + id + '").remove(); return false;\' class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"/></td></tr></table> </div>').dialog({
				autoOpen : false,
				title : title,
				modal : true,
				resizable : false,
				closeOnEscape : false,
				minHeight : height,
				minWidth : width,
				height : 100,
				width : 400,
				open : function(event, ui) {
					$(this).parent().children().children(
							'.ui-dialog-titlebar-close').hide();
				}
			});
	if (title == null) {
		dialog.siblings('div.ui-dialog-titlebar').remove();
	}
	dialog.dialog('open');

	},"json");
}

$("#flyer_Share_button").click(function(){
	buildDialog("t1", null, "prueba", 400,100);
});