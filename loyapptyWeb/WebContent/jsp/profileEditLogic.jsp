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
<%@page import="org.apache.log4j.*"%>
<%@page import="java.net.URLEncoder" %>
<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();
	JSONObject arg = new JSONObject();
	JSONObject msg = new JSONObject();
	Sha1 sha1= new Sha1();
	String result="";
	String keys="";
	String [] res=null;
	String [] resUpdateGeo=null;
	String [] tags= new String[3];
	String logoName="";
	Xml xml= new Xml();
	File uploadFile=null;
	File uploadRename=null;
	String rest="";	
	int typeSocialDelete=0;
	
	//Parameters
	arg.put("id",(String)session.getAttribute("token"));
	arg.put("email",request.getParameter("email"));
	arg.put("name",request.getParameter("name"));
	arg.put("address",request.getParameter("address")); 
	arg.put("description",request.getParameter("description"));
	arg.put("zip",request.getParameter("zip"));
	arg.put("mainContact",request.getParameter("mainContact"));
	arg.put("category",request.getParameter("category"));
	arg.put("otherContact",request.getParameter("otherContact"));
	arg.put("cityId",request.getParameter("cityId"));
	arg.put("locationRelevant",request.getParameter("locationRelevant"));
	arg.put("website",request.getParameter("website"));
	arg.put("promotionalCode",request.getParameter("promotionalCode"));
	keys="&keys="+URLEncoder.encode(request.getParameter("keys"));
	arg.put("keys",keys);

	String latitude=request.getParameter("latitude");
	String longitude=request.getParameter("longitude");

	arg.put("enterpriseLogo","");

	if(!(session.getAttribute("fileProfileName") == null)){
		arg.put("enterpriseLogo","&enterpriseLogo="+URLEncoder.encode((String)session.getAttribute("fileProfileName")));		
	}

	arg.put("facebook","&facebook="+URLEncoder.encode(request.getParameter("facebook")));
	arg.put("twitter","&twitter="+URLEncoder.encode(request.getParameter("twitter")));

	//Facebook or Twitter Change, and set to null
	if(request.getParameter("changeFB").equals("1")){
		typeSocialDelete=1;
	}	
	if(request.getParameter("changeTW").equals("1")){
		typeSocialDelete=2;	
	}
	if(request.getParameter("changeFB").equals("1") && request.getParameter("changeTW").equals("1")){
		typeSocialDelete=3;	
	}
	
	switch (typeSocialDelete){
		case 1:
			rest="&twTokenId="+request.getParameter("tw_token_id")+"&twTokenSecret="+request.getParameter("tw_token_secret")+"&nullClean=true";
			call.callServlet(url.clientSocialInfoUpdate((String)session.getAttribute("token"), rest));
			break;
		case 2:
			rest="&fbUid="+request.getParameter("fb_uid")+"&fbAccessToken="+request.getParameter("fb_access_token")+"&nullClean=true";
			call.callServlet(url.clientSocialInfoUpdate((String)session.getAttribute("token"), rest));
			break;
		case 3:
			rest="&nullClean=true";
			call.callServlet(url.clientSocialInfoUpdate((String)session.getAttribute("token"), rest));
			break;
		default:	
			break;
	} 
	
		
	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";

	try{
		result = call.callServlet(url.profileEditAllUrl(arg));
		res = xml.getTagsContent(result, tags);
		resUpdateGeo=xml.getTagsContent(call.callServlet(url.updateGeoInformation((String)session.getAttribute("token"), latitude, longitude)), tags);

		if(res[0].equals("0010")/* & resUpdateGeo[0].equals("0010")*/){
			session.setAttribute("login",request.getParameter("email"));
			((Logger)session.getAttribute("log")).info("User "+(String)session.getAttribute("login")+" has modified profile");
			session.setAttribute("ProfileXml",call.callServlet(url.profileReviewUrl((String)session.getAttribute("token"))));
			session.removeAttribute("fileProfileName");	
			msg.put("result","OK");
			msg.put("value",(String)session.getAttribute("OK"));
			out.println(msg);
		}else if(res[0].equals("0046")){
		}else{
			((Logger)session.getAttribute("log")).error("User "+(String)session.getAttribute("login")+" cannot modified profile "+res[0]+":"+res[1]);
			msg.put("result","NO");
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		} 
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
	}	
%> 