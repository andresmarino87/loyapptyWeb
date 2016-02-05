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
	String result="";
 
	String token=(String)session.getAttribute("token");
	String [] contacts_info= new String[5];
	String [] tags =  new String[3];
	String type;
	String id;
	String name;
	String mobile;
	String email;
	String content;
	
		
 	Xml xml= new Xml();
 	
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";
 	
 	type=request.getParameter("editType");
 	id=request.getParameter("editId");
 	name=request.getParameter("editName");
 	mobile=request.getParameter("editMobile");
 	email=request.getParameter("editEmail");
 	content=request.getParameter("editBox");
	if(type.equals("0")){
		contacts_info[0]=id;
		contacts_info[1]=content;
		contacts_info[2]=mobile;
		contacts_info[3]=email;
	}else if(type.equals("1")){
		contacts_info[0]=id;
		contacts_info[1]=name;
		contacts_info[2]=content;
		contacts_info[3]=email;
	}else{
		contacts_info[0]=id;
		contacts_info[1]=name;
		contacts_info[2]=mobile;
		contacts_info[3]=content;
	}
	
/*	result= xml.editContact(contacts_info);
	
 	try{ 
		AddressBookBeanProxy aux= new AddressBookBeanProxy();
		
		result = aux.editContacts(token, result);
		tags=xml.getTagsContent(result, tags);
	//	out.println(result);
		
		if(tags[0].equals("3012")){
			out.println("OK");	
		}else if(tags[0].equals("0007")){
			out.println("noToken");	
		}else{
			System.out.println("error = "+tags[1]);	
			out.println("NO"+tags[1]);		
		}	
	} catch (Exception e){
		out.println("error conexion"+e);
	}*/	
%>