<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andrés Mariño
	*
	*/%>

<%@page import="loyapptyWeb.*"  %>
<%@page import="com.ogangi.orbit.ws.*"  %>  
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
<%@page import="org.apache.log4j.*"%>
 
<%
	//Init Orbit
	OrbitWSProxy validator=new OrbitWSProxy();
	String result="";
	String cardId=request.getParameter("cardId");
	String pin=request.getParameter("pin");
	String user=(String)session.getAttribute("login");
	String id=(String)session.getAttribute("token");
	String type="WEB PURCHASE";
	String amount="";
	String expiration="";		
	
	//Init
	JSONObject msg = new JSONObject();
	Xml xml= new Xml();
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	String [] tags= new String[3];

	//XML Tags
	tags[0]="status"; 
	tags[1]="reason";
	tags[2]="response";

	try{
		result=validator.validatePinCard(cardId, pin, "Loyappty", user);
		if(result.startsWith("E-")){
			if(result.equals("E-00000")){
				msg.put("result","invalidParameters");
				msg.put("value",(String)session.getAttribute("PrepaidCardInvalidParameters"));
				((Logger)session.getAttribute("log")).error("Error E-00000 : Invalid Parameters");
			}else if(result.equals("E-00008")){
				msg.put("result","Fatal");
				msg.put("value",(String)session.getAttribute("FatalError"));
				((Logger)session.getAttribute("log")).error("Error E-00008 : Technical difficulties, try again");
			}else if(result.equals("E-00034")){
				msg.put("result","CantValidate");
				msg.put("value",(String)session.getAttribute("PrepaidPinCannotValidate"));
				((Logger)session.getAttribute("log")).error("Error E-00034 : Pin Card can't be validated");
			}else{
				msg.put("result","Fatal");
				msg.put("value",(String)session.getAttribute("FatalError"));
				((Logger)session.getAttribute("log")).error("Error Orbit "+result);
			}
		}else{
			amount=result;
			try{ 
				result = call.callServlet(url.addCreditsUrl(id, result, type, expiration));
				tags = xml.getTagsContent(result, tags);
				if(tags[0].equals("0014")){
					msg.put("result","OK");
					msg.put("value",(String)session.getAttribute("PinCodeSuccessfulValidate"));
					((Logger)session.getAttribute("log")).info("User "+user+" has been added "+amount+" credits");					
				}else{
					msg.put("result","Fatal");
					msg.put("value",(String)session.getAttribute("FatalError"));
					((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
				} 
			} catch (Exception e){
				msg.put("result","Fatal");
				msg.put("value",(String)session.getAttribute("FatalError"));
				((Logger)session.getAttribute("log")).error("Error "+e);
			}
		}
		out.println(msg);
	}catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
	}
%>