<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="loyapptyWeb.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.net.URL" %>
<%@page import="java.net.*" %>	
<%@page import="org.codehaus.jettison.json.JSONObject"%>
<%@page import="org.apache.log4j.*" %>
<%@page import="java.net.URL" %>
<%@page import="java.net.*" %>
<%@include file="jsp/logsLogic.jsp" %>

<%
	if(request.getParameter("error")!= null && request.getParameter("error").equals("access_denied")){						
		response.sendRedirect("./index.jsp");
	}

	InputStream stream = application.getResourceAsStream("config"+File.separator+"var.properties");
	Properties properties = new Properties();
	properties.load(stream);
	String code=request.getParameter("code");
	String lan=request.getParameter("lan");
	String lang=lan;
	if( (String)session.getAttribute("language") == null ){
		if(lan == null){
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");
			session.setAttribute("language","1");
		}else if (lan.equals("EN")){
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
	String FBId="";
	String FBEmail="";

	if(code!=null){
		try {
			String result="";
			String rest="";
			Xml xml= new Xml();
			UrlAssambler url = new UrlAssambler(); 
			ServletCalls call = new ServletCalls();
 			String [] tags= new String[3];
			String arg[]=null;
	    	URL urlFB = new URL("https://graph.facebook.com/oauth/access_token?code="+code+"&redirect_uri="+properties.getProperty("thisServerBase")+"facebookBridge.jsp?lan="+lang+"&client_cred&client_id="+properties.getProperty("facebookAppId")+"&client_secret="+properties.getProperty("facebookAppSecret"));
			String outputXml="";
			DataInputStream in = new DataInputStream(urlFB.openStream());
			String line = "";
			while ((line = in.readLine()) != null) {
				outputXml += line; 
			}
			in.close();
			arg=outputXml.split("&");
			urlFB = new URL("https://graph.facebook.com/me?access_token="+arg[0].split("=")[1]);
			in = new DataInputStream(urlFB.openStream());
			line = "";
			outputXml="";
			while ((line = in.readLine()) != null) {
				outputXml += line; 
			}
			in.close();	
			tags[0]="status"; 
			tags[1]="reason";
			tags[2]="response";
			JSONObject msg = new JSONObject(outputXml);
			result = call.callServlet(url.profileReviewGeneric("facebook", msg.getString("email")));
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
				FBId=msg.getString("id");
				FBEmail=msg.getString("email");
			}
	}catch (MalformedURLException e) { 
		((Logger)session.getAttribute("log")).error(e);

	    // new URL() failed
	    // ...
	}catch (Exception e){
		((Logger)session.getAttribute("log")).error(e);
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
<div id='facebookBridgePageHead' align="center"><img src="images/logo2.png" alt="" width="200"/></div>
	<div id='facebookMiddle' align="center">
		<br>
		<p style="display: none" class="ui-state-error facebookErrors" id="errorFBNameNULL"><font color="red"><%=displayLan.getProperty("ErrorRNameNULL")%></font></p>
		<p style="display: none" class="ui-state-error facebookErrors" id="errorFBBCNULL"><font color="red"><%=displayLan.getProperty("ErrorRBCNULL")%></font></p>
		<p style="display: none" class="ui-state-error facebookErrors" id="errorFBRedirectToIndex"><font color="red"><%=displayLan.getProperty("AlreadyRegisteredToIndex")%></font></p>
			
		<form id="FBform" method="post">
			<table id="FBtable" style="margin: 15px 0 0 0;">
				<tr>
					<td align="left" class="tablesignup_label"><label for="BussinesNameFB"><%=displayLan.getProperty("BusinessName")%>: </label></td>
					<td align="left"><input id="BussinesNameFB" type="text"/></td>
				</tr>	
				<tr>
					<td align="left" class="tablesignup_label"><label for="businessCategoryFB"><%=displayLan.getProperty("BusinessCategory")%>: </label></td>
					<td align="left">
						<select id="BussinesCategoryFB">
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
	
	
	<div id='facebookEmailPageFooter' align="center">
		<a href="copyrightpolicy.html">© 2012</a> <span class='loyapptyBlueStyle' style="color:#25ACF3!important;">Loyappty (<%=displayLan.getProperty("Adivisionof") %></span> <a href="http://www.ogangi.com" target="_blank">Ogangi Corporation</a>)
	</div>
	<script type="text/javascript">  
	// No mover necesario para el idioma
		var ErrorRNameNULL="<%=displayLan.getProperty("ErrorRNameNULL") %>";
		var ErrorRBCNULL="<%=displayLan.getProperty("ErrorRBCNULL") %>";
		var AlreadyRegisteredToIndex="<%=displayLan.getProperty("AlreadyRegisteredToIndex") %>";
		var FBId="<%=FBId%>";
		var FBEmail="<%=FBEmail%>";
		$.getScript( "js/facebookBridge.js" , function () { 
		});
	</script>   
</body>
</html>