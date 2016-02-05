/*
 * 
 * Autor: Andrés Mariño
 * 
 */
  
var aux;
var auxSocialInfo;
var d = new Date();
var map;
var geocoder;
var marker;
var lat='';
var lon='';

//google Maps
function mapInit(latitude,longitude){
	var centerCoord;
	if(latitude==='null'){
		centerCoord = new google.maps.LatLng(25.792782,-80.226116);		
	}else{
		centerCoord = new google.maps.LatLng(latitude,longitude);	
	}

	var mapOptions = {
		zoom: 8,
		center: centerCoord,
		mapTypeId: google.maps.MapTypeId.ROADMAP	
	};

	map = new google.maps.Map(document.getElementById("map"), mapOptions);

	
	if(latitude!='null'){	
		marker = new google.maps.Marker({
			position: map.getCenter(),
			map: map,
		});
	}

	google.maps.event.addListener(map, 'click', function(e) {
		if(lat!='' || latitude!='null'){
			marker.setMap(null);
		}
		placeMarker(e.latLng, map);
		latLon=e.latLng.toString();
		lat=e.latLng.toString().split(',')[0].replace('(','');
		lon=e.latLng.toString().split(',')[1].replace(')','').replace(' ','');
	});
};

function placeMarker(position, map) {
	marker = new google.maps.Marker({
		position: position,
		map: map
	});
	map.panTo(position);
}

//Funcion que carga el perfil

$(function(){
	loadProfile();
});

