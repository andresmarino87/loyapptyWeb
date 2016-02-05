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

	JSONObject msg = new JSONObject();

	OAuthConsumer consumer = new CommonsHttpOAuthConsumer(properties.getProperty("twitterConsumerKey"),properties.getProperty("twitterConsumerSecret"));	
	OAuthProvider provider = new DefaultOAuthProvider("http://twitter.com/oauth/request_token","http://twitter.com/oauth/access_token","http://twitter.com/oauth/authorize");

	// Set your callback URL here
	String authUrl="";
	if(request.getParameter("type") == null){
		authUrl = provider.retrieveRequestToken(consumer,properties.getProperty("thisServerBase")+"main.jsp");	
	}else if(request.getParameter("type").equals("index")){
		authUrl = provider.retrieveRequestToken(consumer,properties.getProperty("thisServerBase")+"twitterBridge.jsp?lan="+request.getParameter("lan"));
	}
				
	msg.put("result","OK");
	msg.put("link",authUrl);
	out.println(msg);
%>
