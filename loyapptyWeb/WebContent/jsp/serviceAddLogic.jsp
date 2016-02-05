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
<%@page import="java.net.URLEncoder" %>
<%@page import="org.apache.log4j.*" %>
<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	JSONObject arg = new JSONObject();
	Sha1 sha1= new Sha1();
	String result="";
	String rest = "";
	String [] res=null;
	String [] tags= new String[3];
	Xml xml= new Xml();
	
	//Parameters	
	arg.put("id", (String)session.getAttribute("token"));
	arg.put("name", request.getParameter("name"));
	arg.put("type", "2");
	arg.put("alias", "");
	arg.put("publish", request.getParameter("publish"));
	arg.put("description", request.getParameter("description"));
	arg.put("isPrivate", request.getParameter("isPrivate"));

	//recive privates codes
	if(request.getParameter("isPrivate").equals("true")){
		String [] codes=request.getParameter("codes").split(",");
		String [] ms=request.getParameter("ms").split(",");
		for(int i=0;i<request.getParameter("codes").split(",").length;i++){
			rest=rest + "&k"+(i+1)+"="+codes[i]+"&m"+(i+1)+"="+ms[i];	
		}
	}
	arg.put("codes",rest);
	
	if(true){
		arg.put("WebOptIn","&optInURL="+URLEncoder.encode(request.getParameter("url"))+"&webService=");
	}else{
		arg.put("WebOptIn","&webService="+URLEncoder.encode(request.getParameter("url")));
	}

	String webService=request.getParameter("webService");
	arg.put("logo","");
	
	//Check if Image was Uploaded
	if(!(session.getAttribute("fileServiceTempName") == null)){
		arg.put("logo", "&serviceLogo="+URLEncoder.encode((String)session.getAttribute("fileServiceTempName")));		
	}
	
	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";

	try{
		result = call.callServlet(url.serviceAddUrl(arg));
		res = xml.getTagsContent(result, tags);
		if(res[0].equals("0014")){
			//New Tags
			tags=new String [2];
			tags[0]="id";
			tags[1]="response";
			res = xml.getTagsContent(result, tags);
			session.setAttribute("ServiceXml",call.callServlet(url.serviceLoadUrl(arg.getString("id"))));
			session.removeAttribute("fileServiceTempName");
			((Logger)session.getAttribute("log")).info("Successfully created service with name : "+arg.getString("name"));
			msg.put("result","OK");
			msg.put("value",(String)session.getAttribute("OK"));
			msg.put("id",res[0]);
			out.println(msg);
		}else if(res[0].equals("0017")){
			((Logger)session.getAttribute("log")).error("Already Exists service with name : "+arg.getString("name"));
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("AlreadyExistService"));
			out.println(msg);
		}else if(res[0].equals("0050")){
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("PrivateKeyalreadyUsed"));
			out.println(msg);
		}else{
			session.removeAttribute("fileServiceTempName");
			((Logger)session.getAttribute("log")).error("Error creating service "+res[0]+":"+res[1]);
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
	}	
%>