function loadProfile(){
	$.post('jsp/profileReviewLogic.jsp',function(msg){
		if(msg.result === 'NO'){
			jAlert(msg.value, notification);
		}else if (msg.result === 'OK'){
			aux=msg;
			$( '#profile_Save_button' ).hide();
//			$( '#profile_Logo_input').remove();
			$( '#profile_Email_input' ).val(msg.email);
			if(msg.email_verified === "true"){
				$( '#profile_Email_input' ).attr("readonly","readonly");
				$( '#validateEmailProfileButton' ).hide();
				$( '#QmarkprofileValidateEmail' ).hide();
				$( '#validImageEmailCheck' ).fadeIn( 'slow' );
			}else if(msg.email_verified === "false"){
				if(msg.showButton === "true"){
					$( '#validateEmailProfileButton' ).fadeIn( 'slow' );
					$( '#QmarkprofileValidateEmail' ).fadeIn( 'slow' );
				}else{
					$( '#profile_Email_input' ).attr("readonly","readonly");
				}
				
				$( '#validImageEmailCheck' ).hide();
			}
			
			
			$( '#profile_BN_input' ).val(msg.name);
			$( '#profile_PWD_input' ).val(msg.lClickforchange);
			$( '#profile_Website_input' ).val(msg.website);
			$( "#profile_BusinessCat_input option[value='"+msg.categoryValue+"']").attr('selected', 'selected');		
			$( '#profile_BusinessDes_input' ).val(msg.description);
			$.post('jsp/countriesLoadLogic.jsp',function(result){
				for(var i in result){					
					if(msg.country === result[i].iso){
						$( '#profile_Country_input' ).append('<option selected="selected" class="countries" value="'+result[i].iso+'">'+result[i].country+'</option>');
					}else{
						$( '#profile_Country_input' ).append('<option class="countries" value="'+result[i].iso+'">'+result[i].country+'</option>');
					}
				}
			},"json");
			$.post('jsp/citiesLoadLogic.jsp',{country:msg.country},function(result){
				for(var i in result){					
					if(msg.city_id === result[i].id){
						$( '#profile_City_input' ).append('<option selected="selected" class="cities" value="'+result[i].id+'">'+result[i].city+'</option>');
					}else{
						$( '#profile_City_input' ).append('<option class="cities" value="'+result[i].id+'">'+result[i].city+'</option>');
					}
					$( '#loadingCity').hide();
					$( '#profile_Save_button' ).fadeIn();
				}
			},"json");
			$( '#profile_Address_input' ).val(msg.address);
			$( '#profile_Zip_input' ).val(msg.zipcode);
			
			if(msg.location_relevant === "true"){
				$('#profile_LocationRelevant_input').attr('checked',true);
			}else{
				$('#profile_LocationRelevant_input').attr('checked',false);
			}
			$( '#profile_MainContact_input' ).val(msg.main_contact);
			$( '#profile_OtherContact_input' ).val(msg.other_contact);
//			$( '#add_Enterprise_logo').append( '<img id="profile_Logo_input" src="'+msg.baseImg+msg.logo+'" width="100px" />');
			$( '#profile_Logo_input' ).attr('src',msg.baseImg+msg.logo+'?'+d.getTime());
			$( '#profile_QRcode_input' ).attr('src',$().qrcodeProfile(msg.qr,msg.name)+'?'+d.getTime());
			$( '#profile_promotionalCode_input' ).val(msg.promotional_code);
			mapInit(msg.latitude,msg.longitude);			
			$.post('jsp/twitterTokenLogic.jsp',function(msg){
				$( '#profile_twitterCheck_button' ).attr('href',msg.link);
			},"json");
			$.post('jsp/profileReviewSocialInfoLogic.jsp',function(msg){
				auxSocialInfo=msg;

				if(msg.result == "OK"){
					if(msg.tw_token_id != "" ){
						$( '#valid_Image_Twitter_Check' ).fadeIn('slow');
					}else{
						$( '#profile_twitterCheck_button' ).fadeIn( 'slow' );
					}
					
					if(msg.fb_uid != "" ){
						$( '#valid_Image_Facebook_Check' ).fadeIn('slow');
					}else{
						$( '#profile_FacebookCheck_button' ).fadeIn( 'slow' );
					}				
				}else{
					$( '#profile_FacebookCheck_button' ).fadeIn( 'slow' );
					$( '#profile_twitterCheck_button' ).fadeIn( 'slow' );
				}
			},"json");
			
			var keys = (msg.keys).split(",");
			for(var i=0;i<keys.length;i++){
				if(keys[i] == 'f_name' ){
					$('#profile_Request_Sub_Parameter_Name').attr('checked',true);
				}else if(keys[i] == 'l_name' ){
					$('#profile_Request_Sub_Parameter_Last').attr('checked',true);
				}else if(keys[i] == 'email' ){
					$('#profile_Request_Sub_Parameter_Email').attr('checked',true);
				}else if(keys[i] == 'mobile' ){
					$('#profile_Request_Sub_Parameter_Mobile').attr('checked',true);
				}else if(keys[i] == 'fb' ){
					$('#profile_Request_Sub_Parameter_FB').attr('checked',true);
				}else if(keys[i] == 'tw' ){
					$('#profile_Request_Sub_Parameter_TW').attr('checked',true);
				}else if(keys[i] == 'city' ){
					$('#profile_Request_Sub_Parameter_City').attr('checked',true);
				}else if(keys[i] == 'zip' ){
					$('#profile_Request_Sub_Parameter_Zip').attr('checked',true);
				}else if(keys[i] == 'other' ){
					$('#profile_Request_Sub_Parameter_Other').attr('checked',true);
				}
			}
			$('#profile_Facebook_Input').val(msg.facebook);
			$('#profile_Twitter_Input').val(msg.twitter);

			//Flyer Promotional Code
			$( '.flyer_Promotional_Code' ).empty();
			$( '#flyer_Text_Slogan_BusinessName' ).val(msg.name);
			$( '#flyer_Promotional_Code_Append' ).append("<span class='flyer_Promotional_Code txt_blue'>"+promotionalMsgTag+":"+msg.promotional_code+"</span>");
			$( '#flyer_QRcode_image' ).attr('src',$().qrcodeImage(msg.qr,msg.name)+'?'+time.getTime());
			
		}
	},"json");
	
} 

//cambio ciudad / pais

$( '#profile_Country_input' ).change(function(){
	$( '#profile_Save_button' ).hide();
	$( '#loadingCity').show();
	$( '.cities' ).remove();
	$.post('jsp/citiesLoadLogic.jsp',{country:$("#profile_Country_input").val()},function(msg){
		for(var i in msg){					
			$( '#profile_City_input' ).append('<option class="cities" value="'+msg[i].id+'">'+msg[i].city+'</option>');
			$( '#loadingCity').hide();
			$( '#profile_Save_button' ).fadeIn();
		}
	},"json");		
}); 

//click change password

$('#profile_PWD_input').click(function (){
	aux.type=1;
	$( "#dialog_change_password_form" ).dialog( "open" );
});

//Salvar perfil

