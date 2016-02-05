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
	String [] tags= new String[4];

	Xml xml= new Xml();
	
	String id=(String)session.getAttribute("token");
	
	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="email_verified";
	tags[3]="response";
	
		
	try{
		result = call.callServlet(url.checkValidEmail(id));
		res = xml.getTagsContent(result, tags);
		if(res[0].equals("0014")){
			msg.put("result","OK");
			msg.put("value","");
			msg.put("isValid",res[2]);
			out.println(msg);
		}else{
			msg.put("result","NO");
			msg.put("value","");
			((Logger)session.getAttribute("log")).error("Error "+res[0]+":"+res[1]);	
			out.println(msg);
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+res[0]+":"+res[1]);
	}	
%>