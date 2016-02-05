/*
 * 
 * Autor: Andr�s Mari�o
 * 
 */


/*
 * 
 * New Index
 * 
 */
var time = new Date();	

$(document).ready(function () {
	var watermarkEmail = EmailTxt;
	var watermarkPass = PasswordTxt;
	var watermarkBus1 = BusinessNameTxt;
	var watermarkBus2 = EmailTxt;
	var watermarkBus3 = PasswordTxt;
//	var watermarkBus4 = 'Choose a Category';
	var watermarkBus5 = PasswordConfirmTxt;
		
	$('#email').blur(function () {
		if ($(this).val().length == 0)
			$(this).val(watermarkEmail).addClass('watermark');
	}).focus(function () {
		if ($(this).val() == watermarkEmail)
			$(this).val('').removeClass('watermark');
	}).val(watermarkEmail).addClass('watermark');

			//Replaced with placeholder attribute
	$('#password').blur(function () {
		if ($(this).val().length == 0){
			$(this).val(watermarkPass).addClass('watermark');
			var pass = document.getElementById('password');
			pass.type = 'text';
		}
	}).focus(function () {
		if ($(this).val() == watermarkPass){
			$(this).val('').removeClass('watermark');
			var pass = document.getElementById('password');
			pass.type = 'password';
	}
	}).val(watermarkPass).addClass('watermark');

	$('#businessName').blur(function () {
		if ($(this).val().length == 0)
			$(this).val(watermarkBus1).addClass('watermark');
	}).focus(function () {
		if ($(this).val() == watermarkBus1)
			$(this).val('').removeClass('watermark');
	}).val(watermarkBus1).addClass('watermark');

	$('#businessEmail').blur(function () {
		if ($(this).val().length == 0)
			$(this).val(watermarkBus2).addClass('watermark');
	}).focus(function () {
		if ($(this).val() == watermarkBus2)
			$(this).val('').removeClass('watermark');
	}).val(watermarkBus2).addClass('watermark');

			//Replaced with placeholder attribute
	$('#businessPass').blur(function () {
		if ($(this).val().length == 0){
			$(this).val(watermarkBus3).addClass('watermark');
			var pass = document.getElementById('businessPass');
			pass.type = 'text';

		}
	}).focus(function () {
		if ($(this).val() == watermarkBus3){
			$(this).val('').removeClass('watermark');
			var pass = document.getElementById('businessPass');
			pass.type = 'password';

		}
	}).val(watermarkBus3).addClass('watermark');
				
			//Replaced with placeholder attribute
	$('#businessConfirmPass').blur(function () {
		if ($(this).val().length == 0){
			$(this).val(watermarkBus5).addClass('watermark');	
			var pass = document.getElementById('businessConfirmPass');
			pass.type = 'text';

		}
	}).focus(function () {
		if ($(this).val() == watermarkBus5){	
			$(this).val('').removeClass('watermark');
			var pass = document.getElementById('businessConfirmPass');
			pass.type = 'password';

		}
	}).val(watermarkBus5).addClass('watermark');
			
	//Forgot Password

	/*
	 *verificaciones de que no este vacio los campos
	 */

	//Registration Form
	$( '#registration_form' ).submit(function(){
		hideIndexErrors();
		var vValid=true;
		var name = $( '#businessName' );
		var businessCategory = $( '#businessCategory' ).val();
		var email = $( '#businessEmail' );
		var pwd = $( '#businessPass' );
		var pwdC= $( '#businessConfirmPass' );
				
		if(name.hasClass('watermark') && vValid ){
   			jAlert(ErrorGenericNULL, notification);
			vValid=false;
		}
		
		if(email.hasClass('watermark') && vValid){
   			jAlert(ErrorGenericNULL, notification);
			vValid=false;

		}else{
			if(!(checkValidEmail(email.val())) && vValid){
	   			jAlert(ErrorGenericNULL, notification);
				vValid=false;
			}
		}
		
		if(pwd.hasClass('watermark') && vValid){
   			jAlert(ErrorGenericNULL, notification);
			vValid=false;
		}else{
			if(pwd.val().length<6 && vValid){
	   			jAlert(ErrorGenericNULL, notification);
				vValid=false;
			}
		}

		if(businessCategory === '0' && vValid){
   			jAlert(ErrorGenericNULL, notification);
			vValid=false;
		}
			
		if(pwd.val() !== pwdC.val() && vValid){
   			jAlert(ErrorRPWDNM, notification);
			vValid=false;
		}
		
		if(vValid){
			$.post('jsp/registrationLogic.jsp',{				
				name:name.val(),
				businessCategory:businessCategory,			
				email:email.val(),
				pwd:pwd.val(),
				actualLanguage: $( '#language_select' ).val(),
				rest:""
				},function(msg){
					if(msg.result === 'OK'){
						setLanguage( $( '#language_select' ).val() );
						$.post('jsp/loginLogic.jsp',{email:email.val(),password:pwd.val(),cookieCheck:"0",isCustom:"0"},function(res){
							if(res.result === 'OK'){
								document.location='./main.jsp';
							}else if(res.result === 'InvalidPwd'){
							}else{
							}
						},"json");
					}else if(msg.result === "alreadyExist" ){
			   			jAlert(msg.value, notification);
					}else if(msg.result === "NO" ){
			   			jAlert(msg.value, notification);
					}
			},"json");
		}
		return false;
	});

	//load Twitter Button
	$.post('jsp/twitterTokenLogic.jsp?type=index&lan='+language,function(msg){
		$( '.index_Twitter_Button' ).attr('href',msg.link);		
	},"json");
	
	//Load cookie (if exist)
	$.post('jsp/loginCookieLogic.jsp',function(msg){
		if(msg.result === 'OK'){
			$( '#email' ).val(msg.userName);
			$( '#email' ).removeClass('watermark');
			$( '#index_Remember_Me' ).attr('checked',true);
		}else{
			$( '#index_Remember_Me' ).attr('checked',false);
		}
		
	},"json");
	
});

