<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="twitter4j.*" %>
<%@page import="twitter4j.Twitter" %>
<%@page import="twitter4j.auth.RequestToken" %>
<%@page import="twitter4j.auth.AccessToken" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="loyapptyWeb.*" %>
<%@include file="jsp/logsLogic.jsp" %>

<%
	if(request.getParameter("denied")!= null){			
		response.sendRedirect("./index.jsp");
	}

	InputStream stream = application.getResourceAsStream("config"+File.separator+"var.properties");
	Properties propertiesURL = new Properties();
	propertiesURL.load(stream);
	
	//language
	String lan=request.getParameter("lan");
	String lang=lan;
	if( (String)session.getAttribute("language") == null ){
		if(lan == null){
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");
			session.setAttribute("language","1");
		}else if(lan.equals("EN")){
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");
			session.setAttribute("language","1");
		}else if(lan.equals("ES")){
			stream = application.getResourceAsStream("config"+File.separator+"spanishConf.properties");
			session.setAttribute("language","0");
		}else{
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");
			session.setAttribute("language","1");
		}
	}else{
		if(((String)session.getAttribute("language")).equals("0")){
			stream = application.getResourceAsStream("config"+File.separator+"spanishConf.properties");
		}else{
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");
		}		
	}
	Properties displayLan = new Properties();
	displayLan.load(stream);	
	
	String [] tags = new String[3];
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	Xml xml= new Xml();
	String result="";
	String TToken="";
	String TSecret="";
	String TWho="";
	String oauth_token=request.getParameter("oauth_token");
	String oauth_verifier=request.getParameter("oauth_verifier");
	String code=request.getParameter("code");
	
	if(oauth_token!=null && oauth_verifier!=null){
		Twitter twitter = new TwitterFactory().getInstance();
		twitter.setOAuthConsumer(propertiesURL.getProperty("twitterConsumerKey"), propertiesURL.getProperty("twitterConsumerSecret"));
		RequestToken reqToken =new RequestToken(oauth_token, propertiesURL.getProperty("twitterConsumerSecret")); 		
		AccessToken accessToken = twitter.getOAuthAccessToken(reqToken, oauth_verifier);
		tags[0] = "status"; 
		tags[1] = "reason";
		tags[2] = "response";
		result = call.callServlet(url.profileReviewGeneric("twitter", accessToken.getScreenName()));
		tags=xml.getTagsContent(result, tags);		
		if(tags[0].equals("0014")){
			tags=new String[3];
			tags[0]="id";
		 	tags[1]="email";
		 	tags[2]="client";
			tags=xml.getTagsContent2(result, tags);
			session.setAttribute("login",tags[1]);
			session.setAttribute("token",tags[0]);
			((Logger)session.getAttribute("log")).info("Login user "+tags[1]);
			response.sendRedirect("./main.jsp");
		}else if(tags[0].equals("0003")){
			TToken=accessToken.getToken();
			TSecret=accessToken.getTokenSecret();
			TWho=accessToken.getScreenName();
		}		
	}
%>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Loyappty</title>
	<script type="text/JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
	
	<link rel="StyleSheet" type="text/css" href="css/styles.css"></link>
	<link rel="StyleSheet" type="text/css" href="css/fileuploader.css"></link>
	
</head>
<body>
	<div id='twitterBridgePageHead' align="center"><img src="images/logo2.png" alt="" width="200"/></div>
	<div id='twitterMiddle' align="center">
		<br>
		<p style="display: none" class="ui-state-error twitterErrors" id="errorTEmailRNULL"><font color="red"><%=displayLan.getProperty("EmailNotNull")%></font></p>
		<p style="display: none" class="ui-state-error twitterErrors" id="errorTValidEmail"><font color="red"><%=displayLan.getProperty("EmailNotValid")%></font></p>
		<p style="display: none" class="ui-state-error twitterErrors" id="errorTNameNULL"><font color="red"><%=displayLan.getProperty("ErrorRNameNULL")%></font></p>
		<p style="display: none" class="ui-state-error twitterErrors" id="errorTBCNULL"><font color="red"><%=displayLan.getProperty("ErrorRBCNULL")%></font></p>
		<p style="display: none" class="ui-state-error twitterErrors" id="errorTRedirectToIndex"><font color="red"><%=displayLan.getProperty("AlreadyRegisteredToIndex")%></font></p>
		
		<form id="Tform" method="post">
			<table id="TWtable" style="margin: 15px 0 0 0;">
				<tr>
					<td align="left" class="tablesignup_label"><label for="EmailT"><%=displayLan.getProperty("Email")%>: </label></td>
					<td align="left"><input id="EmailT" type="email"/></td>
				</tr>
				<tr>
					<td align="left" class="tablesignup_label"><label for="BussinesNameT"><%=displayLan.getProperty("BusinessName")%>: </label></td>
					<td align="left"><input id="BussinesNameT" type="text"/></td>
				</tr>	
				<tr>
					<td align="left" class="tablesignup_label"><label for="businessCategoryT"><%=displayLan.getProperty("BusinessCategory")%>: </label></td>
					<td align="left">
						<select id="BussinesCategoryT">
							<option value=0 selected="selected"><%=displayLan.getProperty("BC0")%></option>
							<option value=1><%=displayLan.getProperty("BC1")%></option>
							<option value=3><%=displayLan.getProperty("BC3")%></option>
							<option value=4><%=displayLan.getProperty("BC4")%></option>
							<option value=5><%=displayLan.getProperty("BC5")%></option>
							<option value=8><%=displayLan.getProperty("BC8")%></option>
							<option value=9><%=displayLan.getProperty("BC9")%></option>
							<option value=10><%=displayLan.getProperty("BC10")%></option>
							<option value=14><%=displayLan.getProperty("BC14")%></option>
							<option value=17><%=displayLan.getProperty("BC17")%></option>
							<option value=18><%=displayLan.getProperty("BC18")%></option>
							<option value=19><%=displayLan.getProperty("BC19")%></option>
						</select>
					</td>
				</tr>
				<tr>
				    <td colspan="2" align="center"><input type="submit" class="qq-upload-button" value="<%=displayLan.getProperty("Continue")%>" style="margin: 10px 0 0 0;"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id='twitterPageFooter' align="center">
		<a href="copyrightpolicy.html">© 2012</a> <span class='loyapptyBlueStyle' style="color:#25ACF3!important;">Loyappty (<%=displayLan.getProperty("Adivisionof") %></span> <a href="http://www.ogangi.com" target="_blank">Ogangi Corporation</a>)
	</div>
	
	<script type="text/javascript">  
	// No mover necesario para el idioma
		var EmailNotNull="<%=displayLan.getProperty("EmailNotNull")%>";
		var EmailNotValid="<%=displayLan.getProperty("EmailNotValid")%>";
		var ErrorRNameNULL="<%=displayLan.getProperty("ErrorRNameNULL")%>";
		var ErrorRBCNULL="<%=displayLan.getProperty("ErrorRBCNULL")%>";
		var AlreadyRegisteredToIndex="<%=displayLan.getProperty("AlreadyRegisteredToIndex")%>";		
		var TToken="<%=TToken%>";
		var TSecret="<%=TSecret%>";
		var TWho="<%=TWho%>";		
		$.getScript( "js/twitterBridge.js" , function(){});
	</script>   
</body>
</html>