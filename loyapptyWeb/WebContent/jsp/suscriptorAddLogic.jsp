<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>
 
<%@page import="java.util.*"  %>
<%@page import="java.lang.*" %>
<%@page import="loyapptyWeb.*"  %>

 <%
 //Ignore
/*	String result="";
	String token=(String)session.getAttribute("token");
	String [] contacts_info= new String[4];
	String [] tags =  new String[3];
	
 	Xml xml= new Xml();
 	
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";
 	
 	contacts_info[0]=request.getParameter("name");
 	contacts_info[1]=request.getParameter("last_name");
 	contacts_info[2]=request.getParameter("mobile");
 	contacts_info[3]=request.getParameter("email");
 	try{ 
/*		result = xml.addContacts(contacts_info);
		AddressBookBeanProxy aux= new AddressBookBeanProxy();
		result = aux.insertContacts(token, result);
		tags=xml.getTagsContent(result, tags);

		if(tags[0].equals("3003")){
			out.println("OK");	
		}else if(tags[0].equals("0007")){
			out.println("noToken");	
		}else{
			System.out.println("error = "+tags[1]);	
			out.println("NO");		
		}	
	} catch (Exception e){
		out.println("error conexion"+e);
	}*/	
%>