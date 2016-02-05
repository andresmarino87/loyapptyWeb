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

 <%
 	//Ignore
 	//Lenguaje
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
	
	//Init
	JSONObject msg = new JSONObject();
	String result="";
	String token=(String)session.getAttribute("token");
	String [] tags =  new String[3];
	String [] res =  null;
	String [] ids =  null;
	int cen=0;
	
 	Xml xml= new Xml();

 	ids = request.getParameter("sData").replace("&", "").split("listId=");	
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";
/* 	try{ 
		AddressBookBeanProxy aux= new AddressBookBeanProxy();
		for(int i=0;i<ids.length;i++){
			if(!(ids[i].equals(""))){
				result=aux.deleteGroup(token,ids[i]);
				res =xml.getTagsContent(result, tags);
				if(res[0].equals("0007")){
					cen=2;
					break;
				}else if(!(res[0].equals("3017"))){
					cen = 1;
					break;
				}
			}
		}
		switch (cen){
		case 0:
			msg.put("result","OK");
			msg.put("value",properties.getProperty("OK"));
			out.println(msg);		
			break;
		case 1:
			msg.put("result","NO");
			msg.put("value",properties.getProperty("FatalError"));
			System.out.println("error = "+tags[1]);	
			out.println(msg);
			break;
		case 2:
			msg.put("result","noToken");
			msg.put("value",properties.getProperty("invalidToken"));
			session.removeAttribute("token");
			out.println(msg);	
			break;
		}
	} catch (Exception e){
		out.println("error ="+e);
	}	*/
%>