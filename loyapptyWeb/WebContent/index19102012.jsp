<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<META HTTP-EQUIV="Refresh" CONTENT="600" />
<head> 
<title>Loyappty</title>
<!-- JSP -->
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
	%>
	<%@include file="jsp/logsLogic.jsp" %>
	
 	<title><%=properties.getProperty("Indexmsg")%></title>

<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

	<!-- CSS -->
	<link rel="stylesheet" href="css/styles.css" type="text/css" />
	<link rel="shortcut icon" href="css/img/favicon.png" type="image/png" />
	<link rel="apple-touch-icon" href="css/img/favicon.png" />
	<link href="css/jquery-ui-1.8.17.custom.css" rel="stylesheet" type="text/css"/>
	



	<!-- JS... -->
	<script type="text/JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.tipsy.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/JavaScript" src="js/login.js"></script>
	<script type="text/javascript" src="jwplayer/jwplayer.js"></script>
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


<script> 
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
<script>
$(function(){
var loginmenu = $('#signin_menu');
var first_table= $('#first_table');
var pagewidth = $(document).width();
var tablewidth = first_table.width(); 
var newmargin = (pagewidth-tablewidth)/2+10;
loginmenu.css('right',newmargin);

$(window).resize(function() {
	pagewidth = $(document).width();
	tablewidth = first_table.width();
	newmargin = ((pagewidth-tablewidth)/2)+10;
	loginmenu.css('right',newmargin);  
	});

var isiPad = navigator.userAgent.match(/iPad/i) != null;
if (isiPad){
	
	} 
});
</script>
</head>			
<body onLoad="MM_preloadImages('images/btn_step1.png','images/btn_step2.png','images/btn_step3.png')">
<table id="first_table" width="69%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td height="181" align="left" valign="top">
    <table style="width:99%" border="0" align="center">
        <tr>
          <td align="center"><img src="images/logo2.png" alt="" width="235" height="159" hspace="0" vspace="10" align="left" /></td>
          <!-- MOVE TWITTER TD HERE WHEN ACTIVATE LANGUAGE LIST -->
          <td width="22%" align="right">
		  <a >
            <select name="select" id="language_select"></select> 
          </a> 
      		<script type="text/javascript"> 
      		/*Manejo del idioma Null es lenguaje por defecto*/
			$(document).ready(function(){
				<%
					String footerExt="";
					if(language == null ){ 
					%>
					$( '#language_select' ).append('<option value="1" class="language_selection">English</option>');
					$( '#language_select' ).append('<option value="0" class="language_selection">Español</option>');
				<% }else if(language.equals("EN")){ %>
					$( '#language_select' ).append('<option value="1" class="language_selection">English</option>');
					$( '#language_select' ).append('<option value="0" class="language_selection">Español</option>');
				<% }else if(language.equals("ES")){ 
					footerExt="_es";
				%>
					$( '#language_select' ).append('<option value="0" class="language_selection">Español</option>');
					$( '#language_select' ).append('<option value="1" class="language_selection">English</option>');						
				<% } %>
			});	
			</script>           
          </td>
          <td width="27%" align="right">
          <a href="http://www.linkedin.com/company/2539351?trk=tyah" target="_blank"> <img src="images/linkedin.png" alt="Find us on Linkdin" width="64" height="64" align="right" border="0" title="<%=properties.getProperty("FindUs")%>"/></a>
          
         <a href="https://www.facebook.com/loyappty" target="_blank"> <img src="images/icon_facebook.png" alt="facebook" width="64" height="64" align="right" border="0" title="<%=properties.getProperty("LikeUs")%>" /></a>
          <a href="https://twitter.com/loyappty" target="_blank"><img src="images/icoTw.png" alt="Follow Us on Twitter" width="64" height="64" border="0" align="right" title="<%=properties.getProperty("FollowUs")%>" /></a>
          
          </td>
          <td width="8%" align="right" ><div class="demo"><a href="#" id="dialog_link" class="button2"><%=properties.getProperty("MsgRegister")%></a></div></td>
          
          
          <td width="8%" align="right"><div class="demo"><a href="login" class="signin button2" id="login_button" style="text-decoration:none">Login</a></div>
         </td>
          
        </tr>
      </table>
      </td> 
  </tr>
  <tr>
    <td align="center">
      <table style="width:99%" border="0" style="margin-top: 35px">
        <tr>
          <td width="55%">
      <table width="99%" border="0" >
        <tr style="text-align: center;">
          <td colspan="3"><img src="images/<%=properties.getProperty("Textindex") %>" /></td>
        </tr>
        <tr>
			<td align="center">
			<div id="container">Loading the player ...
				<script type="text/javascript">
				jwplayer("container").setup({ flashplayer: "jwplayer/player.swf", file: "media/how_to_use_loyappty<%=footerExt%>.mp4",
					height: 342,
					width: 640,
					image: "images/indexScr<%=footerExt%>.png"
				});
				</script>
			</div>
			</td>
		</tr>
        <tr>
		    <td align="center">
		    	<table style="border:0" >
		      		<tr style="vertical-align: top;">
		        	<td align="center"><a href="#" id="image_register_link" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('step1','','images/<%=properties.getProperty("Indeximg1") %>',1)"><img src="images/<%=properties.getProperty("Indeximg1-1") %>" alt="step1" name="step1" width="235" height="237" border="0" id="step1" /></a></td>
		        	<td align="center"><a href="#" target="_blank"  id="image_two_link" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('step2','','images/<%=properties.getProperty("Indeximg2") %>',1)"><img src="images/<%=properties.getProperty("Indeximg2-1") %>" alt="step2" name="step2" width="235" height="237" border="0" id="step2" /></a></td>
		        	<td align="center"><a href="<%=properties.getProperty("Linktomobile") %>" target="_blank" id="image_three_link" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('step3','','images/<%=properties.getProperty("Indeximg3") %>',1)"><img src="images/<%=properties.getProperty("Indeximg3-1") %>" alt="step3" name="step3" width="235" height="237" border="0" id="step3" /></a></td>
		      		</tr>
		    	</table>
		    </td>
       </tr>
	   
     </table>

          </td>
          <td valign="top">
          <% pageContext.include("indexPress"+footerExt+".jsp"); %>
		  </td>
        </tr>
      </table>

    </td>
  </tr> 
  <tr>
	 <td><br/><br/></td>
  </tr> 
  <tr>
    <td align="center">
      <tr> 
        <td colspan="3" align="center"><a href="about<%=footerExt%>.html"><%=properties.getProperty("AboutUs") %></a> 
        <span style="color:#25ACF3!important;">|</span> <a href="pricing<%=footerExt%>.html"><%=properties.getProperty("Pricing") %></a> 
        <span style="color:#25ACF3!important;">|</span> <a href="faq<%=footerExt%>.html"><%=properties.getProperty("FAQ") %></a> 
        <span style="color:#25ACF3!important;">|</span> <a href="contact<%=footerExt%>.html"><%=properties.getProperty("ContactUs") %></a> <!-- | <a href="#">Support</a> --> 
        <span style="color:#25ACF3!important;">|</span> <a href="press<%=footerExt%>.html"><%=properties.getProperty("WhatsNew") %></a>
        <span style="color:#25ACF3!important;">|</span> <a href="reseller<%=footerExt%>.html"><%=properties.getProperty("ResellerProgram") %></a> 
        <span style="color:#25ACF3!important;">|</span> <a href="termsofservice<%=footerExt%>.html"><%=properties.getProperty("TermsofService") %></a>
        </td>
        </tr>
      <tr>
        <td colspan="2" align="center"><a href="copyrightpolicy.html">© 2012</a> <span style="color:#25ACF3!important;">Loyappty (<%=properties.getProperty("Adivisionof") %></span> <a href="http://www.ogangi.com" target="_blank">Ogangi Corporation</a>)</td>
      </tr>
      <!-- 
      <tr>
        <td colspan="2" align="center"><a href="http://www.ogangi.com" target="_blank"><img src="images/icoOgangi.gif" width="69" height="29" border="0" /></a></td>
      </tr>
      -->
 
	</td>
  </tr>
