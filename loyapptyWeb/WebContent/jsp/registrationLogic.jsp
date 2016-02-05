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


<%
	//Load Language
	String language = request.getParameter("actualLanguage");
//	String language = (String)session.getAttribute("language");
	InputStream stream = null;
	if((language == null)){
		stream = application.getResourceAsStream("config/englishConf.properties");	
	}else if(language.equals("1")){
		stream = application.getResourceAsStream("config/englishConf.properties");
	}else if(language.equals("0")){
		stream = application.getResourceAsStream("config/spanishConf.properties");	
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
  	JSONObject msg = new JSONObject();
   	Xml xml= new Xml();
  	String result="";
  	String [] tags= new String[3];
 
   //XML Tags
   	
   	tags[0]="status"; 
   	tags[1]="reason";
   	tags[2]="response";

   	//Parameters
  	arg[0]=request.getParameter("name");
  	arg[1]=sha1.sha1(request.getParameter("pwd"));
  	arg[2]=request.getParameter("businessCategory");
  	arg[3]="N/A";
  	arg[4]=request.getParameter("email");
	arg[5]="0";
	arg[6]=propertiesVar.getProperty("initCredits");
	arg[7]=request.getParameter("name");
	arg[8]="";
	
  	try{  		
 		result=call.callServlet(url.registerClientUrl(arg));
		tags = xml.getTagsContent(result,tags);
		if(tags[0].equals("0006")){
			((Logger)session.getAttribute("log")).info("Successfully created user ="+arg[4]);
	 		session.setAttribute("firstTime", "1");
  			msg.put("result","OK");
  	  		msg.put("value",propertiesLan.getProperty("OK"));
  	  		out.println(msg);
  		}else if(tags[0].equals("0008")){
  			((Logger)session.getAttribute("log")).error("User ="+arg[4]+" Cannot be created "+tags[0]+":"+tags[1]);
  			msg.put("result","alreadyExist");
  	  		msg.put("value",propertiesLan.getProperty("alreadyExist"));
  	  		out.println(msg);
  		}else if(tags[0].equals("0045") || tags[0].equals("0046")){
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