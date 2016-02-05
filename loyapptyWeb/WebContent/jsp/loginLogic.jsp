<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%> 

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="loyapptyWeb.*" %>
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.apache.log4j.*"%>

<%
 	//Load Language
 	
 	String language = (String)session.getAttribute("language");
 	InputStream stream = null; 
	if((language == null)){
		stream = application.getResourceAsStream("config/englishConf.properties");	
	}else if(language.equals("1")){
		stream = application.getResourceAsStream("config/englishConf.properties");
	}else if(language.equals("0")){
		stream = application.getResourceAsStream("config/spanishConf.properties");	
	}
	
 	Properties properties = new Properties();
 	properties.load(stream);
 	
 	//Init
 	JSONObject msg = new JSONObject();
 	Sha1 sha1=new Sha1();
  	Xml xml= new Xml();
 	UrlAssambler url = new UrlAssambler(); 
 	ServletCalls call = new ServletCalls();		
	String result="";
 	String login=  request.getParameter("email");
  	String passwd= sha1.sha1(request.getParameter("password"));
  	String [] tags= new String[3];

  	//XML Tags
  	tags[0]="status";
  	tags[1]="reason";
  	tags[2]="response";

 	try{ 
 		result= call.callServlet(url.loginUrl(login,passwd));
 		tags= xml.getTagsContent(result, tags);
 		if(tags[0].equals("0014")){
 			//Tags to read
 			tags= new String[4];
 			tags[0]="status";
 		  	tags[1]="reason";
 			tags[2]="id";
 		  	tags[3]="response";
 			tags= xml.getTagsContent(result, tags);
			msg.put("result", "OK");
			msg.put("value", "");
			session.setAttribute("login",login);
			session.setAttribute("token",tags[2]);
			session.setAttribute("isCustomImageMain",request.getParameter("isCustom"));
			//set cockie
			if(request.getParameter("cookieCheck").equals("1")){
				Cookie cookie = new Cookie("userName", login);
				cookie.setMaxAge(365*24*60*60);
				response.addCookie(cookie);
			}else{
				Cookie cookie = new Cookie("userName", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			((Logger)session.getAttribute("log")).info("Login user "+login);
			out.println(msg);
 		}else if(tags[0].equals("0025") || tags[0].equals("0027")){
			msg.put("result", "InvalidPwd");
			msg.put("value", properties.getProperty("InvalidPwdorEmail"));
			((Logger)session.getAttribute("log")).warn(login+" trying to login... Email or password is incorrect");
			out.println(msg);
		}else{
			((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
			System.out.println("Error "+tags[0]+":"+tags[1]);
			msg.put("result", "NO");
			msg.put("value", properties.getProperty("FatalError"));
			out.println(msg);
		}
 	} catch (Exception e){
 		msg.put("result", "FATAL");
		msg.put("value", "");
		out.println(msg);
 	}
 %>