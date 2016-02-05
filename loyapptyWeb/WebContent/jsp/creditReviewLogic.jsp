<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%>
 
<%@page import="java.util.*,java.text.NumberFormat"  %>
<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
<%@page import="org.apache.log4j.*" %>
<%
	//Init
	NumberFormat nf= null;
	if(((String)session.getAttribute("language")).equals("1")){  
		nf = NumberFormat.getInstance(Locale.US);
	}else{
		nf = NumberFormat.getInstance(new Locale( "es" , "ES"));
	}
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	Sha1 sha1= new Sha1();
	String result="";
	String [] res=null;
	String [] tags= new String[3];

	Xml xml= new Xml();
	
	String id=(String)session.getAttribute("token");
	
	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";
	
	try{
		result = call.callServlet(url.creditsReviewUrl(id));
		res = xml.getTagsContent(result, tags);
		if(res[0].equals("0014")){
			tags= new String[2];			
			tags[0]="credits";
			tags[1]="response";	
			res = xml.getTagsContent(result, tags);			
			msg.put("credits",nf.format(Integer.parseInt(res[0])));
			out.println(msg);
		}else{
			((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);	
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
	}	
%>