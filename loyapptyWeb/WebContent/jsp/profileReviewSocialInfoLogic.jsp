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
<%@page import="org.apache.log4j.*"  %>
<%@page import="java.net.URLEncoder"  %> 
<%@page import="java.net.*"  %> 

 <% 
	//Init
	URL shortUrl = null;
	URLConnection yc = null;
	BufferedReader in = null;
	String shotenedUrl;
	String result="";
	String token=(String)session.getAttribute("token");
	String [] tags =  new String[7];
	String [] res =null;
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();

	Xml xml= new Xml();

	//load properties file
	
	InputStream stream = null;
	stream = application.getResourceAsStream("config/var.properties");
	Properties properties = new Properties();
	properties.load(stream);
	
	//XML Tags
 	tags[0]="status";
 	tags[1]="reason";
 	tags[2]="fb_access_token";
 	tags[3]="fb_uid";
 	tags[4]="tw_token_id";
 	tags[5]="tw_token_secret";
 	tags[6]="response";
	
 	try{ 
		result=call.callServlet(url.profileReviewSocialInfo((String)session.getAttribute("token")));
		res = xml.getTagsContent(result, tags);
		if(res[0].equals("0014")){
			msg.put("result","OK");
			msg.put("fb_access_token",res[2]);
			msg.put("fb_uid",res[3]);
			msg.put("tw_token_id",res[4]);
			msg.put("tw_token_secret",res[5]);
			out.println(msg);
		}else if(res[0].equals("0003")){
			msg.put("result","noFound");
			msg.put("value","noFound");
			out.println(msg);
		}else {
			((Logger)session.getAttribute("log")).error("Error "+res[0]+":"+res[1]);
			msg.put("result","NO");	
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		}
 	} catch (Exception e){
 		((Logger)session.getAttribute("log")).error("Error "+e);
	}	
%>