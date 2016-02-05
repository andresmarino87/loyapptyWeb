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
	String serviceXML="";
	String regEx="";
	String [][] res=null;
	String [] fSearch= null;
	String [] tags =new String[13];

	
	//Table parameters
	String sCol = request.getParameter("iSortCol_0");
	String sdir = request.getParameter("sSortDir_0");
	String search = request.getParameter("sSearch");
	
	String token=(String)session.getAttribute("token");

	//XML Tags	
 	tags[0]="id"; 
 	tags[1]="alias";
 	tags[2]="service_name";
 	tags[3]="subscribed_on";
 	tags[4]="device";
 	tags[5]="subscription_status";
 	tags[6]="email";
 	tags[7]="f_name";
 	tags[8]="l_name";
 	tags[9]="mobile";
 	tags[10]="subscribed_to";
 	tags[11]="users";
 	tags[12]="user";
	
	boolean centinela;	

	try{ 
		serviceXML=call.callServlet(url.subscriptorReviewUrl(token));
	//	System.out.println(url.subscriptorReviewUrl(token));
		res=xml.getTagsContentMatrix(serviceXML, tags);
		//sort
		Arrays.sort(res, new ArrayComparator(Integer.parseInt(sCol),sdir)); 
		fSearch=search.split(" ");			
		for(int i=0;i<res.length;i++){
			int j=0;
			centinela=true;
			if(res[i][5].equalsIgnoreCase("unsubscribed")){
				res[i][5]=(String)session.getAttribute("Unsubscribed");
			}else if(res[i][5].equalsIgnoreCase("active")){
				res[i][5]=(String)session.getAttribute("Active");
			}
			//Search
			while(centinela && j<fSearch.length){ 
				if(!( (res[i][9].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][8].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][7].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][6].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][1].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][2].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][3].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][4].toLowerCase()).contains(fSearch[j].toLowerCase()) || 
						(res[i][5].toLowerCase()).contains(fSearch[j].toLowerCase()))){
					centinela=false;
				}else{
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
				if(res[i][7].equals("null")){
					res[i][7]="";	
				}
				if(res[i][8].equals("null")){
					res[i][8]="";
				}
				array_aux.put(res[i][7]+" "+res[i][8]);
				if(res[i][6].equals("null")){
					res[i][6]="";
				}
				array_aux.put(res[i][6]);
				if(res[i][9].equals("null")){
					res[i][9]="";
				}
				array_aux.put(res[i][9]);
				if(res[i][10].equals("null")){
					res[i][10]="";
				}
				array_aux.put(res[i][10]);
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
