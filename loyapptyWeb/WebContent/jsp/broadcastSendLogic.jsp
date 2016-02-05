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
<%@page import="org.apache.log4j.*"%>

<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	Xml xml = new Xml();
	String result = "";
	String rest = "";
	String [] tags = new String[5];
	
	//Parameters		
	String clientId = (String)session.getAttribute("token");
	String isUrl = request.getParameter("isUrl");
	String text = request.getParameter("text");
	String service = request.getParameter("service");
	String user = request.getParameter("user");
	String subject = request.getParameter("subject");
	String when = request.getParameter("when");
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String days = request.getParameter("restrictedDays");
	String postTwitter = request.getParameter("postTwitter");
	String postFacebook = request.getParameter("postFacebook");
	String sendEmails = request.getParameter("sendEmails");

	//XMl Tags
	tags[0] = "status";
	tags[1] = "reason";
	tags[2] = "schedule";
	tags[3] = "scheduled_to";
	tags[4] = "response";

	if(user!=null){
		rest=rest+"&userId="+URLEncoder.encode(user);
	}
	
	if(service!=null){
		rest=rest+"&serviceId="+URLEncoder.encode(service);
	}		
			
	rest=rest+"&subject="+URLEncoder.encode((String)session.getAttribute("bussinesName")+" "+(String)session.getAttribute("Setmsg"));
	
	if(isUrl.equals("1")){
		rest = rest + "&url=" +URLEncoder.encode(text);		
	}
	
	if(!(when.equals(""))){
		when= when.replaceAll("/", "").replaceAll(" ", "").replaceAll(":", "")+"00";
		rest = rest + "&sendDate=" + when;	
	}
	
	if(!(from.equals(""))){
		from=from.replaceAll(":","").replaceAll(" ", "");
		rest = rest + "&avoidFrom=" + from;			
	}
	
	if(!(to.equals(""))){
		to=to.replaceAll(":","").replaceAll(" ", "");		
		rest = rest + "&avoidTo=" + to;	
	}

	if(!(days.equals(""))){
		rest = rest + "&avoidDays=" + days;	
	}
	
	if(postTwitter.equals("1")){
		rest = rest + "&postTwitter=true";		
	}
	if(postFacebook.equals("1")){
		rest = rest + "&postFacebook=true";		
	}	
	if(sendEmails.equals("1")){
		rest = rest + "&sendEmails=true";	
	}
	
	if(request.getParameter("userId") != null){
		rest = rest + "&userId="+request.getParameter("userId");
	}
	
	
	try{ 
		result= call.callServlet(url.sendBroadcastUrl(clientId, text, rest));
		tags = xml.getTagsContent(result, tags);
		
		if(tags[0].equals("0014")){
			((Logger)session.getAttribute("log")).info("User "+(String)session.getAttribute("login") +" has sent a broadcast");
			msg.put("result","OK");
			msg.put("value",(String)session.getAttribute("OK"));
			out.println(msg);
		}else if(tags[0].equals("0042")){
			((Logger)session.getAttribute("log")).error("User "+(String)session.getAttribute("login")+" cannot sent a broadcast "+tags[0]+":"+tags[1]);
			msg.put("result","noCredits");
			msg.put("value",(String)session.getAttribute("NoCredits"));
			out.println(msg);
		}else{
			((Logger)session.getAttribute("log")).error("User "+(String)session.getAttribute("login")+" cannot sent a broadcast "+tags[0]+":"+tags[1]);
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		}
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
		out.println("error conexion = "+e);
	}	
%> 