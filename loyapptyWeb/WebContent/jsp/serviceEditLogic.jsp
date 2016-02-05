<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>
 
<%@page import="java.util.*"  %>
<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
<%@page import="org.apache.log4j.*" %>
<%@page import="java.net.URLEncoder" %>

<%
 
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	JSONObject arg = new JSONObject();
	Sha1 sha1= new Sha1();
	String result="";
	String [] res=null;
	String [] tags= new String[3];
	Xml xml= new Xml();
	String rest="";
	
	//parameters
	arg.put("clientId",(String)session.getAttribute("token"));
	arg.put("serviceId",request.getParameter("serviceId"));
	arg.put("name",request.getParameter("name"));
	arg.put("type",request.getParameter("type"));
	arg.put("alias","");
	arg.put("publish",request.getParameter("publish"));
	arg.put("description",request.getParameter("description"));
	arg.put("logo","");
	arg.put("isPrivate", request.getParameter("isPrivate"));

	if(request.getParameter("isPrivate").equals("true")){
		String [] codes=request.getParameter("codes").split(",");
		String [] ms=request.getParameter("ms").split(",");
		if( request.getParameter("action") == null){
			for(int i=0;i<request.getParameter("codes").split(",").length;i++){
				rest=rest + "&k"+(i+1)+"="+codes[i]+"&m"+(i+1)+"="+ms[i];	
			}
		}
	}
	arg.put("codes",rest);

	if(true){
		arg.put("WebOptIn","&optInURL="+URLEncoder.encode(request.getParameter("url"))+"&webService=");
	}else{
		arg.put("WebOptIn","&webService="+URLEncoder.encode(request.getParameter("url")));
	}
	
	//Check if image was uploaped
	if(!(session.getAttribute("fileServiceTempName") == null)){
		arg.put("logo","&serviceLogo="+(String)session.getAttribute("fileServiceTempName"));		
	}
	
	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";
	
	try{ 
		result = call.callServlet(url.serviceEditUrl(arg));
		res = xml.getTagsContent(result, tags);
		if(res[0].equals("0019")){
			((Logger)session.getAttribute("log")).info("Service with name : "+arg.getString("name")+ " has been successfully modified");
			session.setAttribute("ServiceXml",call.callServlet(url.serviceLoadUrl(arg.getString("clientId"))));
			session.removeAttribute("fileServiceTempName");
			msg.put("result","OK");
			msg.put("value",(String)session.getAttribute("OK"));
			out.println(msg);
		}else if(res[0].equals("0017")){
			((Logger)session.getAttribute("log")).error("Service with name : "+arg.getString("name")+ " cannot be modified "+res[0]+":"+res[1]);
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("AlreadyExistService"));
			out.println(msg);
		}else if(res[0].equals("0050")){
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("PrivateKeyalreadyUsed"));
			out.println(msg);
		}else{
			((Logger)session.getAttribute("log")).error("Service with name : "+arg.getString("name")+ " cannot be modified "+res[0]+":"+res[1]);
			System.out.println("Error"+res[0]+":"+res[1]);
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
	}	
%>