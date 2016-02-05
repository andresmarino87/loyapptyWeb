<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>   
<%@page import="java.io.*"  %>	 
<% 
	//Remove Image
	(new File((String)session.getAttribute("fileBaseSave")+(String)session.getAttribute("fileProfileName"))).delete();
	session.removeAttribute("fileProfileName");	

//Check if image was uploaped
%>