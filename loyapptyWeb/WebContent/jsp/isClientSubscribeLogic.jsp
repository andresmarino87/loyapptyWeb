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
 	//Init
 	JSONObject msg = new JSONObject();
 	Sha1 sha1=new Sha1();
  	Xml xml= new Xml();
 	UrlAssambler url = new UrlAssambler(); 
 	ServletCalls call = new ServletCalls();		
	String result="";
  	String [] tags= new String[4];

  	//XML Tags
  	tags[0]="status";
  	tags[1]="reason";
  	tags[2]="active_subscription";
  	tags[3]="response";

 	try{ 
 		result= call.callServlet(url.isClientSubscribe((String)session.getAttribute("token")));
 		tags= xml.getTagsContent(result, tags);
 		if(tags[0].equals("0014")){
			msg.put("result", "OK");
			msg.put("value", tags[2]);
			out.println(msg);
 		}else{
			((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
			System.out.println("Error "+tags[0]+":"+tags[1]);
			msg.put("result", "NO");
			out.println(msg);
		}
 	} catch (Exception e){
 		msg.put("result", "FATAL");
		msg.put("value", "");
		out.println(msg);
 	}
 %>