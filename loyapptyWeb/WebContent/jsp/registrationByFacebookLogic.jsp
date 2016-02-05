<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /* 
	*
	* Autor: Andrés Mariño
	*
	*/%> 

<%@page import="java.io.*"  %>
<%@page import="java.util.*"  %>
<%@page import="loyapptyWeb.*"  %>
<%@page import="org.codehaus.jettison.json.JSONObject"  %>
<%@page import="org.apache.log4j.*" %> 
<%@page import="java.net.URLEncoder" %> 

<%
	//Load Language
	String lan="";
	InputStream stream = null;
	if((((String)session.getAttribute("language")) == null)){
		stream = application.getResourceAsStream("config/englishConf.properties");	
		lan="en";
	}else if(((String)session.getAttribute("language")).equals("1")){
		stream = application.getResourceAsStream("config/englishConf.properties");
		lan="en";
	}else if(((String)session.getAttribute("language")).equals("0")){
		stream = application.getResourceAsStream("config/spanishConf.properties");	
		lan="es";
	}
	Properties propertiesLan = new Properties();
	propertiesLan.load(stream); 
   
  	//----------------------------------------//

	//Load Initial Credits
	stream = application.getResourceAsStream("config/var.properties");
	Properties propertiesVar = new Properties();
	propertiesVar.load(stream); 
   
  	//----------------------------------------//
  	
  	Sha1 sha1 = new Sha1();
  	UrlAssambler url = new UrlAssambler();
  	ServletCalls call = new ServletCalls();
  	String 	[] arg= new String[9];
   	Xml xml= new Xml();
  	String result="";
  	String [] tags= new String[3];
	JSONObject msg = new JSONObject();
	String rest="";
 
   //XML Tags
   	
   	tags[0]="status"; 
   	tags[1]="reason";
   	tags[2]="response";

   	//Parameters   	
   	
  	arg[0]=request.getParameter("name");
  	arg[1]="7c4a8d09ca3762af61e59520943dc26494f8941b";
  	arg[2]=request.getParameter("businessCategory");
  	arg[3]="N/A";
  	arg[4]=request.getParameter("FBEmail");
	arg[5]="0";
	arg[6]=propertiesVar.getProperty("initCredits");
	arg[7]=request.getParameter("name");
	arg[8]="&facebook="+URLEncoder.encode(request.getParameter("FBEmail"));
	try{
 		result=call.callServlet(url.registerClientUrl(arg));
		tags = xml.getTagsContent(result,tags);
		((Logger)session.getAttribute("log")).info(tags[0]);
		if(tags[0].equals("0006")){
			((Logger)session.getAttribute("log")).info("Successfully created user ="+arg[4]);
	 		session.setAttribute("firstTime", "1");
  			msg.put("result","OK");
  	  		msg.put("value",propertiesLan.getProperty("OK"));  	  		  	  	
  	  		tags=new String [3];
			tags[0]="status"; 
			tags[1]="reason";
			tags[2]="response";
			result = call.callServlet(url.profileReviewGeneric("facebook", request.getParameter("FBEmail")));
			tags=xml.getTagsContent(result, tags);		
			if(tags[0].equals("0014")){
				tags=new String[3];
				tags[0]="id";
			 	tags[1]="email";
			 	tags[2]="client";
				tags=xml.getTagsContent2(result, tags);
				session.setAttribute("login",tags[1]);   
				session.setAttribute("token",tags[0]);
				rest=rest+"&fbUid="+request.getParameter("FBId");		
				result = call.callServlet(url.clientSocialInfoUpdate((String)session.getAttribute("token"), rest));
				result= call.callServlet(url.forgotPasswordUrl(tags[1],lan));				
			}
  	  		out.println(msg);
  		}else if(tags[0].equals("0008")){
  			((Logger)session.getAttribute("log")).error("User ="+arg[4]+" Cannot be created "+tags[0]+":"+tags[1]);
  			msg.put("result","alreadyExistSendRedirect");
  	  		msg.put("value",propertiesLan.getProperty("alreadyExistSendRedirect"));
  	  		out.println(msg);	
  		}else if(tags[0].equals("0045") || tags[0].equals("0046") || tags[0].equals("0049")){
  			((Logger)session.getAttribute("log")).error("User ="+arg[4]+" Cannot be created "+tags[0]+":"+tags[1]);
  			msg.put("result","alreadyExist");
  	  		msg.put("value",propertiesLan.getProperty("alreadyExist"));
  	  		out.println(msg);	
  		}else{
  			((Logger)session.getAttribute("log")).error("User ="+arg[4]+" Cannot be created "+tags[0]+":"+tags[1]);
  	  		msg.put("result","NO");
  	  		msg.put("value",propertiesLan.getProperty("FatalError"));
  	  		out.println(msg);
  		}
	} catch (Exception  e){
		((Logger)session.getAttribute("log")).error("Error "+e);
  		msg.put("result","NO");
  		msg.put("value",propertiesLan.getProperty("FatalError"));
  		out.println(msg);
  	}
  %>