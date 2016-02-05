<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<META HTTP-EQUIV="Refresh" CONTENT="600" />
	<title>Loyappty</title>
   	
   	<%@page session="true" %>  
	<%@page import="java.io.*"%>
	<%@page import="java.util.*"%>
	<%@page import="org.apache.log4j.*"%>

	<% 
		session = request.getSession(true);
		/*Manejo de idioma*/
		String language = request.getParameter("lan");
		InputStream stream = null;
		Properties properties = new Properties();
		//Null is default
		if(language == null){
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");		
		}else if(language.equals("EN")){
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");			
		}else if(language.equals("ES")){
			stream = application.getResourceAsStream("config"+File.separator+"spanishConf.properties");	
		}		
		properties.load(stream);
		
		stream = application.getResourceAsStream("config"+File.separator+"var.properties");
		Properties propertiesURL = new Properties();
		propertiesURL.load(stream);		
	%>
	<%@include file="jsp/logsLogic.jsp" %>
        
    <!-- Referencias -->
    <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.17.custom.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link rel="stylesheet" type="text/css" href="css/jquery.alerts.css"/>
	
	<script type="text/JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.tipsy.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/javascript" src="js/jquery.alerts.js"></script>
	<script type="text/javascript"> 
	/*Manejo del idioma Null es lenguaje por defecto*/
		$(document).ready(function(){
			<%
				String extLan="EN";
				String footerExt="";
				if(language == null ){ 
			%>
				$( '#language_select' ).append('<option value="1" class="language_selection">English</option>');
				$( '#language_select' ).append('<option value="0" class="language_selection">Español</option>');
				extLan="EN";
			<% }else if(language.equals("EN")){ %>
				$( '#language_select' ).append('<option value="1" class="language_selection">English</option>');
				$( '#language_select' ).append('<option value="0" class="language_selection">Español</option>');
				extLan="EN";
			<% }else if(language.equals("ES")){ 
				extLan="ES";
				footerExt="_es";
			%>
				$( '#language_select' ).append('<option value="0" class="language_selection">Español</option>');
				$( '#language_select' ).append('<option value="1" class="language_selection">English</option>');						
			<% } %>
		});

	</script>      	
	
	<script type="text/javascript">
		 var _gaq = _gaq || [];
		 _gaq.push(['_setAccount', 'UA-29036687-1']);
		 _gaq.push(['_trackPageview']);
		
		 (function() {
		 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		 })();  
	 </script> 
</head>
  