function picture(content)
{
	var body = document.getElementById('body');
	var butPic1 = document.getElementById('butPic1');
	var butPic2 = document.getElementById('butPic2');
	var butPic3 = document.getElementById('butPic3');
	var butPic4 = document.getElementById('butPic4');
	var butPic5 = document.getElementById('butPic5');
	
	switch (content) {
		case '1':
		body.setAttribute('class', 'body1');
		butPic1.src="images/butBlueOn.png";
		butPic2.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '2':
		body.setAttribute('class', 'body2');
		butPic2.src="images/butBlueOn.png";
		butPic1.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '3':
		body.setAttribute('class', 'body3');
		butPic3.src="images/butBlueOn.png";
		butPic1.src="images/butBlue.png";
		butPic2.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '4':
		body.setAttribute('class', 'body4');
		butPic4.src="images/butBlueOn.png";		
		butPic1.src="images/butBlue.png";
		butPic2.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '5':
		body.setAttribute('class', 'body5');
		butPic5.src="images/butBlueOn.png";
		butPic1.src="images/butBlue.png";
		butPic2.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		break;
	
	}
	
}

function picture_es(content)
{
	var body = document.getElementById('body');
	var butPic1 = document.getElementById('butPic1');
	var butPic2 = document.getElementById('butPic2');
	var butPic3 = document.getElementById('butPic3');
	var butPic4 = document.getElementById('butPic4');
	var butPic5 = document.getElementById('butPic5');
	
	switch (content) {
		case '1':
		body.setAttribute('class', 'body1_es');
		butPic1.src="images/butBlueOn.png";
		butPic2.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '2':
		body.setAttribute('class', 'body2_es');
		butPic2.src="images/butBlueOn.png";
		butPic1.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '3':
		body.setAttribute('class', 'body3_es');
		butPic3.src="images/butBlueOn.png";
		butPic1.src="images/butBlue.png";
		butPic2.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '4':
		body.setAttribute('class', 'body4_es');
		butPic4.src="images/butBlueOn.png";		
		butPic1.src="images/butBlue.png";
		butPic2.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic5.src="images/butBlue.png";
		break;
		
		case '5':
		body.setAttribute('class', 'body5_es');
		butPic5.src="images/butBlueOn.png";
		butPic1.src="images/butBlue.png";
		butPic2.src="images/butBlue.png";
		butPic3.src="images/butBlue.png";
		butPic4.src="images/butBlue.png";
		break;
	
	}
	
}