</table>  

          <div id="dialog_register" title=<%=properties.getProperty("MsgRegister")%> class="registerinline" style="display: none">
					
						<div id="registration_main">
							
								<div id="dialog_add_suscriptor_form">
								<%=properties.getProperty("Allfields")%>:	
										<p style="display: none" class="validateTips"><%=properties.getProperty("MsgRegistration")%></p>
										<p style="display: none" class="ui-state-error" id="errorRPwdNULL"><%=properties.getProperty("PwdNotNull")%></p>
										<p style="display: none" class="ui-state-error" id="errorREmailRNULL"><%=properties.getProperty("EmailNotNull")%></p>
										<p style="display: none" class="ui-state-error" id="errorRValidEmail"><%=properties.getProperty("EmailNotValid")%></p>
										<p style="display: none" class="ui-state-error" id="errorRNameNULL"><%=properties.getProperty("ErrorRNameNULL")%></p>
										<p style="display: none" class="ui-state-error" id="errorRLastNameNULL"><%=properties.getProperty("ErrorRLastNameNULL")%></p>
										<p style="display: none" class="ui-state-error" id="errorRZipNULL"><%=properties.getProperty("ErrorRZipNULL")%></p>
										<p style="display: none" class="ui-state-error" id="errorRAddressNULL"><%=properties.getProperty("ErrorRAddressNULL")%></p>
										<p style="display: none" class="ui-state-error" id="errorRMCNULL"><%=properties.getProperty("ErrorRMCNULL")%></p>
										<p style="display: none" class="ui-state-error" id="errorRPWDNM"><%=properties.getProperty("ErrorRPWDNM")%></p>
										<p style="display: none" class="ui-state-error" id="errorRBCNULL"><%=properties.getProperty("ErrorRBCNULL")%></p>
										<p style="display: none" class="ui-state-error" id="errorRBCNULL"><%=properties.getProperty("ErrorCountryNull")%></p>
										<p style="display: none" class="ui-state-error" id="errorCountryNULL"><%=properties.getProperty("CountryNotNull")%></p>

										<div>
											<label for="emailR"><%=properties.getProperty("Email")%>: </label>
											<input type="email" name="emailR" id="emailR"
												class="text ui-widget-content ui-corner-all" maxlength="35"/> <div id="redasterisk">*</div>&nbsp;<br />
											<label for="passwordR"><%=properties.getProperty("Password")%>: </label>
											<input type="password" name="passwordR" id="passwordR"
												class="text ui-widget-content ui-corner-all" maxlength="50"/>  <div id="redasterisk">*</div>&nbsp;<br />
											<label for="passwordCR"><%=properties.getProperty("PasswordConfirm")%>: </label>
											<input type="password" name="passwordCR" id="passwordCR"
												class="text ui-widget-content ui-corner-all" maxlength="50"/>  <div id="redasterisk">*</div>&nbsp;<br /><br />
											<div style="text-align=center;"><%=properties.getProperty("Registermsg")%></div>
											<label for="nameR"><%=properties.getProperty("BusinessName")%>: </label>
											<input type="text" name="nameR" id="nameR"
												class="text ui-widget-content ui-corner-all" maxlength="70"/>  <div id="redasterisk">*</div>&nbsp;<br />
										 	<label for="websiteR"><%=properties.getProperty("Website")%>: </label>
											<input type="text" name="websiteR" id="websiteR"
												class="text ui-widget-content ui-corner-all"  maxlength="490" style="margin-right: 5px;"/>&nbsp;&nbsp;&nbsp;<br />
											<label for="businessCategoryR"><%=properties.getProperty("BusinessCategory")%>: </label>
											<select name="businessCategoryR" id="businessCategoryR" class="ui-corner-all">
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
											</select>  <div id="redasterisk">*</div>&nbsp;<br />
										<!-- 	<label for="registration_country"><%=properties.getProperty("Country")%>: </label>
											<select id="registration_country" class="ui-corner-all">
												<option value="0"><%=properties.getProperty("BC0")%></option>
											</select> <div id="redasterisk">*</div>&nbsp;<br />
											<label for="registration_city"><%=properties.getProperty("City")%>: </label>
											<select id="registration_city" class="ui-corner-all"></select>  <div id="redasterisk">*</div>&nbsp;<br /> -->								
								</div>
							</div>
						</div>
					
					</div>

		  <fieldset id="signin_menu">
				<div id=signin>
					<form method="post" id="loginForm" action="jsp/loginLogic.jsp">
						<p>
							<label for="login"><%=properties.getProperty("Email")%>: </label>
						<input id="login" name="login" type='email' tabindex="1"/>
					</p>
					<p>
						<label for="login"><%=properties.getProperty("Password")%>: </label>
						<input id="passwd" name="passwd" value="" title="passwd"
							tabindex="2" type="password"/>
					</p>
					<p class="remember demo">
					
						<input id="signin_submit" type="submit" class="button2" style="width:86px"
							value="<%=properties.getProperty("Login")%>" tabindex="3"/>
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