$( '#profile_Save_button' ).click(function(){
	var name = $( '#profile_BN_input' ).val();
	var address = $( '#profile_Address_input' ).val();
	var description = $( '#profile_BusinessDes_input' ).val();
	var zip = $( '#profile_Zip_input' ).val();
	var mainContact= $( '#profile_MainContact_input' ).val();
	var otherContact=$( '#profile_OtherContact_input' ).val();
	var website = $( '#profile_Website_input' ).val();
	var email = $( '#profile_Email_input' ).val();
	var promotionalCode= $( '#profile_promotionalCode_input' ).val();
	var pass=true;
	var location=0;
	var RequestParameters="";
	var changeFB="0";
	var changeTW="0";



	if($( '#profile_Email_input' ).val() === "" ){
		email = aux.email;
	}	
	
	if($( '#profile_BN_input' ).val() === ""){
		name = aux.name;
	}	
	if($( '#profile_Address_input' ).val() === ""){
		address = "N/A";
	}
	if($( '#profile_BusinessDes_input' ).val() === ""){
		description = "N/A";
	}
	if($( '#profile_Zip_input' ).val() === ""){
		zip = "N/A";
	}
	if($( '#profile_MainContact_input' ).val() === ""){
		mainContact = "N/A";
	}
	if($( '#profile_OtherContact_input' ).val() === ""){
		otherContact = "N/A";
	}
	if($( '#profile_Website_input' ).val() === ""){
		website = "N/A";
	}
	
	if($( '#profile_LocationRelevant_input' ).is(":checked")){
		location="1";
	}
	if(	!checkValidEmail(email)){
		pass=false;
	}	
	if( $( '#profile_promotionalCode_input' ).val() === "" ){
		promotionalCode=aux.promotional_code;
	}
	
	if( lat === '' ){
		lat=aux.latitude;
		lon=aux.longitude;
	}
	
	if(aux.facebook !== $('#profile_Facebook_Input').val()){
		changeFB="1";
	}
	if(aux.twitter !== $('#profile_Twitter_Input').val()){
		changeTW="1";
	}
	
	RequestParameters = $('.profile_Request_Subscriptor_Parameters').map(function(i,n) {
		if($(this).is(':checked')){
			return $(n).val();
		}
	}).get().join(';;');
		
	if(pass){
		$.post('jsp/profileEditLogic.jsp',{
			email:email,
			name: name,
			address:address,
			description:description,
			zip:zip,
			mainContact:mainContact,
			category:$( "#profile_BusinessCat_input").val(),
			otherContact:otherContact,
			cityId:$( '#profile_City_input' ).val(),
			website:website,
			locationRelevant:location,
			promotionalCode:promotionalCode,
			latitude:lat,
			longitude:lon,
			keys:RequestParameters,
			facebook:$('#profile_Facebook_Input').val(),
			twitter:$('#profile_Twitter_Input').val(),
			changeFB:changeFB,
			changeTW:changeTW,
			fb_access_token:auxSocialInfo.fb_access_token,
			fb_uid:auxSocialInfo.fb_uid,
			tw_token_id:auxSocialInfo.tw_token_id,
			tw_token_secret:auxSocialInfo.tw_token_secret
			},
			
			function(msg){
				if(msg.result === 'OK'){
					lat='';
					jAlert(msg.value, notification);
					$("#tabstrip").data("kendoTabStrip").reload($( '#profiletab' ));
				}else{
					jAlert(msg.value, notification);
				}	
		},"json");
	}else{
		jAlert(emailNotValid, notification);
	}	
});

$( '#profile_Cancel_button' ).click(function(){
	$.post('jsp/profileUploadImageCancelLogic.jsp');
	$("#tabstrip").data("kendoTabStrip").reload($( '#profiletab' ));
});

//funciones que modifican la contraseña

function pwdLength( pwd ) {
	if ( pwd.val().length < 6 ) {
		$( '#errorProfilePwdNULL' ).fadeIn();
		return false;
	} else {
		return true;
	}
}

function pwdEquals( pwd, pwd2 ) {
	if ( pwd.val() !== pwd2.val() ) {
		$( '#errorProfilePWDNM' ).fadeIn();
		return false;
	} else {
		return true;
	}
};
	

$(document).ready(function() {
$( "input:submit, button", ".demo" ).button();
$( ".demo" ).click(function() { return false; });


});

