<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	*  
	* Autor: Andrés Mariño
	*
	*/%>
  
<%@page import="java.util.*"  %>
<%@page import="java.io.*"  %>
<%@page import="java.lang.String"  %>
<%@page import="loyapptyWeb.*"  %>
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
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
	String groupId="";
	String groupName="";
	String idsAdd="";
	String idsRem="";
	String [] tags= new String[3];
	String [] tags2= new String[3];
	String [] temp=null;
	

	Xml xml= new Xml();
	 
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";

 	token=(String)session.getAttribute("token");
 	groupId=request.getParameter("groupId");
 	groupName=request.getParameter("groupName");
 	idsAdd=request.getParameter("idsAdd");
 	idsRem=request.getParameter("idsRem");
 	 	
 	try{ 
/* 		AddressBookBeanProxy aux= new AddressBookBeanProxy();
 		temp=idsRem.split(",");
 		idsRem= xml.idsContacts(temp);
		result = aux.removeContactsFromGroups(token, idsRem,(Long.parseLong(groupId)));
		tags2=xml.getTagsContent(result, tags);
		if(tags2[0].equals("0007")){
			msg.put("result","noToken");
			msg.put("value",properties.getProperty("invalidToken"));
			session.removeAttribute("token");
			out.println(msg);	
		}else if(tags2[0].equals("3005")){
			aux.editGroup(token, groupId, groupName);
			temp=idsAdd.split(",");		
			idsAdd= xml.idsContacts(temp);
			result = aux.addContactsToGroups(token, idsAdd,Long.parseLong(groupId));
			tags2=xml.getTagsContent(result, tags);
			if(tags2[0].equals("3003")){
				msg.put("result","OK");
				msg.put("value",properties.getProperty("OK"));
				out.println(msg);	
			}else{
				msg.put("result","NO");
				msg.put("value",properties.getProperty("FatalError"));
				System.out.println("error = "+tags2[0]+":"+tags2[1]);	
				out.println(msg);
			}
		}else{
			msg.put("result","NO");
			msg.put("value",properties.getProperty("FatalError"));
			System.out.println("error = "+tags2[0]+":"+tags2[1]);	
			out.println(msg);				
		}*/
	} catch (Exception e){
		System.out.println("error conexion"+e);
	}	
%>