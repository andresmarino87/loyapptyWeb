<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>

<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
 
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
	String country=  request.getParameter("country");

	//XML Tags
	tags[0]="id"; 
 	tags[1]="city_name";
 	tags[2]="cities";
 	tags[3]="city";

	try{ 
		result= call.callServlet(url.citiesLoadUrl(country));
		res=xml.getTagsContentMatrix(result, tags);
		for(int i=0;i<res.length;i++){
			msg = new JSONObject();
			msg.put("id", res[i][0]);
			msg.put("city", res[i][1]);
			array.put(msg);			
		}
		out.println(array);
	} catch (Exception e){
		System.out.println("error conexion"+e);
		out.println("error conexion = "+e);
	}	 
%>