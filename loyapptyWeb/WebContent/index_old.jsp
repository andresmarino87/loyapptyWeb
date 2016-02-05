<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>

	<!-- JSP -->
	<%@page import="java.io.*"%>
	<%@page import="java.util.*"%>
	<%
		String setInitLan="";
		String language = (String) session.getAttribute("language");
		InputStream stream = null;
		if ((language != null)) {
		//	System.out.println(language);
			if (language.equals("1")) {
		//		System.out.println("Carge Ingles");
				setInitLan="1";
				stream = application.getResourceAsStream("config/englishConf.properties");
			} else {
				setInitLan="0";
		//		System.out.println("Carge Espa�ol");
				stream = application.getResourceAsStream("config/spanishConf.properties");
			}
		} else {
			stream = application.getResourceAsStream("config/englishConf.properties");
			setInitLan="1";
		}
		Properties properties = new Properties();
		properties.load(stream);
	%>
 	<title><%=properties.getProperty("Indexmsg")%></title>


<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

	<!-- CSS -->
	<link rel="stylesheet" href="css/styles.css" type="text/css" />
	<link rel="shortcut icon" href="css/img/favicon.png" type="image/png" />
	<link rel="apple-touch-icon" href="css/img/favicon.png" />
	<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="css/front.css" media="screen, projection" rel="stylesheet" type="text/css" />
	<link href="css/tipsy.css" rel="stylesheet" type="text/css" />
	<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
	<link href="css/jquery.tooltip.css" rel="stylesheet" type="text/css"/>



	<!-- JS... -->
	<script type="text/JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.tipsy.js"></script>
	<script type="text/JavaScript" src="js/index.js"></script>
	<script type="text/JavaScript" src="js/forgotPassword.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/JavaScript" src="js/login.js"></script>
	<script type="text/JavaScript" src="js/forgotPassword.js"></script>
	<script type="text/JavaScript" src="js/registration.js"></script>
	<script type="text/javascript" src="js/jquery.tooltip.min.js"></script>
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

<body>
 	
	<div id="pagewidth">
		<div id="header">
			<div id="logo" style="margin-left: 8%;">
			
			
				<a href="#"><img src="images/logoFinal.png" width="400px" id="logoimage" alt="logo ogangi" /></a>
			</div>
			<div id="container">
				<div id="topnav" class="topnav">
					<select id="language" class="text ui-state-active ui-widget-content ui-corner-all">
					</select> <a href="#" id="dialog_link"
						class="medium button orange"><%=properties.getProperty("MsgRegister")%></a>
<script type="text/javascript">
// 	alert("entre");
$(document).ready(function(){

		var test="<%=setInitLan%>";
 	
		if(test === "1"){
	//	if(true){
			$( '#language' ).append('<option value="1" class="language_selection">English</option>');
			$( '#language' ).append('<option value="0" class="language_selection">Espa�ol</option>');
		}else{
			$( '#language' ).append('<option value="0" class="language_selection">Espa�ol</option>');
			$( '#language' ).append('<option value="1" class="language_selection">English</option>');
		}


		$("#Qmarkregister").tooltip();
		});		
		


</script>

					<div id="dialog_register" title=<%=properties.getProperty("MsgRegister")%> class="registerinline">
					
						<div id="registration_main">
							
								<div id="dialog_add_suscriptor_form">
								<%=properties.getProperty("Allfields")%>:
										<p style="display: none" class="validateTips"><%=properties.getProperty("MsgRegistration")%></p>
										<p style="display: none" id="errorRPwdNULL"><%=properties.getProperty("PwdNotNull")%></p>
										<p style="display: none" id="errorREmailRNULL"><%=properties.getProperty("EmailNotNull")%></p>
										<p style="display: none" id="errorRNameNULL"><%=properties.getProperty("ErrorRNameNULL")%></p>
										<p style="display: none" id="errorRLastNameNULL"><%=properties.getProperty("ErrorRLastNameNULL")%></p>
										<p style="display: none" id="errorRZipNULL"><%=properties.getProperty("ErrorRZipNULL")%></p>
										<p style="display: none" id="errorRAddressNULL"><%=properties.getProperty("ErrorRAddressNULL")%></p>
										<p style="display: none" id="errorRMCNULL"><%=properties.getProperty("ErrorRMCNULL")%></p>
										<p style="display: none" id="errorRPWDNM"><%=properties.getProperty("ErrorRPWDNM")%></p>
										<p style="display: none" id="errorRBCNULL"><%=properties.getProperty("ErrorRBCNULL")%></p>
										<p style="display: none" id="errorRBCNULL"><%=properties.getProperty("ErrorCountryNull")%></p>
										<div>
											<label for="emailR"><%=properties.getProperty("Email")%>: </label>
											<input type="email" name="emailR" id="emailR"
												class="text ui-widget-content ui-corner-all" /> <div id="redasterisk">*</div>&nbsp;<br />
											<label for="passwordR"><%=properties.getProperty("Password")%>: </label>
											<input type="password" name="passwordR" id="passwordR"
												class="text ui-widget-content ui-corner-all" />  <div id="redasterisk">*</div>&nbsp;<br />
											<label for="passwordCR"><%=properties.getProperty("PasswordConfirm")%>: </label>
											<input type="password" name="passwordCR" id="passwordCR"
												class="text ui-widget-content ui-corner-all" />  <div id="redasterisk">*</div>&nbsp;<br /><br />
											<div style="text-align=center;"><%=properties.getProperty("Registermsg")%></div>
											<label for="nameR"><%=properties.getProperty("BusinessName")%>: </label>
											<input type="text" name="nameR" id="nameR"
												class="text ui-widget-content ui-corner-all" />  <div id="redasterisk">*</div>&nbsp;<br />
										 	<label for="websiteR"><%=properties.getProperty("Website")%>: </label>
											<input type="text" name="websiteR" id="websiteR"
												class="text ui-widget-content ui-corner-all" />&nbsp;&nbsp;&nbsp;<br />  