<body id="body" class="body1<%=footerExt %>">
	<div id="wrapper">
		<div id="header-wrap">
			<div id="header-container">
				<div class="header">
					<span style="font-weight: bold;"><%=properties.getProperty("IndexLanguage") %>: </span>
					<select id="language_select" name="inpLanguage" dir="ltr"></select>
                </div>
                <div id="backSlide">
                    <a href="#" onclick="picture<%=footerExt %>('1')">
                        <img id="butPic1" src="images/butBlueOn.png" alt="" width="15" height="15" border="0" /></a>
                    <a href="#" onclick="picture<%=footerExt %>('2')">
                        <img id="butPic2" src="images/butBlue.png" alt="" width="15" height="15" border="0" /></a>
                    <a href="#" onclick="picture<%=footerExt %>('3')">
                        <img id="butPic3" src="images/butBlue.png" alt="" width="15" height="15"  border="0"/></a>
                    <a href="#" onclick="picture<%=footerExt %>('4')">
                        <img id="butPic4" src="images/butBlue.png" alt="" width="15" height="15" border="0"/></a>
                    <a href="#" onclick="picture<%=footerExt %>('5')">
                        <img id="butPic5" src="images/butBlue.png" alt="" width="15" height="15" border="0"/></a>
                </div>
            </div>
		</div>
        <div id="container">
            <div id="menu" class="degrade">
                <div id="logo">
                    <img id='index_logo_image' src="" alt="" width="150" height="104" />
                </div>
                <div id="signIn" class="formRounCorners" style="height: 225px;">
					<form id="login_form" method="post">   
						<div style="text-align: center; margin: 0 0 10px 0;">
							<span class="textGrayBig"><%=properties.getProperty("IndexLoyapptySignIn") %>:</span>
						</div>
						<p style="display: none" class="ui-state-error indexErrors" id="errorEmailNULL"><%=properties.getProperty("EmailNotNull")%></p>
						<p style="display: none" class="ui-state-error indexErrors" id="errorPwdNULL"><%=properties.getProperty("PwdNotNull")%></p>
						
	                    <div id="divEmail">
	                        <input type="email" id="email" name="email" class="input" />
	                    </div>
	                    <div id="divPass">
							<input type="text" id="password" name="password" align="left" class="input" style="width: 90%;"/>
	                    </div>
	                    <div id="divSubmit">
	                        <input name="btnSignIn" id="btnSignIn" type="submit" value="<%=properties.getProperty("SignIn").trim()%>" class="btnBlue" border="0" />
	                    </div>
					</form>
                    <div id="divCheck">
                        <input id="index_Remember_Me" name="ckbRemenber" type="checkbox" value="" />
                        <span class="textGray"><%=properties.getProperty("IndexRememberme") %></span>
                    </div>
                    <div id="divForgot">
                        <span class="textBlueBig"><a href="#"><%=properties.getProperty("ForgotPwd") %></a></span>
                    </div>
					<div id="divSocialNetworks">
						<div style="text-align: left; margin: 15px 0 5px 0px;">
							<span class="textGrayBig"><%=properties.getProperty("IndexFBorTw") %></span></div>
						<div>
							<a href="https://graph.facebook.com/oauth/authorize?type=client_cred&client_id=<%=propertiesURL.getProperty("facebookAppId")%>&redirect_uri=<%=propertiesURL.getProperty("thisServerBase")+"facebookBridge.jsp?lan="+extLan %>&scope=email,publish_actions">
								<img src="images/buttons/fb_si_b<%=footerExt %>.png" alt="" border="0"/>
							</a>
							<a class="index_Twitter_Button" href="#"><img src="images/buttons/tw_si_b<%=footerExt %>.png" alt="" border="0"/></a>
						</div>
						<div style="text-align: center; margin: 0 0 5px 35px;">
							<span class="textGraySmall" style="display:inline-block; vertical-align:top"><%=properties.getProperty("IndexNeverPostMsg") %></span>
						</div>
					</div>
                </div>
				<div id="newTo" class="formRounCorners" style="height: 68px;">
					<div div style="text-align: left; margin: 0 0 5px 5px;">
						<span class="textGrayBig"><%=properties.getProperty("NewUser") %></span></div>
					<div>
						<a href="#bottom" onclick="showHide('signUp')"><img src="images/buttons/sign_up_b<%=footerExt %>.png" alt="" border="0"/></a>
					</div>
					<div style="text-align: center; margin: 0 0 5px 0;">
						<span class="textGraySmall" style="display:inline-block; vertical-align:top"><%=properties.getProperty("IndexItsFree") %></span></div>
				</div>
                <div id="signUp" class="formRounCorners" style="display:none; height: 440px;">
                    <div style="text-align: left; margin: 0 0 5px 15px;">
					    <span class="textGrayBig"><%=properties.getProperty("IndexSignUp") %>:</span></div>
					<form id="registration_form">
						<p style="display: none" class="ui-state-error indexErrors" id="errorRPwdNULL"><%=properties.getProperty("PwdNotNull")%></p>
						<p style="display: none" class="ui-state-error indexErrors" id="errorREmailRNULL"><%=properties.getProperty("EmailNotNull")%></p>
						<p style="display: none" class="ui-state-error indexErrors" id="errorRValidEmail"><%=properties.getProperty("EmailNotValid")%></p>
						<p style="display: none" class="ui-state-error indexErrors" id="errorRNameNULL"><%=properties.getProperty("ErrorRNameNULL")%></p>
						<p style="display: none" class="ui-state-error indexErrors" id="errorRMCNULL"><%=properties.getProperty("ErrorRMCNULL")%></p>
						<p style="display: none" class="ui-state-error indexErrors" id="errorRPWDNM"><%=properties.getProperty("ErrorRPWDNM")%></p>
						<p style="display: none" class="ui-state-error indexErrors" id="errorRBCNULL"><%=properties.getProperty("ErrorRBCNULL")%></p>
					
						<div>
							<input type="text" id="businessName" name="businessName" class="input" />
						</div>
						<div>
							<input type="email" id="businessEmail" name="businessEmail" class="input" />
                        </div>
	                    <div>
