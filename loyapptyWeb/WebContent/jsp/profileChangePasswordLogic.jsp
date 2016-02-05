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
<%@page import="org.codehaus.jettison.json.JSONObject"  %>
<%@page import="org.apache.log4j.*"%>
<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();
	JSONObject arg = new JSONObject();
	JSONObject msg = new JSONObject();
	Sha1 sha1= new Sha1();
	String result="";
	String [] res=null;
	String [] tags= new String[3];
	Xml xml= new Xml();

	String id=(String)session.getAttribute("token");
	int	type=Integer.parseInt(request.getParameter("type"));
	String value=request.getParameter("profileEditBox");
	String modify="";

	switch (type){
		case 1: modify="password";
			value = sha1.sha1(value);
			break;
	}		

	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";

	try{
		result = call.callServlet(url.editProfileUrl(id, modify, value));
		res = xml.getTagsContent(result, tags);

		if(res[0].equals("0010")){
			((Logger)session.getAttribute("log")).info("User "+(String)session.getAttribute("login")+" has modified profile");
			session.setAttribute("ProfileXml",call.callServlet(url.profileReviewUrl(id)));
			msg.put("result","OK");
			msg.put("value",(String)session.getAttribute("OK"));
			out.println(msg);
		}else{
			((Logger)session.getAttribute("log")).error("User "+(String)session.getAttribute("login")+" cannot modified profile "+res[0]+":"+res[1]);
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
	}	
%> 