<!-- 											<label for="addressR"><%=properties.getProperty("Address")%>: </label>
											<input type="text" name="addressR" id="addressR"
												class="text ui-widget-content ui-corner-all" />  <div id="redasterisk">*</div>&nbsp;<br /> -->
											<label for="businessCategoryR"><%=properties.getProperty("BusinessCategory")%>: </label>
											<select name="businessCategoryR" id="businessCategoryR" class="text ui-state-active ui-widget-content ui-corner-all">
												<option value=0><%=properties.getProperty("BC0")%></option>
												<option value=1><%=properties.getProperty("BC1")%></option>
												<option value=2><%=properties.getProperty("BC2")%></option>
												<option value=3><%=properties.getProperty("BC3")%></option>
												<option value=4><%=properties.getProperty("BC4")%></option>
												<option value=5><%=properties.getProperty("BC5")%></option>
												<option value=6><%=properties.getProperty("BC6")%></option>
												<option value=7><%=properties.getProperty("BC7")%></option>
												<option value=8><%=properties.getProperty("BC8")%></option>
												<option value=9><%=properties.getProperty("BC9")%></option>
												<option value=10><%=properties.getProperty("BC10")%></option>
												<option value=11><%=properties.getProperty("BC11")%></option>
												<option value=12><%=properties.getProperty("BC12")%></option>
												<option value=13><%=properties.getProperty("BC13")%></option>
												<option value=14><%=properties.getProperty("BC14")%></option>
												<option value=15><%=properties.getProperty("BC15")%></option>
												<option value=16><%=properties.getProperty("BC16")%></option>
												<option value=17><%=properties.getProperty("BC17")%></option>
												<option value=18><%=properties.getProperty("BC18")%></option>
												<option value=19><%=properties.getProperty("BC19")%></option>
											</select>  <div id="redasterisk">*</div>&nbsp;<br />
										<!-- 	<label for="businessDescriptionR"><%=properties.getProperty("BusinessDescription")%>: </label>
											<input type="text" name="businessDescriptionR"
												id="businessDescriptionR"
												class="text ui-widget-content ui-corner-all" />&nbsp;&nbsp;&nbsp;<br /> 
							 -->	<!--		<label for="mainContactR"><%=properties.getProperty("MainContact")%>: </label>
											<input type="text" name="mainContactR" id="mainContactR"
												class="text ui-widget-content ui-corner-all" />  <div id="redasterisk">*</div>&nbsp;<br />
											<label for="otherContactR"><%=properties.getProperty("OtherContact")%>: </label>
											<input type="text" name="otherContactR" id="otherContactR"
												class="text ui-widget-content ui-corner-all" />&nbsp;&nbsp;&nbsp;<br />-->
											<label for="registration_country"><%=properties.getProperty("Country")%>: </label>
											<select id="registration_country" class="text ui-state-active ui-widget-content ui-corner-all">
												<option value="0"><%=properties.getProperty("BC0")%></option>
											</select> <div id="redasterisk">*</div>&nbsp;<br />
											<label for="registration_city"><%=properties.getProperty("City")%>: </label>
											<select id="registration_city" class="text ui-state-active ui-widget-content ui-corner-all"></select>  <div id="redasterisk">*</div>&nbsp;<br />
											<input id="registration_Location_relevant" type="checkbox" name="starton" class="text ui-widget-content ui-corner-all" /><%=properties.getProperty("LocationRelevant")%>
											<div id="Qmarkregister">
												<img src="images/dialog-question.png" title="<%=properties.getProperty("Registerhelploc")%>"/>
											</div>
											<br />
									<!--		<label for="zipR"><%=properties.getProperty("Zip")%>: </label> 
											<input type="text" name="zipR" id="zipR" class="text ui-widget-content ui-corner-all" />  <div id="redasterisk">*</div>&nbsp;<br />-->
								
								</div>
							</div>
						</div>
					
					</div>
					<a href="login" class="signin medium button orange"><span>Login</span></a>
					<fieldset id="signin_menu">
						<div id=signin>
							<form method="post" id="loginForm" action="jsp/loginLogic.jsp">
								<p>
									<label for="login"><%=properties.getProperty("Email")%>: </label>
									<input id="login" name="login" type='email' tabindex="4">
								</p>
								<p>
									<label for="login"><%=properties.getProperty("Password")%>: </label>
									<input id="passwd" name="passwd" value="" title="passwd"
										tabindex="5" type="password">
								</p>
								<p class="remember">
								
									<input id="signin_submit" type="submit" class="ui-state-default ui-corner-all"
										value="<%=properties.getProperty("Login")%>" tabindex="6">
								</p>
								<p id="error" style="display: none"><%=properties.getProperty("Validate")%></p>
								<p id="errorPwdNULL" style="display: none"><%=properties.getProperty("PwdNotNull")%></p>
								<p id="errorEmailNULL" style="display: none"><%=properties.getProperty("EmailNotNull")%></p>
								<div id="forgot_pwd_button">
									<a href="#" id="resend_password_link"><%=properties.getProperty("ForgotPwd")%></a>
								</div>

							</form>
						</div>
					</fieldset>
				</div>

			</div>
		</div>

		<div id="wrapper" class="clearfix">
			<div id="twocols">
				<div id="maincol">
					<div id="maincontainer">
				<div style="margin:5px auto;font-size:1.5em;text-align:left;font-weight:bold;"><%=properties.getProperty("Howloyappty") %><a href="#" id="slogan_dialog_link" >  <%=properties.getProperty("CusLoyalty") %></a></div>

