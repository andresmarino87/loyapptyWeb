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
 
<% 
	//Load Language
	String language = (String)session.getAttribute("language");
	InputStream stream = null; 
	if((language!=null)){
		if(language.equals("1")){  
			stream = application.getResourceAsStream("config/englishConf.properties");
		}else{
			stream = application.getResourceAsStream("config/spanishConf.properties");
		}
	}else{
		stream = application.getResourceAsStream("config/spanishConf.properties");
	}
	Properties properties = new Properties();
	properties.load(stream);
 
	//codigo
	JSONObject msg = new JSONObject();

	String result="";
	String token=""; 
	String name=""; 
	String [] tags= new String[3];
	Xml xml= new Xml();
	
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";

 	token=(String)session.getAttribute("token");
 	name=request.getParameter("name");
 	 	/*
 	try{ 
		AddressBookBeanProxy aux= new AddressBookBeanProxy();
		result = aux.createGroup(token, name);
		tags=xml.getTagsContent(result, tags);

		if(tags[0].equals("3008")){
			msg.put("result","OK");
			msg.put("value",properties.getProperty("OK"));
			out.println(msg);	
		}else if(tags[0].equals("0007")){
			msg.put("result","noToken");
			msg.put("value",properties.getProperty("invalidToken"));
			session.removeAttribute("token");
			out.println(msg);	
		}else{
			msg.put("result","NO");
			msg.put("value",properties.getProperty("FatalError"));
			System.out.println("error = "+tags[1]);	
			out.println(msg);				
		}	*/
	/*} catch (Exception e){
		out.println("error conexion"+e);
	}	*/
%>