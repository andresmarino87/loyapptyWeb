<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%>
 
<%@page import="java.util.*"  %>
<%@page import="java.io.*"  %>
<%@page import="java.lang.*" %>
<%@page import="loyapptyWeb.*"  %>
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.apache.log4j.*" %> 
 <%
   	//Load Language
	String language =  request.getParameter("actualLanguage");
 	String lan="";
	InputStream stream = null; 
	if((language == null)){
		stream = application.getResourceAsStream("config/englishConf.properties");	
		lan="en";
	}else if(language.equals("1")){
		stream = application.getResourceAsStream("config/englishConf.properties");
		lan="en";
	}else if(language.equals("0")){
		stream = application.getResourceAsStream("config/spanishConf.properties");	
		lan="es";
	}
   	Properties properties = new Properties();
   	properties.load(stream);
    
   	//Init
   	JSONObject msg = new JSONObject();
   	UrlAssambler url = new UrlAssambler(); 
   	ServletCalls call = new ServletCalls();		
   	Xml xml= new Xml();
   	String result="";
   	String email= request.getParameter("emailFP");	
   	String [] tags =  new String[3];
	
   	//XML Tags
   	tags[0]="status";
	tags[1]="reason";
	tags[2]="response";
    	
	try{ 
		result= call.callServlet(url.forgotPasswordUrl(email,lan));
		tags= xml.getTagsContent(result, tags);		
   		if(tags[0].equals("0009")){
			((Logger)session.getAttribute("log")).info("User "+email+" has recovered password");
   			msg.put("result", "OK");
			msg.put("value", "");
			out.print(msg);
   		}else if(tags[0].equals("0004")){  
			msg.put("result", "invalidEmail");
			msg.put("value", properties.getProperty("InvalidEmail"));
			((Logger)session.getAttribute("log")).info(msg);
			out.print(msg);
		}else{
			((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
			msg.put("result", "NO");
			msg.put("value", properties.getProperty("FatalError"));
			((Logger)session.getAttribute("log")).info(msg);
			out.print(msg);
   		}	
   	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
   		msg.put("value",e);
   		out.println(msg);
   	}
   %>