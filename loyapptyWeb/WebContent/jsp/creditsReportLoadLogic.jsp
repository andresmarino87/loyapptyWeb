<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<%@page import="java.text.*"  %>


<%
	//Set Format
	NumberFormat nf= null;
	if(((String)session.getAttribute("language")).equals("1")){  
		nf = NumberFormat.getInstance(Locale.US);
	}else{
		nf = NumberFormat.getInstance(new Locale( "es" , "ES"));
	}

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
	String [] tags =new String[8];
	String sign="+";
	
	//Table parameters
	String sCol = request.getParameter("iSortCol_0");
	String sdir = request.getParameter("sSortDir_0");
	String search = request.getParameter("sSearch");
	
	String token=(String)session.getAttribute("token");

	//XML Tags	
 	tags[0]="client_id"; 
 	tags[1]="text";
 	tags[2]="service_name";
	tags[3]="when";
 	tags[4]="explain";
 	tags[5]="amount";
 	tags[6]="transactions";
 	tags[7]="transaction";

	boolean centinela;	

	try{
		serviceXML=call.callServlet(url.creditsReportUrl(token));
		res=xml.getTagsContentMatrix(serviceXML, tags);
		Arrays.sort(res, new ArrayComparator(Integer.parseInt(sCol),sdir)); 
		fSearch=search.split(" ");			
		for(int i=0;i<res.length;i++){
			int j=0;
			centinela=true;
			if(res[i][4].equalsIgnoreCase("PURCHASE")){
				res[i][4]=(String)session.getAttribute("Purchase");	
			}else if(res[i][4].equalsIgnoreCase("INITIAL")){
				res[i][4]=(String)session.getAttribute("Initial");					
			}else if(res[i][4].startsWith("DELIVERED")){
				res[i][4]=(String)session.getAttribute("Delivered")+"("+(String)session.getAttribute("Schedule")+" "+ res[i][4].replace("DELIVERED (Schedule ", "");
				sign="-";
			}
			if(res[i][3].equalsIgnoreCase("Multiples Dates")){
				res[i][3]=(String)session.getAttribute("MultipleDates");
				sign="-";
			}
			while(centinela && j<fSearch.length){
				if(!((res[i][1].toLowerCase()).contains(fSearch[j].toLowerCase()) 
						|| (res[i][2].toLowerCase()).contains(fSearch[j].toLowerCase()) 
						|| (res[i][5].toLowerCase()).contains(fSearch[j].toLowerCase()) 
						|| (res[i][3].toLowerCase()).contains(fSearch[j].toLowerCase()) 
						|| (res[i][4].toLowerCase()).contains(fSearch[j].toLowerCase()))){
					centinela=false;
				}else{
				} 
				j++;
			}
			if(centinela){
				array_aux = new JSONArray();
				array_aux.put(res[i][0]);			
				if(res[i][1].length()>21){
					array_aux.put(res[i][1].substring(0,21)+"...");
				}else{
					if(res[i][1].equals("null")){
						array_aux.put("");
					}else{
						array_aux.put(res[i][1]);
					}					
				}
				if(res[i][2].equals("null")){
					array_aux.put("");
				}else{
					array_aux.put(res[i][2]);
				}
				array_aux.put(res[i][3]);

				
				array_aux.put(res[i][4]);
				array_aux.put(sign+nf.format(Integer.parseInt(res[i][5])));
				if(res[i][1].equals("null")){
					array_aux.put("");
				}else{
					array_aux.put(res[i][1]);
				}
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
    