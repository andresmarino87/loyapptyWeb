<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%>

<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
<%@page import="org.apache.log4j.*"%> 
 <%
 	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();
	JSONArray array = new JSONArray();
	Xml xml= new Xml();

	JSONObject msg= null;
	String result="";
	String [][] res=null;
	String [] tags =new String[4];

	//XML Tags	
	tags[0]="country_name"; 
 	tags[1]="country_iso_code";
 	tags[2]="countries";
 	tags[3]="country";

	try{ 
		result= call.callServlet(url.countriesLoadUrl());
		res=xml.getTagsContentMatrix(result, tags);
		for(int i=0;i<res.length;i++){
			msg = new JSONObject();
			msg.put("country", res[i][0]);
			msg.put("iso", res[i][1]); 
			array.put(msg);			
		}
		out.println(array);
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
		out.println("error conexion = "+e);
	}	 
%>