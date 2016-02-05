<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>   
<%@page import="java.io.*"  %>	 
<% 
	(new File((String)session.getAttribute("fileBaseSave")+(String)session.getAttribute("fileServiceTempName"))).delete();
	session.removeAttribute("fileServiceTempName");	

//Check if image was uploaped
%>