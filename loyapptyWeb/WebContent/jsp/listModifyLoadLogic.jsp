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
 	String result2="";
	String token=""; 
	String groupId=""; 
	String [] tags= new String[3];
	String [] tags2= new String[3];

	Xml xml= new Xml();
	 
 	tags[0]="code";
 	tags[1]="description";
 	tags[2]="status";

 	tags2[0]="id";
 	tags2[1]="name";
 	tags2[2]="contact";
 	
 	token=(String)session.getAttribute("token");
 	groupId=request.getParameter("groupId");
 	 	
 	try{ 
/*		AddressBookBeanProxy aux= new AddressBookBeanProxy();
		result = aux.listContacts(token,"","","");
		result2 = aux.listContacts(token, "", groupId, "");
		tags=xml.getTagsContent(result, tags);

		if(tags[0].equals("0007")){
			msg.put("result","noToken");
			msg.put("value",properties.getProperty("invalidToken"));
			session.removeAttribute("token");
			out.println(msg);	

		}else{
			tags=xml.getTagsContent(result, tags2);
			result="";
			msg.put("result","OK");
		//Agrego a la lista 1
			for (int i=0;i<tags.length;i++){
				if(i!=(tags.length-1)){
					result=result+tags[i]+"|";
				}else{
					result=result+tags[i]+",";		
				}
			}
				tags2=xml.getTagsContent(result2, tags2);
			for (int i=0;i<tags2.length;i++){
		//Filtro elementos repetidos	
				result=result.replace(tags2[i], "");	
		//Agrgo a la lista 2
				if(i!=(tags2.length-1)){
					result=result+tags2[i]+"|";
				}else{
					result=result+tags2[i];		
				}
			}
			msg.put("list",result);
			out.print(msg);
		}*/
	} catch (Exception e){
		out.println("error conexion"+e);
	}	
%>