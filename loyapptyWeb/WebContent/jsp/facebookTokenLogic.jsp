<%@ page import="oauth.signpost.OAuth"%>
<%@ page import="oauth.signpost.OAuthConsumer"%>
<%@ page import="oauth.signpost.OAuthProvider"%>
<%@ page import="oauth.signpost.basic.DefaultOAuthProvider"%>
<%@ page import="oauth.signpost.commonshttp.CommonsHttpOAuthConsumer"%>

<%@ page import="org.apache.http.HttpResponse"%>
<%@ page import="org.apache.http.client.HttpClient"%>
<%@ page import="org.apache.http.client.methods.HttpPost"%>
<%@ page import="org.apache.http.entity.StringEntity"%>
<%@ page import="org.apache.http.impl.client.DefaultHttpClient"%>

<%@page import="org.codehaus.jettison.json.JSONObject"  %> 
<%@page import="org.apache.log4j.*" %>

<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%

	InputStream stream = application.getResourceAsStream("config"+File.separator+"var.properties");
	Properties properties = new Properties();
	properties.load(stream);

//	JSONObject msg = new JSONObject();

	OAuthConsumer consumer = new CommonsHttpOAuthConsumer(properties.getProperty("facebookAppId"),properties.getProperty("facenpplAppSecret"));	
	OAuthProvider provider = new DefaultOAuthProvider("https://graph.facebook.com/oauth/request_token","https://graph.facebook.com/oauth/access_token","https://graph.facebook.com/oauth/authorize");
//OAuthProvider provider = new DefaultOAuthProvider("https://www.facebook.com/dialog/oauth/request_token","https://www.facebook.com/dialog/oauth/access_token","https://www.facebook.com/dialog/oauth/authorize");

	// Set your callback URL here
	String authUrl = provider.retrieveRequestToken(consumer,"http://localhost:8080/loyapptyWeb/main.jsp");		
	
	
//	msg.put("result","OK");
//	msg.put("link",authUrl);
//	out.println(msg);
%>
<a href="<%=authUrl %>">connect</a>
