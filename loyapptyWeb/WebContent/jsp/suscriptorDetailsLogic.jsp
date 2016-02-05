<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>
 
<%@page import="java.util.*"  %>
<%@page import="java.io.*"  %>
<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %>
<%@page import="java.net.URLEncoder"  %> 
<%@page import="org.apache.log4j.*" %>
<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	JSONObject auxCodes = null;
	JSONArray array = new JSONArray();

	String result="";
	String resultCodes="";
	String [] res=null;
	String [][] resParameters=null;
	String [] tags =new String[4];
	String [] tags2=new String[3];
	Xml xml= new Xml();
	String token=(String)session.getAttribute("token");
	String userId = request.getParameter("userId");

	//XML Tags
 	tags[0]="key";
 	tags[1]="value";
 	tags[2]="parameters";
 	tags[3]="parameter";
 	 	
	tags2[0]="status";
	tags2[1]="reason";
	tags2[2]="response";

	try{ 
		result=call.callServlet(url.subscriberReviewParameters(userId,token));
		res=xml.getTagsContent(result, tags2);
		if(res[0].equals("0014")){
			resParameters=xml.getTagsContentMatrix(result, tags);
			for(int i=0;i<resParameters.length;i++){
				//Read Parameters
				if(resParameters[i][0].equalsIgnoreCase("f_name")){
					msg.put((String)session.getAttribute("FirstName"),resParameters[i][1]);		
				}else if(resParameters[i][0].equalsIgnoreCase("l_name")){
					msg.put((String)session.getAttribute("LastName"),resParameters[i][1]);		
				}else if(resParameters[i][0].equalsIgnoreCase("email")){
					msg.put((String)session.getAttribute("Email"),resParameters[i][1]);		
				}else if(resParameters[i][0].equalsIgnoreCase("mobile")){
					msg.put((String)session.getAttribute("Mobile"),resParameters[i][1]);		
				}else if(resParameters[i][0].equalsIgnoreCase("fb")){
					msg.put((String)session.getAttribute("FB"),resParameters[i][1]);		
				}else if(resParameters[i][0].equalsIgnoreCase("tw")){
					msg.put((String)session.getAttribute("FB"),resParameters[i][1]);		
				}else if(resParameters[i][0].equalsIgnoreCase("city")){
					msg.put((String)session.getAttribute("City"),resParameters[i][1]);		
				}else if(resParameters[i][0].equalsIgnoreCase("zip")){
					msg.put((String)session.getAttribute("Zip"),resParameters[i][1]);		
				}else{
					msg.put(resParameters[i][0],resParameters[i][1]);
				}
			}
			msg.put("result","OK");
		}else{
			msg.put("result","NO");
			((Logger)session.getAttribute("log")).error(res[0]+":"+res[1]);
		}
		out.println(msg);
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
		out.println("error conexion = "+e);
	}	
%>
