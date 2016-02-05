<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%>
  
<%@page import="java.util.*"  %>
<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.apache.log4j.*" %>
<%
	//Logout Logic Kill the session
	JSONObject msg = new JSONObject();
	try{ 
	 	((Logger)session.getAttribute("log")).info("Logout user "+(String)session.getAttribute("login"));
		session.removeAttribute("token");
		session.invalidate();
		msg.put("result","OK");
		out.println(msg);
	}catch(Exception e){
		session.invalidate();
		msg.put("result","OK");
		out.println(msg);
	}
%>