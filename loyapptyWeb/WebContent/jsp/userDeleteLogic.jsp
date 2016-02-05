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
	String result="";
	String token=(String)session.getAttribute("token");
	String [] tags =  new String[3];
	String [] res =  null;
	String [] ids =  null;
	int cen=0;
	
 	Xml xml= new Xml();

 	ids = request.getParameter("sData").replace("&", "").split("userId=");	
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";
 	
 	for(int i=0;i<ids.length;i++){
 		out.println(ids[i]);
 	}
/* 	try{ 
		UserBeanProxy aux= new UserBeanProxy();
		for(int i=0;i<ids.length;i++){
			if(!(ids[i].equals(""))){
				result=aux.cancelSubAccount(token,"", ids[i]);
				res =xml.getTagsContent(result, tags);
				if(res[0].equals("0007")){
					cen=2;
					break;
				}else if(!(res[0].equals("0024"))){
					cen = 1;
					break;
				}
			} 
		}
		switch (cen){
		case 0:
			out.println("OK");		
			break;
		case 1:
			System.out.println("error = "+res[1]);	
			out.println("NO");
			break;
		case 2:
			session.removeAttribute("token");
			out.println("noToken");
			break;
		}
	} catch (Exception e){
		out.println("error ="+e);
	}	*/
%>
