<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>

<%@page import="java.io.*"  %> 
<%@page import="java.util.*"  %> 
<%@page import="org.apache.log4j.*"  %> 
 
 <%
 	try{
 		//Load log
		Properties propertiesLogs = new Properties();
		propertiesLogs.load(application.getResourceAsStream("config"+File.separator+"var.properties"));		
		Logger logger = Logger.getLogger("LoyapptyWeb"); 
		PropertyConfigurator.configure(propertiesLogs.getProperty("logConfigurationBase")+File.separator+"log4j.properties");
		session.setAttribute("log", logger);
 	}catch(Exception e){
 	//	e.printStackTrace();
 	}
%>