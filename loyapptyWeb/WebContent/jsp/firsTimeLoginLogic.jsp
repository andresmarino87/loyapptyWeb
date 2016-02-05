<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%> 

<%@page import="org.codehaus.jettison.json.JSONObject"  %> 

<%
	//Check First Time Login
 	JSONObject msg = new JSONObject();
 	if((String)session.getAttribute("firstTime")==null){
		msg.put("result", "OK");
		msg.put("value","NO");
		out.println(msg);
 	}else{
 		msg.put("result", "OK");
		msg.put("value","YES");
		out.println(msg);
 	}
 %>