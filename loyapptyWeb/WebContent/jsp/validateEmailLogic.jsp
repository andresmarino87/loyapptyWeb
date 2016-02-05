<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%>
 
<%@page import="java.util.*,java.text.NumberFormat"  %>
<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
<%@page import="org.apache.log4j.*" %>
<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	String result="";
	String [] res=null;
	String [] tags= new String[3];

	Xml xml= new Xml();
	
	String id=(String)session.getAttribute("token");
	String language=(String)session.getAttribute("language");
	
	//lan
	if(language.equals("1")){
		language="en";
	}else if(language.equals("0")){
		language="es";
	}
	
	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";
		
	try{
		result = call.callServlet(url.validateEmail(id, language));
		res = xml.getTagsContent(result, tags);
		if(res[0].equals("0014")){
			session.setAttribute("isEmailVerifying", "true");
			msg.put("result","OK");
			msg.put("value",(String)session.getAttribute("CheckValidateSendMsg"));
			out.println(msg);
		}else{
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("FatalError"));
			((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);	
			out.println(msg);
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
	}	
%>