<!--                         	<input type="password" id="businessPass" name="businessPass" placeholder="<%=properties.getProperty("Password") %>" class="input" />-->
							<input type="text" id="businessPass" name="businessPass" class="input" />
                        </div>
						<div>
<!--     	                    <input type="password" id="businessConfirmPass" name="businessConfirmPass" placeholder="<%=properties.getProperty("PasswordConfirm") %>" class="input" />-->
							<input type="text" id="businessConfirmPass" name="businessConfirmPass" class="input" />    	                    
    	                </div>
						<div>
	                        <select class="select" id="businessCategory">
	     						<option value=0 selected="selected"><%=properties.getProperty("BC0")%></option>
								<option value=1><%=properties.getProperty("BC1")%></option>
								<option value=3><%=properties.getProperty("BC3")%></option>
								<option value=4><%=properties.getProperty("BC4")%></option>
								<option value=5><%=properties.getProperty("BC5")%></option>
								<option value=8><%=properties.getProperty("BC8")%></option>
								<option value=9><%=properties.getProperty("BC9")%></option>
								<option value=10><%=properties.getProperty("BC10")%></option>
								<option value=14><%=properties.getProperty("BC14")%></option>
								<option value=17><%=properties.getProperty("BC17")%></option>
								<option value=18><%=properties.getProperty("BC18")%></option>
								<option value=19><%=properties.getProperty("BC19")%></option>
							</select>
						</div>
	                    <div style="padding-top: 5px;">
	                    	<input type='image' src="images/buttons/l_su_b<%=footerExt %>.png" alt="" border="0"/>
							<br />
	                    </div>
                    </form>
					<div style="text-align: left; margin: 10px 0 5px 15px;">
					    <span class="textGrayBig"><%=properties.getProperty("IndexUseFBorTwToSignUp") %>:</span></div>
					<div>
						<a href="https://graph.facebook.com/oauth/authorize?type=client_cred&client_id=<%=propertiesURL.getProperty("facebookAppId")%>&redirect_uri=<%=propertiesURL.getProperty("thisServerBase")+"facebookBridge.jsp?lan="+extLan %>&scope=email">
							<img src="images/buttons/fb_su_b<%=footerExt %>.png" alt="" border="0"/>
						</a>
						<a class="index_Twitter_Button" href="#"><img src="images/buttons/tw_su_b<%=footerExt %>.png" alt="" border="0"/></a>
					</div>
					<div style="text-align: center; margin: 0 0 5px 0;">
						<span class="textGraySmall" style="display:inline-block; vertical-align:top"><%=properties.getProperty("IndexNeverPostMsg") %></span>
					</div>
					<div style="text-align: right; margin: 10px 0 5px 0;">
						<a href="#" style="font-size: 11px; color: #666; text-decoration: underline;" onclick="showHide('signUp')"><%=properties.getProperty("IndexClickToHide") %></a>
					</div>
					<a name="bottom"></a> 
                </div>
            </div>
        </div>
    </div>
    <div id="footer-wrap">
        <div id="footer-container">
            <div style="width: 30%; float: left; position: relative; color: #3D3D3D; font-family: Arial, Helvetica, sans-serif;
                font-size: 12px; vertical-align: middle; padding: 5px 30px;">
               <a href="copyrightpolicy<%=footerExt%>.html" target="_blank">© 2012</a> Loyappty (<%=properties.getProperty("Adivisionof") %> <a href="http://www.ogangi.com" target="_black">Ogangi Corporation</a>)</div>
            <div style="width: 50%; float: left; position: relative; text-align: center; color: #3D3D3D;
                font-family: Arial, Helvetica, sans-serif; font-size: 14px; vertical-align: middle;
                padding: 5px 0px;">
                <a href="about<%=footerExt%>.html" target="_blank"><%=properties.getProperty("AboutUs") %></a> 
                | <a href="pricing<%=footerExt%>.html" target="_blank"><%=properties.getProperty("Pricing") %></a>
                | <a href="faq<%=footerExt%>.html" target="_blank"><%=properties.getProperty("FAQ") %></a> 
                | <a href="contact<%=footerExt%>.html" target="_blank"><%=properties.getProperty("ContactUs") %></a> 
                | <a href="press<%=footerExt%>.html" target="_blank"><%=properties.getProperty("WhatsNew") %></a>
                </div>
        </div>
    </div>
    <div id="forgot_pwd_main" title="<%=properties.getProperty("ForgotPwd") %>" style="display:none;">
		<div class="demo">
			<p class="validateTips"><%=properties.getProperty("ForgotPwdMessage") %></p>
			<p style="display:none" class="ui-state-error indexErrors" id="errorIndexEmailRNULL"><%=properties.getProperty("EmailNotNull")%></p>
			<p style="display:none" class="ui-state-error indexErrors" id="errorIndexValidEmail"><%=properties.getProperty("EmailNotValid")%></p>
			<fieldset style="border: 0px">
				<label for="emailFP"><%=properties.getProperty("Email") %>: </label>
				<input type="email" name="emailFP" id="emailFP" class="text ui-widget-content ui-corner-all" size="40"/>
			</fieldset>
		</div>
	</div>
	<script type="text/javascript">  
	//Load image
		var time = new Date();	
		var isCustom ='0';
		var businessNameLogo='';
		<%if(request.getParameter("name") != null){%>	
			businessNameLogo='<%=request.getParameter("name")%>';
			isCustom ='1';		
		<%}%>
	// No mover necesario para el idioma
		var ImageBaseUrl="<%=propertiesURL.getProperty("fileBaseLoad")%>";
		var PwdNotNull="<%=properties.getProperty("PwdNotNull")%>";
		var EmailNotNull="<%=properties.getProperty("EmailNotNull")%>";
		var EmailNotValid="<%=properties.getProperty("EmailNotValid")%>";
		var ErrorRNameNULL="<%=properties.getProperty("ErrorRNameNULL")%>";
		var ErrorRMCNULL="<%=properties.getProperty("ErrorRMCNULL")%>";
		var ErrorRPWDNM="<%=properties.getProperty("ErrorRPWDNM")%>";
		var ErrorRBCNULL="<%=properties.getProperty("ErrorRBCNULL")%>";
		var EmailTxt="<%=properties.getProperty("Email")%>"
		var PasswordTxt="<%=properties.getProperty("Password")%>";
		var BusinessNameTxt="<%=properties.getProperty("BusinessName")%>";
		var PasswordConfirmTxt="<%=properties.getProperty("PasswordConfirm")%>";
	    var imgLan= "<%=footerExt %>";
		var language="<%=extLan%>";
		var send="<%=properties.getProperty("Send")%>";
		var cancel="<%=properties.getProperty("Cancel")%>";
		var ErrorGenericNULL="<%=properties.getProperty("ErrorGenericNULL")%>";
		var notification="<%=properties.getProperty("Notification")%>";
		var WildCardAvailable="<%=properties.getProperty("WildCardAvailable")%>";
		
		$.getScript( "js/index.js" , function () { 
			$.getScript( "js/login.js" , function () { 
			});
		});
	</script>
</body>
</html>
