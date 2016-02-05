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
<%@page import="org.apache.log4j.*"  %>
<%@page import="java.net.URLEncoder"  %> 
<%@page import="java.net.*"  %> 

 <% 
	//Init
	URL shortUrl = null;
	URLConnection yc = null;
	BufferedReader in = null;
	String shotenedUrl;
	String result="";
	String token=(String)session.getAttribute("token");
	String [] tags =  new String[3];
	String [] tags2 =  new String[20];
	String [] res = null;
	String [][] res2 = null;
	String keys="";
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();		
	JSONObject msg = new JSONObject();

	Xml xml= new Xml();

	//load properties file
	
	InputStream stream = null;
	stream = application.getResourceAsStream("config/var.properties");
	Properties properties = new Properties();
	properties.load(stream);
	
	//XML Tags
 	tags[0]="status";
 	tags[1]="reason";
 	tags[2]="response";

 	tags2[0]="name";
 	tags2[1]="description"; 
 	tags2[2]="address";
 	tags2[3]="zipcode";
 	tags2[4]="city_id";
 	tags2[5]="country";
 	tags2[6]="categoryId";
 	tags2[7]="main_contact";
 	tags2[8]="website";
 	tags2[9]="other_contact";
 	tags2[10]="email";
 	tags2[11]="location_relevant";
 	tags2[12]="logo";
 	tags2[13]="email_verified";
 	tags2[14]="promotional_code";
 	tags2[15]="latitude";
 	tags2[16]="facebook";
 	tags2[17]="twitter";
 	tags2[18]="longitude";
 	tags2[19]="client";
 	
 	session.setAttribute("ProfileXml",call.callServlet(url.profileReviewUrl(token)));
 	
 	try{ 
		result=(String)session.getAttribute("ProfileXml");
		res = xml.getTagsContent(result, tags);

		if(res[0].equals("0014")){
			res = xml.getTagsContent2(result, tags2);
			for (int i=0;i<res.length;i++){
				//Check if Business Category
				if(i!=6){
					if(res[i] == null){
						msg.put(tags2[i], "");
					}else if(res[i].equals("N/A")){
						msg.put(tags2[i], "");
					}else if(res[i].equals("null")){
						msg.put(tags2[i], "");
					}else if(!(res[i].equals(""))){
						msg.put(tags2[i], res[i]);
					}else{
						msg.put(tags2[i], "");
					}
				}else{
					msg.put("categoryValue",res[i]);
					switch (Integer.parseInt(res[i])){
						case 1: msg.put(tags2[i], (String)session.getAttribute("BC1"));
						break;
						case 2: msg.put(tags2[i], (String)session.getAttribute("BC2"));
						break;
						case 3: msg.put(tags2[i], (String)session.getAttribute("BC3"));
						break;
						case 4: msg.put(tags2[i], (String)session.getAttribute("BC4"));
						break;
						case 5: msg.put(tags2[i], (String)session.getAttribute("BC5"));
						break;
						case 6: msg.put(tags2[i], (String)session.getAttribute("BC6"));
						break;
						case 7: msg.put(tags2[i], (String)session.getAttribute("BC7"));
						break;
						case 8: msg.put(tags2[i], (String)session.getAttribute("BC8"));
						break;
						case 9: msg.put(tags2[i], (String)session.getAttribute("BC9"));
						break;
						case 10: msg.put(tags2[i], (String)session.getAttribute("BC10"));
						break;
						case 11: msg.put(tags2[i], (String)session.getAttribute("BC11"));
						break;
						case 12: msg.put(tags2[i], (String)session.getAttribute("BC12"));
						break;
						case 13: msg.put(tags2[i], (String)session.getAttribute("BC13"));
						break;
						case 14: msg.put(tags2[i], (String)session.getAttribute("BC14"));
						break;
						case 15: msg.put(tags2[i], (String)session.getAttribute("BC15"));
						break;
						case 16: msg.put(tags2[i], (String)session.getAttribute("BC16"));
						break;
						case 17: msg.put(tags2[i], (String)session.getAttribute("BC17"));
						break;
						case 18: msg.put(tags2[i], (String)session.getAttribute("BC18"));
						break;
						case 19: msg.put(tags2[i], (String)session.getAttribute("BC19"));
						break;
					}
				}	
			}
			result=call.callServlet(url.profileReviewSubscriptorParameters(token));
			res = xml.getTagsContent(result, tags);
			if(res[0].equals("0014")){
				tags2=new String[3];
				tags2[0]="key";
 				tags2[1]="parameters";
 				tags2[2]="parameter";					
 				res2 = xml.getTagsContentMatrix(result, tags2);
 				
 				try{
 					keys=res2[0][0];
 					for(int i=1;i<res2.length;i++){
 						keys+= ","+res2[i][0];
 					}
 					msg.put("keys", keys);
				}catch (ArrayIndexOutOfBoundsException e){
 					//In case si empty
 					msg.put("keys", "");	
 				}
			}
			
			msg.put("baseImg",properties.getProperty("fileBaseLoad"));
			//labels			
			msg.put("lClickforchange",(String)session.getAttribute("Clicktochange"));
			msg.put("result","OK");
			msg.put("Registermsg",(String)session.getAttribute("Registermsg"));
			msg.put("lLocationRelevant",(String)session.getAttribute("LocationRelevant"));
			msg.put("lRegisterhelploc",(String)session.getAttribute("Registerhelploc"));
			//Url short
			shortUrl = new URL(properties.getProperty("urlShortener")+properties.getProperty("QRroot")+token);
			yc = shortUrl.openConnection();
			in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
			shotenedUrl =in.readLine();
			msg.put("qr",URLEncoder.encode(shotenedUrl)); 
			session.setAttribute("bussinesName", msg.getString("name"));
			if(session.getAttribute("isEmailVerifying") != null && ((String)session.getAttribute("isEmailVerifying")).equals("true")){
				msg.put("showButton","false"); 
			}else{
				msg.put("showButton","true"); 
			}
			
			out.println(msg);
		}else if(res[0].equals("0003")){
			msg.put("result","noFound");
			msg.put("value","noFound");
			out.println(msg);
		}else {
			((Logger)session.getAttribute("log")).error("Error "+res[0]+":"+res[1]);
			msg.put("result","NO");	
			msg.put("value",(String)session.getAttribute("FatalError"));
			out.println(msg);
		}
 	} catch (Exception e){
 		((Logger)session.getAttribute("log")).error("Error "+e);
	}	
%>