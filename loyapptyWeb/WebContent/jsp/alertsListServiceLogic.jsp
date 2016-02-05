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

	JSONObject result= null;
	String serviceXml="";
	String [][] res=null;
	String [] tags =new String[4];
	String token=(String)session.getAttribute("token");

	//Xml Tags	
 	tags[0]="id"; 
 	tags[1]="name";
 	tags[2]="services";
 	tags[3]="service";

 	//Check session Exits 	
 	if(session.getAttribute("ServiceXml") == null){
 		session.setAttribute("ServiceXml",call.callServlet(url.serviceLoadUrl(token)));
 	}
 	
	try{ 
		serviceXml=(String)session.getAttribute("ServiceXml");
		res=xml.getTagsContentMatrix(serviceXml, tags);
		for(int i=0;i<res.length;i++){
			result = new JSONObject();
			result.put("id", res[i][0]);
			result.put("name", res[i][1]);
			array.put(result);			
		}
		out.println(array);
	} catch (Exception e){
		System.out.println("error conexion"+e);
		out.println("error conexion = "+e);
	}	 
%>