<div id="forgot_pwd_main" title="<%=properties.getProperty("ForgotPwd") %>" style="display:none;">
	<div class="demo">
			<p class="validateTips"><%=properties.getProperty("ForgotPwdMessage") %></p>
			<p style="display:none" class="ui-state-error" id="errorFPEmailRNULL"><%=properties.getProperty("EmailNotNull")%></p>
			<fieldset>
				<label for="emailFP"><%=properties.getProperty("Email") %>: </label>
				<input type="email" name="emailFP" id="emailFP" class="text ui-widget-content ui-corner-all" />
			</fieldset>
	</div>
</div>
<script>
$(function() {
$('#login_button').on('click',function() {
	  $(':input#login').focus();
});
$('#dialog_link').on('click',function() {
	  $(':input#emailR').focus();
});

$('#image_two_link').click(function(e) {
    e.preventDefault();  //stop the browser from following
    window.open("download/LoyapptyButton2<%=footerExt%>.pdf");
    return false;
});
});
</script>
<script type="text/javascript">  
	// No mover necesario para el idioma
				
	var send="<%=properties.getProperty("Send")%>";
	var cancel="<%=properties.getProperty("Cancel")%>";

	$.getScript( "js/index.js" , function () { 
	}); 
	
</script>
</body>
</html>