<div id="imgindex"> 
	<a href="#" id="image_register_link">
	<img id="imgindex1" src="images/<%=properties.getProperty("Indeximg1") %>" style="margin-right:5%;" width="29%"  />
	</a>
	
	<a href="#" id="image_two_link">
	<img id="imgindex2" src="images/<%=properties.getProperty("Indeximg2") %>" style="margin-right:5%;" width="29%" />
	</a>
	
	<a href="<%=properties.getProperty("Linktomobile") %>" target="_blank" id="image_three_link">
	<img id="imgindex3" src="images/<%=properties.getProperty("Indeximg3") %>" width="29%"/>
	</a>
</div>

<div id="dialog_img_2">Imagen dialogo 2</div>
<div id="dialog_slogan" title="<%=properties.getProperty("Loyaltytitle") %>">
<%=properties.getProperty("Loyaltymsg") %>
</div>




					</div>
				</div>
				<div id="rightcol"></div>
			</div>
			<div id="leftcol"></div>
		</div>
		<div id="footer"> 
			<a href="http://twitter.com" target="_blank">Follow Loyappty on Twitter<br /><img 
				src="css/img/twitter_50.png" width="50" height="50" alt="twitter us"></a>
			<p class="blocktext">
				<a href="#">About us</a>  |  <a href="#">Contact us</a>  |  <a href="#">Support</a>
				<br /><br />
				<a href="#">Privace Notice and Conditions of Use, 2012  </a><a href="http://www.ogangi.com" target="_blank">Ogangi Corporation</a>
				
			</p>
		</div>
	</div>
	<div id="forgot_pwd_main" title="<%=properties.getProperty("ForgotPwd") %>" >
	<div class="demo">
		<form id="forgot_Pwd_form">
			<p class="validateTips"><%=properties.getProperty("ForgotPwdMessage") %></p>
			<p id="errorFPwdNULL" style="display:none"><%=properties.getProperty("PwdNotNull") %></p>
			<fieldset>
				<label for="emailFP"><%=properties.getProperty("Email") %>: </label>
				<input type="email" name="emailFP" id="emailFP" class="text ui-widget-content ui-corner-all" />
			</fieldset>
			<div class="centerbutton">
			<input class="ui-state-default ui-corner-all" type ="submit" value="<%=properties.getProperty("Send") %>">
			</div>
		</form>
	</div>
</div>
</body>
</html>