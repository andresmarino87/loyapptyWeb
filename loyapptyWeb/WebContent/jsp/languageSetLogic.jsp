<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%> 

<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.apache.log4j.*" %>
<%
try{
	String language=request.getParameter("language");
	JSONObject msg = new JSONObject();
	
	//Ingles null && 1
	//Español 0
	
	if(language == null){
		session.setAttribute("language","1");
	}else if( language.equals("1")){
		session.setAttribute("language","1"); 	
	}else if( language.equals("0")){
 		session.setAttribute("language","0");
 	}
}catch (Exception e){
	((Logger)session.getAttribute("log")).error("Error "+e);
	e.printStackTrace();
}
%>