//File Uploader
var uploader1 = new qq.FileUploader({
    element: document.getElementById('file-uploader-profile'),
    sizeLimit: 1024*400, 
    action: 'jsp/imageProfileUpload.jsp',
    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],        
    debug: true
});    

$("#Qmarkprofile").live('click', function () {
	$("#Qmarkprofile_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$( "#Qmarkprofile_dialog" ).dialog({
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
});

$("#Qmark_logo").live('click', function () {
	$("#Qmark_logo_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$( "#Qmark_logo_dialog" ).dialog({
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
});

var buttonOpts = {};
buttonOpts["Ok"] = function () {
	$( '#errorProfilePwdNULL' ).hide();
	$( '#errorProfilePWDNM' ).hide();
	var pwd = $( "#new_password" ),
	pwd2 = $( "#new_password_2" );
	var bValid = true;
	bValid = bValid && pwdLength(pwd);
	bValid = bValid && pwdEquals(pwd,pwd2);
	if ( bValid ) {
		$.post('jsp/profileChangePasswordLogic.jsp',{
			profileEditBox:pwd.val(),
			type:aux.type},function(msg){
				if(msg.result === 'OK'){
					$( ".labelP" ).remove();
					jAlert(msg.value, notification);
				 	loadProfile();
				}else if(msg.result === 'NO'){
					jAlert(msg.value, notification);
				}
			},"json");
		$( this ).dialog( "close" );
	}
};

buttonOpts[cancel] = function () {
	$( this ).dialog( "close" );
};
$( "#dialog_change_password_form" ).dialog({
	autoOpen: false,
	height: 305,
	width: 430,
	modal: true,
	buttons: buttonOpts,
		close: function() {
	},beforeClose: function() { 
		$( '#errorProfilePwdNULL' ).hide();
		$( '#errorProfilePWDNM' ).hide();
		$( "#new_password" ).val("");
		$( "#new_password_2" ).val("");
	}
});

(function ($) {
	$.fn.qrcodeProfile = function(url, id) { 
		return 'https://chart.googleapis.com/chart?cht=qr&chs=500x500&chl='+url+'&chld=H|0';
//		return 'http://www.sparqcode.com/qrgen?qt=url&data='+url+'&group=13P&nocap=1&ecc=H&tags='+service;
	};
})(jQuery);

$("#Qmark_qrcode").click(function () {
	$("#Qmark_qrcode_dialog").dialog('open');
});

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

$("#QmarkprofileValidateEmail").click(function () {
	$("#Qmark_validate_dialog").dialog('open');
});

$( "#Qmark_validate_dialog" ).dialog({
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


$("#Qmark_promotionalCode").click(function () {
	$("#Qmark_promotionalCode_dialog").dialog('open');
});

$( "#Qmark_promotionalCode_dialog" ).dialog({
	autoOpen: false,
	height: 360,
	width: 550,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});

$("#Qmark_twitterCheck").click(function () {
	$("#Qmark_twitter_dialog").dialog('open');
});

$( "#Qmark_twitter_dialog" ).dialog({
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

$("#Qmark_facebookCheck").click(function () {
	$("#Qmark_facebook_dialog").dialog('open');
});

$( "#Qmark_facebook_dialog" ).dialog({
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

$( '#Qmark_Request_Sub_Parameter' ).click(function(){
	$( '#Qmark_Request_Sub_Parameter_dialog' ).dialog( 'open' ); 
});

$( "#Qmark_Request_Sub_Parameter_dialog" ).dialog({
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

//check Valid Email
function checkValidEmail(email){
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  if(emailReg.test(email)){
		  return true;
	  }else{
		  return false;
	  }
}

$( '#validateEmailProfileButton' ).click(function(){
	$.post('jsp/validateEmailLogic.jsp',function(msg){
		if(msg.result === 'OK'){
			jAlert(msg.value, notification);
			$( '#validateEmailProfileButton' ).hide('slow');
			$( '#QmarkprofileValidateEmail' ).hide();
			$( '#profile_Email_input' ).attr("readonly","readonly");
		}else{
			jAlert(msg.value, notification);
		}	
	},"json");
});

function randomString(){
	var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	var string_length = 8;
	var randomstring = '';
	for (var i=0; i<string_length; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		randomstring += chars.substring(rnum,rnum+1);
	}
	return randomstring;
}

$( '#profile_Add_Random_PromotionalCode' ).click(function(){
	$( '#profile_promotionalCode_input' ).val(randomString());
});