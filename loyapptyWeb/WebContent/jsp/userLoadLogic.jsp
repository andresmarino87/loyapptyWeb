<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% /*
	* 
	* Autor: Andr�s Mari�o
	*
	*/%>
 
<%@page import="java.util.*"  %>
<%@page import="loyapptyWeb.*"  %> 
<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
 
 <%
	JSONObject result = new JSONObject();
	JSONArray array = new JSONArray();
	JSONArray array_aux = null;
	int display=0;
	int start=0;
	int amount=0;
	
	String sCol = request.getParameter("iSortCol_0");
	String sdir = request.getParameter("sSortDir_0");

	String search = request.getParameter("sSearch");

	String resultXml = "";
	String [][] res = null;
	String [] tags = new String[3];
	String [] codes = new String[2];

	String token=(String)session.getAttribute("token");

	Xml xml= new Xml();

 	tags[0]="id";
 	tags[1]="login";
 	tags[2]="client";
 	
 	codes[0]="code";
	codes[1]="status";

	try{ 
/*		UserBeanProxy aux= new UserBeanProxy();
		resultXml = aux.listSubAccounts(token);
		codes = xml.getTagsContent(resultXml, codes);
		if(codes[0].equals("0007")){
			out.println("noToken");
		}else{
			res = xml.getTagsUser(resultXml,tags);
			Arrays.sort(res, new ArrayComparator(Integer.parseInt(sCol),sdir)); 
			for(int i = 0;i<res.length;i++){
				if(res[i][1].contains(search) || res[i][2].contains(search)){
					array_aux = new JSONArray();
					array_aux.put(res[i][0]);
					array_aux.put(res[i][1]);
					array_aux.put(res[i][2]);
					array.put(array_aux);
					display++;
				}
			}
			result.put("iTotalRecords", (res.length));
			result.put("iTotalDisplayRecords",display);
			result.put("aaData", array); 
			response.setContentType("application/json");
			response.setHeader("Cache-Control", "no-store");
			out.println(result);
		}*/
	} catch (Exception e){
		System.out.println("error conexion"+e);
		out.println("error conexion = "+e);
	}	
%>