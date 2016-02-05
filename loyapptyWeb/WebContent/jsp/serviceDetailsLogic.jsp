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
<%@page import="org.codehaus.jettison.json.JSONArray"  %>
<%@page import="java.net.URLEncoder"  %> 
<%@page import="org.apache.log4j.*" %>
<%
	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	JSONObject auxCodes = null;
	JSONArray array = new JSONArray();

	String id = request.getParameter("serviceId");
	String result="";
	String resultCodes="";
	String [][] aux=null;
	String [][] res=null;
	String [][] resCodes=null;
	String [] tags =new String[13];
	String [] tagsCodes=new String[4];
	String token=(String)session.getAttribute("token");
	Xml xml= new Xml();

	//XML Tags
 	tags[0]="id";
 	tags[1]="name";
 	tags[2]="description";
 	tags[3]="type";
 	tags[4]="logo";
 	tags[5]="webService";
 	tags[6]="service_status";
 	tags[7]="createdOn";
 	tags[8]="alias";
 	tags[9]="optInURL";
 	tags[10]="isPrivate";
 	tags[11]="services";
 	tags[12]="service";

	tagsCodes[0]="pass_key";
	tagsCodes[1]="max_usages";
	tagsCodes[2]="keys";
	tagsCodes[3]="key";

	InputStream stream = null;
	stream = application.getResourceAsStream("config/var.properties");
	Properties properties = new Properties();
	properties.load(stream);

	try{ 
		result=(String)session.getAttribute("ServiceXml");
		res=xml.getTagsContentMatrix(result, tags);
		boolean cen=true;
		int i=0;
		while(cen){
			if(res[i][0].equals(id)){
				msg.put("id",res[i][0]);
				msg.put("name",res[i][1]);
				msg.put("description",res[i][2]);
				if(res[i][3].equals("1")){
					msg.put("type0",(String)session.getAttribute("OnDemandMSG"));
					msg.put("typeVal0","1");
					msg.put("type1",(String)session.getAttribute("SubscriptionMSG"));
					msg.put("typeVal1","2");
					msg.put("labelWebUrl",(String)session.getAttribute("Webservice"));
				}else if(res[i][3].equals("2")){
					msg.put("type1",(String)session.getAttribute("OnDemandMSG"));
					msg.put("typeVal1","1");
					msg.put("type0",(String)session.getAttribute("SubscriptionMSG"));
					msg.put("typeVal0","2");
					msg.put("labelWebUrl",(String)session.getAttribute("urlto"));
				}
				msg.put("logo",res[i][4]);
				msg.put("baseImg",properties.getProperty("fileBaseLoad"));
				msg.put("webService",res[i][5]);
				msg.put("status",res[i][6]);	

				if(res[i][6].equals("1")){
					msg.put("status0",(String)session.getAttribute("PublishedMSG"));
					msg.put("statusVal0","1");
					msg.put("status1",(String)session.getAttribute("CanceledMSG"));
					msg.put("statusVal1","2");
					msg.put("status2",(String)session.getAttribute("FinishedMSG"));
					msg.put("statusVal2","0");
				}else if(res[i][6].equals("2")){
					msg.put("status1",(String)session.getAttribute("PublishedMSG"));
					msg.put("statusVal1","1");
					msg.put("status0",(String)session.getAttribute("CanceledMSG"));
					msg.put("statusVal0","2");
					msg.put("status2",(String)session.getAttribute("FinishedMSG"));
					msg.put("statusVal2","0");
				}else if(res[i][6].equals("3") || res[i][6].equals("0")){
					msg.put("status2",(String)session.getAttribute("PublishedMSG"));
					msg.put("statusVal2","1");
					msg.put("status1",(String)session.getAttribute("CanceledMSG"));
					msg.put("statusVal1","2");
					msg.put("status0",(String)session.getAttribute("FinishedMSG"));
					msg.put("statusVal0","0");
				}else{
					msg.put("status2",(String)session.getAttribute("PublishedMSG"));
					msg.put("statusVal2","1");
					msg.put("status1",(String)session.getAttribute("CanceledMSG"));
					msg.put("statusVal1","2");
					msg.put("status0",(String)session.getAttribute("FinishedMSG"));
					msg.put("statusVal0","0");
				}
				msg.put("createdOn",res[i][7]);
				msg.put("alias",res[i][8]);
				msg.put("optInUrl",res[i][9]);
				msg.put("isPrivate",res[i][10]);
				if(res[i][10].equals("true")){
					resultCodes = call.callServlet(url.serviceCodesRevirew(id));
					resCodes = xml.getTagsContentMatrix(resultCodes, tagsCodes);
					for(int j=0;j<resCodes.length;j++){
						auxCodes = new JSONObject();
						auxCodes.put("code", resCodes[j][0]);
						auxCodes.put("ms", resCodes[j][1]);
						array.put(auxCodes);
					}
					msg.put("codes",array);
					msg.put("codesLength",resCodes.length);
				}
				msg.put("qr",URLEncoder.encode(properties.getProperty("QRroot")+token+"&serviceId="+res[i][0]));
				cen=false;
			}
			i++;
		}
		out.println(msg);
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
		out.println("error conexion = "+e);
	}	
%>
