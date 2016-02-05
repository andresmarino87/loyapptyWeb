<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*,java.net.*,javax.net.ssl.*,java.io.*"%>
<%@page import="loyapptyWeb.*,org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.codehaus.jettison.json.JSONArray"  %> 
<%@page import="org.apache.log4j.*" %>
<%@page import="java.net.URLEncoder" %>

<%@include file="jsp/logsLogic.jsp" %>

<%
	// read post from PayPal system and add 'cmd'
	Enumeration en = request.getParameterNames();
	StringBuffer strBuffer = new StringBuffer("cmd=_notify-validate");
	String paramName;
	String paramValue;
	while (en.hasMoreElements()) {
		paramName = (String) en.nextElement();
		paramValue = request.getParameter(paramName);
		strBuffer.append("&").append(paramName).append("=")
				.append(URLEncoder.encode(paramValue));
	}

	// post back to PayPal system to validate
	// NOTE: change http: to https: in the following URL to verify using SSL (for increased security).
	// using HTTPS requires either Java 1.4 or greater, or Java Secure Socket Extension (JSSE)
	// and configured for older versions.
//	URL u = new URL("https://www.paypal.com/cgi-bin/webscr");
	URL u = new URL("https://www.sandbox.paypal.com/cgi-bin/webscr");	
	HttpsURLConnection uc = (HttpsURLConnection) u.openConnection();
	uc.setDoOutput(true);
	uc.setRequestProperty("Content-Type",
			"application/x-www-form-urlencoded");
	uc.setRequestProperty("Host", "www.paypal.com");
	PrintWriter pw = new PrintWriter(uc.getOutputStream());
	pw.println(strBuffer.toString());
	pw.close();

	BufferedReader in = new BufferedReader(new InputStreamReader(
			uc.getInputStream()));
	String res = in.readLine();
	in.close();

	// assign posted variables to local variables
	String itemName = request.getParameter("item_name");
	String itemNumber = request.getParameter("item_number");
	String paymentStatus = request.getParameter("payment_status");
	String paymentAmount = request.getParameter("mc_gross");
	String paymentCurrency = request.getParameter("mc_currency");
	String txnId = request.getParameter("txn_id");
	String receiverEmail = request.getParameter("receiver_email");
	String payerEmail = request.getParameter("payer_email");
	String id = request.getParameter("option_selection1");
	String type = request.getParameter("option_selection2");
	String time = request.getParameter("option_selection3");	
	
	// check notification validation
	if (res.equals("VERIFIED")) {		
		if( paymentStatus != null && paymentStatus.equalsIgnoreCase("Completed")){
			String amount="";
			String expiration="";
			UrlAssambler url = new UrlAssambler(); 
			ServletCalls call = new ServletCalls();		
			JSONObject msg = new JSONObject();
			String [] tags= new String[3];
			Xml xml= new Xml();
			Calendar now = Calendar.getInstance();
			
			if(type.equals("SUBSCRIPTION")){
				type="SUBSCRIPTION";
			}else if(type.equals("WEBPURCHASE")){
				type="WEB PURCHASE";
			}

			if(time.equals("MONTH")){
				amount="1000";
				now.add(Calendar.MONTH, 1);
				expiration=(now.get(Calendar.MONTH) + 1)+ "/" + now.get(Calendar.DATE)+ "/" + now.get(Calendar.YEAR);
			}else if(time.equals("ANNUAL")){
				amount="15000";
				now.add(Calendar.YEAR, 1);
				expiration=(now.get(Calendar.MONTH) + 1)+ "/" + now.get(Calendar.DATE)+ "/" + now.get(Calendar.YEAR);
			}else if(time.equals("PLUS")){
				amount="100000";
				now.add(Calendar.YEAR, 1);
				expiration=(now.get(Calendar.MONTH) + 1)+ "/" + now.get(Calendar.DATE)+ "/" + now.get(Calendar.YEAR);
			}else if(time.equals("10DOLLAR")){
				amount="2500";
				
			}else if(time.equals("50DOLLAR")){
				amount="15000";
				
			}else if(time.equals("100DOLLAR")){
				amount="35000";
				
			}
			
			//XML Tags
			tags[0]="status"; 
			tags[1]="reason";
			tags[2]="response";
			
			try{ 
				String result = call.callServlet(url.addCreditsUrl(id, amount, type, expiration));
				tags = xml.getTagsContent(result, tags);
				if(tags[0].equals("0014")){
					((Logger)session.getAttribute("log")).info("User "+id+" has been added "+amount+" credits");					
				}else{
					((Logger)session.getAttribute("log")).error("Error"+tags[0]+":"+tags[1]);
				} 
			} catch (Exception e){
				((Logger)session.getAttribute("log")).error("Error "+e);
			}

		}
	} else if (res.equals("INVALID")) {
		// log for investigation
	} else {
		// error
	}
%>