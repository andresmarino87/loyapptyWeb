<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%> 

<%@page import="org.codehaus.jettison.json.JSONObject"  %> 

<%
//Set Coockie
JSONObject msg=new JSONObject();
Cookie cookie=null;
boolean found=false;
Cookie[] cookies = request.getCookies();
for(int i = 0; i < cookies.length; i++){
	cookie = cookies[i];
	if(cookie.getName().equals("userName")){
		found=true;
		msg.put("result","OK");
		msg.put("userName",cookie.getValue());
		msg.put("check","checked");
	}
}

if(!found){
	msg.put("result","NO");
	msg.put("check","unChecked");
}

out.println(msg);
%>