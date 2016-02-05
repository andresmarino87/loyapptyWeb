<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%>

<%@page import="loyapptyWeb.*,org.codehaus.jettison.json.JSONObject,org.codehaus.jettison.json.JSONArray,org.apache.log4j.*"%> 
<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();
	JSONArray array = new JSONArray();
	Xml xml= new Xml();

	JSONObject msg= new JSONObject();
	String result="";
	String [][] res=null;
	String [] tags =new String[3];

	String id=request.getParameter("id");
	String challenge=request.getParameter("challenge");
	
	//XML Tags	
  	tags[0]="status";
  	tags[1]="reason";
  	tags[2]="response";

	try{
		result= call.callServlet(url.validateEmailSecondStep(id, challenge));
 		tags= xml.getTagsContent(result, tags);
		if(tags[0].equals("0014")){
			session.setAttribute("firstTime","1");
			msg.put("result", "OK");
			out.println(msg);		
		}else if(tags[0].equals("0044")){
			msg.put("result", "NO");
			out.println(msg);
		}else{
			msg.put("result", "NO");
			out.println(msg);
		}
	} catch (Exception e){
//		((Logger)session.getAttribute("log")).error("Error "+e);
//		out.println("error conexion = "+e);
	}	
%>