<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	*
	* Autor: Andrés Mariño
	* 
	*/%>
<%@page import="java.util.*"  %>
<%@page import="java.text.*"  %>
<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
<%@page import="org.apache.log4j.*" %>
<%
	//Init
	NumberFormat nf= null;
	if(((String)session.getAttribute("language")).equals("1")){  
		nf = NumberFormat.getInstance(Locale.US);
	}else{
		nf = NumberFormat.getInstance(new Locale( "es" , "ES"));
	}
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

	
	SimpleDateFormat dateIni = new SimpleDateFormat("MMddyyyyHHmmss");
    SimpleDateFormat dateEnd = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

    //Table Parameters    
    String sCol = request.getParameter("iSortCol_0");
	String sdir = request.getParameter("sSortDir_0");
	String search = request.getParameter("sSearch");

	//Default sort Column
	if(sCol.equals("0")){
		sCol="2";
	}

	String token=(String)session.getAttribute("token");
	
	//XML Tags
	tags[0]="id"; 
 	tags[1]="text";
 	tags[2]="start_date";
 	tags[3]="expected_messages";
 	tags[4]="msgs_delivered";
 	tags[5]="status";
 	tags[6]="service_name";
 	tags[7]="schedules";
 	tags[8]="schedule";
 	boolean centinela;	

	try{ 
		result=call.callServlet(url.schedulesListUrl(token));
		res=xml.getTagsContentMatrix(result,tags);
		Arrays.sort(res, new ArrayComparator(Integer.parseInt(sCol),sdir)); 
		fSearch=search.split(" ");			
		for(int i=0;i<res.length;i++){
			int j=0;
			centinela=true;
			if(res[i][5].equals("0")){
				res[i][5]=(String)session.getAttribute("Pending");					
			}else if(res[i][5].equals("1")){
				res[i][5]=(String)session.getAttribute("Completed");					
			}else if(res[i][5].equals("2")){
				res[i][5]=(String)session.getAttribute("Processing");									
			}else if(res[i][5].equals("3")){
				res[i][5]=(String)session.getAttribute("Slepping");										
			}
			res[i][2]=dateEnd.format((dateIni.parse(res[i][2])));
			while(centinela && j<fSearch.length){
				if(!( (res[i][1].toLowerCase()).contains(fSearch[j].toLowerCase()) || (res[i][2].toLowerCase()).contains(fSearch[j].toLowerCase()) || (res[i][3].toLowerCase()).contains(fSearch[j].toLowerCase()) || (res[i][4].toLowerCase()).contains(fSearch[j].toLowerCase()) || (res[i][5].toLowerCase()).contains(fSearch[j].toLowerCase()) || (res[i][6].toLowerCase()).contains(fSearch[j].toLowerCase()))){
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
					array_aux.put(res[i][1]);
				}				
				array_aux.put(res[i][2]);
				array_aux.put(nf.format(Integer.parseInt(res[i][3])));
				array_aux.put(nf.format(Integer.parseInt(res[i][4])));
				array_aux.put(res[i][5]);				
				array_aux.put(res[i][6]);
				array_aux.put(res[i][1]);
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
