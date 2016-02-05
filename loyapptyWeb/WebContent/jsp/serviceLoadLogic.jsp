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
 <%
 	//Init
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();
	JSONArray array = new JSONArray();
	JSONArray array_aux = null;
	Xml xml= new Xml();
	int display=0;
	int start=0;
	int amount=0; 
	String result="";
	String regEx="";
	String [][] res=null;
	String [] fSearch= null;
	String [] tags =new String[9];
	String [] codes= new String[2];

	
	//Table parameters
	String sCol = request.getParameter("iSortCol_0");
	String sdir = request.getParameter("sSortDir_0");
	String search = request.getParameter("sSearch");

	String token=(String)session.getAttribute("token");
	
	//check if Service is load
	if(session.getAttribute("ServiceXml") == null){
 		session.setAttribute("ServiceXml",call.callServlet(url.serviceLoadUrl(token)));
 	}
//	System.out.println(url.serviceLoadUrl(token));
	//XML Tags
 	tags[0]="id"; 
 	tags[1]="name";
 	tags[2]="alias";
 	tags[3]="type";
 	tags[4]="service_status";
 	tags[5]="isPrivate";
 	tags[6]="description";
 	tags[7]="services";
 	tags[8]="service";
 	
 	codes[0]="code";
	codes[1]="status";

	boolean centinela=true;

	try{ 
		result=(String)session.getAttribute("ServiceXml");
		res=xml.getTagsContentMatrix(result, tags);
		//Sort
		Arrays.sort(res, new ArrayComparator(Integer.parseInt(sCol),sdir)); 
		fSearch=search.split(" ");			
		for(int i=0;i<res.length;i++){
			int j=0;
			centinela=true;
			
			if(res[i][3].equals("1")){
				res[i][3]=(String)session.getAttribute("OnDemandMSG");
			}else if(res[i][3].equals("2")){
				res[i][3]=(String)session.getAttribute("SubscriptionMSG");
			}
			if(res[i][4].equals("1")){
				res[i][4]=(String)session.getAttribute("PublishedMSG");
			}else if(res[i][4].equals("2")){
				res[i][4]=(String)session.getAttribute("CanceledMSG");
			}else if(res[i][4].equals("3")){
				res[i][4]=(String)session.getAttribute("FinishedMSG");
			}else if(res[i][4].equals("0")){
				res[i][4]=(String)session.getAttribute("FinishedMSG");
			}
			
			if(res[i][5].equals("false")){
				res[i][5]=(String)session.getAttribute("Public");	
			}else if(res[i][5].equals("true")){
				res[i][5]=(String)session.getAttribute("Private");
			}
		
			//Search
			while(centinela && j<fSearch.length){
				if(!((res[i][1].toLowerCase()).contains(fSearch[j].toLowerCase()) 
						|| (res[i][6].toLowerCase()).contains(fSearch[j].toLowerCase()))){
					centinela=false;
				}
				j++;
			}
			if(centinela){
				array_aux = new JSONArray();
				array_aux.put(res[i][0]);
				array_aux.put(res[i][1]);
				array_aux.put(res[i][2]);
				array_aux.put(res[i][3]);
				array_aux.put(res[i][4]);
				array_aux.put(res[i][5]);
				array_aux.put(res[i][6]);
				array_aux.put("");
				array.put(array_aux);
				display++;
			}				
		}
		msg.put("iTotalRecords", res.length);
		msg.put("iTotalDisplayRecords", display);
		msg.put("aaData", array);
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "no-store");
		out.println(msg);
	} catch (Exception e){
		((Logger)session.getAttribute("log")).error("Error "+e);
		out.println("error conexion = "+e);
	}	 
%>