function showHide(elementId) {
	var element=document.getElementById(elementId);
	if(element.style.display == 'block') {
		element.style.display = 'none';
	} else {
		element.style.display = 'block';
	}
}

//Used for input type password placeholder attribute in IE and old browsers
$(function() {
var input = document.createElement("input");
if(('placeholder' in input)==false) { 
	$('[placeholder]').focus(function() {
		var i = $(this);
		if(i.val() == i.attr('placeholder')) {
			i.val('').removeClass('placeholder');
			if(i.hasClass('password')) {
				i.removeClass('password');
				this.type='password';
			}			
		}
	}).blur(function() {
		var i = $(this);	
		if(i.val() == '' || i.val() == i.attr('placeholder')) {
			if(this.type=='password') {
				i.addClass('password');
				this.type='text';
			}
			i.addClass('placeholder').val(i.attr('placeholder'));
		}
	}).blur().parents('form').submit(function() {
		$(this).find('[placeholder]').each(function() {
			var i = $(this);
			if(i.val() == i.attr('placeholder'))
				i.val('');
		});
	});
}
});	

//Set Language
function  setLanguage( aux ) {
	$.post('jsp/languageSetLogic.jsp',{language:aux});
} 

//Configura el idioma de acuerdo a la selecci�n 
$( '#language_select' ).change(function(){
	var lan=$( '#language_select' ).val();
	setLanguage( $( '#language_select' ).val() );	
	if(lan === "0"){
		document.location='./index.jsp?lan=ES';
	}else if(lan === "1"){
		document.location='./index.jsp?lan=EN';
	}
}); 

function hideIndexErrors(){
	$( '.indexErrors' ).hide();	
}

function checkValidEmail(email){
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  if(emailReg.test(email)){
		  return true;
	  }else{
		  return false;
	  }
}

//Forgot Password
$("#divForgot").live('click', function () {	
	if(!$( '#email' ).hasClass("watermark"))$( '#emailFP' ).val($( '#email' ).val());
	$('#forgot_pwd_main').dialog('open');
	return false;
});

var buttonOpts = {};
buttonOpts[send] = function() {
	hideIndexErrors();
	var bValid = true;
	var email = $( '#emailFP' ).val();
	if(email.length<1){
		$( '#errorIndexEmailRNULL' ).fadeIn();
		bValid=false;
	}else{
		if(!(checkValidEmail(email))){
			$( '#errorIndexValidEmail' ).fadeIn();
			bValid=false;
		}
	}
	
	if(bValid){
		$.post('jsp/forgotPasswordLogic.jsp',{
			emailFP:email,
			actualLanguage: $( '#language_select' ).val()
			},function(msg){
				if(msg.result === 'OK'){
					$('#forgot_pwd_main').dialog( "close" );
					email.val("");	
				}else if(msg.result === 'invalidEmail'){
		   			jAlert(msg.value, notification);
				}else if(msg.result === 'NO'){
					jAlert(msg.value, notification);				}
		},"json");
	}
};

$('#forgot_pwd_main').dialog({
	autoOpen : false,
	width : 600,
	height : 265,
	buttons: buttonOpts,close: function() {
	},beforeClose: function() {
		$( '#emailFP' ).val("");
		$( '#errorFPEmailRNULL').hide();
	}
});

//Costum Image
$($.post('jsp/getLogoLogic.jsp',{name:businessNameLogo},function(msg){
	if(isCustom === '0'){
		$('#index_logo_image').attr('src','images/logoLoyappty.png?'+time.getTime());
	}else{
		if(msg.logo === ""){
			$('#index_logo_image').attr('src','images/logoLoyappty.png?'+time.getTime());
			jAlert(WildCardAvailable, notification);
		}else if(msg.logo.indexOf("CAT_IMG_") != 0){
			$( '#index_logo_image' ).attr('src',ImageBaseUrl+msg.logo+'?'+time.getTime());
		}else{
			$('#index_logo_image').attr('src','images/logoLoyappty.png?'+time.getTime());
			jAlert(WildCardAvailable, notification);
		}
	}
},"json"));