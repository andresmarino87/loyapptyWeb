<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,java.util.*,org.apache.log4j.*"%>
<!DOCTYPE html>
<html>
<head>
	<% 
		session = request.getSession(true);
		
		/*Initial parameters*/	
		String id = request.getParameter("id");
		String challenge = request.getParameter("challenge");
		if(id == null || challenge == null){
			response.sendRedirect("index.jsp");
		}
		
		/*Manejo de idioma*/
		String language = request.getParameter("lan").toLowerCase();
		InputStream stream = null;
		Properties properties = new Properties();
		//Null is default
		if(language == null){
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");		
		}else if(language.equals("en")){
			stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");			
		}else if(language.equals("es")){
			stream = application.getResourceAsStream("config"+File.separator+"spanishConf.properties");	
		}		
		properties.load(stream);				
	%>
	
	<!-- JQuery -->	
	<script type="text/JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
	
	<!-- Style -->
	<link rel="stylesheet" href="css/styles.css" type="text/css" />

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Loyappty</title>

</head>
<body>
	<div id='validateEmailPageHead' align="center"><img src="images/logo2.png" alt="" width="200"/></div>
	<div id='validateEmailMiddle' align="center">
		<span id="emailIsValidMsg" class="validateEmailMsg" style="display:none"><%= properties.getProperty("ValidatePageSuccessMsg") %></span>
		<span id="emailIsNotValidMsg" class="validateEmailMsg" style="display:none"><%= properties.getProperty("ValidatePagefailureMsg") %></span>
		<br>
	</div>
	<div id='validateEmailPageFooter' align="center">
		<a href="copyrightpolicy.html">© 2012</a> <span class='loyapptyBlueStyle' style="color:#25ACF3!important;">Loyappty (<%=properties.getProperty("Adivisionof") %></span> <a href="http://www.ogangi.com" target="_blank">Ogangi Corporation</a>)
	</div>
	<script type="text/javascript">  
	var id="<%=id%>";
	var challenge="<%=challenge%>";
	$.getScript( "js/validateEmail.js" , function () { 
	}); 
	</script>
</body>
</html>