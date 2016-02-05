<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>
 
<%@page import="java.util.*"  %>
<%@page import="java.io.*"  %>
<%@page import="java.lang.*" %>
<%@page import="loyapptyWeb.*"  %>

 <%
//Ignorar
/*	String result="";
	String token=(String)session.getAttribute("token");
	String [] tags =  new String[3];
	String [] ids =  null;
	
 	Xml xml= new Xml();

 	ids = request.getParameter("sData").replace("&", "").split("suscriptorId=");	
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";
 	
 	try{ 
		result = xml.idsContacts(ids);
		AddressBookBeanProxy aux= new AddressBookBeanProxy();
		result = aux.removeContacts(token, result);
		tags=xml.getTagsContent(result, tags);
		
		if(tags[0].equals("3005")){
			out.println("OK");
		}else if(tags[0].equals("0007")){
			session.removeAttribute("token");
			out.println("noToken");
		}else{
			System.out.println("error = "+tags[1]);	
			out.println("NO");
		}		
	} catch (Exception e){
		out.println("error conexion"+e);
	}	*/
%>