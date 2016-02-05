<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* Autor: Andrés Mariño
	*/%>

<%@page import="java.util.*"  %>
<%@page import="java.io.*"  %>
<%@page import="java.lang.*" %>
<%@page import="loyapptyWeb.*"  %>
<%@page import="org.codehaus.jettison.json.JSONObject"  %>
<%@page import="org.apache.log4j.*"%>
<%@page import="java.net.URLEncoder" %>

<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();
	JSONObject arg = new JSONObject();
	JSONObject msg = new JSONObject();
	String result="";
	String rest="";
	String [] res=null;
	String [] tags= new String[3];
	Xml xml= new Xml();

	System.out.println("result");
	String token=(String)session.getAttribute("token");
	String oauth_token=request.getParameter("oauth_token");
	String oauth_verifier=request.getParameter("oauth_verifier");	
		
	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";

	if(oauth_token!=null && oauth_verifier!=null){
		// aditional Parameters
		rest=rest+"&twTokenId="+oauth_token+"&twTokenSecret="+oauth_verifier;		
	}
	
	try{
		result = call.callServlet(url.clientSocialInfoUpdate(token, rest));
		res = xml.getTagsContent(result, tags);
		System.out.println(url.clientSocialInfoUpdate(token, rest));
		System.out.println(result);
		if(res[0].equals("0014")){
			msg.put("result","OK");
			out.println(msg);
		}else{
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
	}	
%>