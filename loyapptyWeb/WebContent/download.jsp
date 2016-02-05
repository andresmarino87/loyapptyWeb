<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@page import="java.io.*"  %>
	<%@page import="java.util.*"  %>
	<%	
	String language=(String)session.getAttribute("language");
 	InputStream stream = null; 
 	
	if((language == null)){
		stream = application.getResourceAsStream("config/englishConf.properties");	
	}else if(language.equals("1")){
		stream = application.getResourceAsStream("config/englishConf.properties");
	}else if(language.equals("0")){
		stream = application.getResourceAsStream("config/spanishConf.properties");	
	}
	Properties properties = new Properties();
	properties.load(stream); 
	%>
	
	<title><%=properties.getProperty("Indexmsg")%></title>
    		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	<link href="css/themes/mobile_blue.min.css" rel="stylesheet" type="text/css"/>
	<style media="all">
		a {
			text-decoration:none!important;
		}
	</style>
	
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0/jquery.mobile.structure-1.0.min.css" />	
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script> 
	<script src="http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.js"></script>
	<script type="text/javascript" src="js/i18n.js"></script>
<STYLE type="text/css">
	#comingSoon{ 
		display:inline;
		vertical-align: middle;
	}
	
</STYLE>
<script type="text/javascript">

 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-29036687-1']);
 _gaq.push(['_trackPageview']);

 (function() {
 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();

 </script> 		
</head> 
<body> 
	<% String useragent = request.getHeader("user-agent"); %>	
	<div data-role="page" id="one">
		<div data-role="header" data-position="inline" style="text-align:center">
			<img src="images/logo2.png" width="150px"/>						
		</div>
		<div data-role="content">	
			<div class="ui-body ui-body-a">
		        <div id="wrapper">
					<% if (request.getParameter("clientId") == null && request.getParameter("serviceId") == null && false) {%>		
						<%=properties.getProperty("InvalidQR")%>
					<% } else if (true){
						String cId = request.getParameter("clientId");
						String sId = request.getParameter("serviceId"); %>
					<% if(useragent!=null && useragent.toUpperCase().contains("BLACKBERRY")){ %>						
						<%=properties.getProperty("Click")%> <a href="http://www.internalloyappty.com/open?clientId=<%=cId%>&serviceId=<%=sId%>"> <%=properties.getProperty("Here")%></a> <%=properties.getProperty("RestDownloadClick")%>
					<% }else{%>
		   				<%=properties.getProperty("Click")%> <a href="loyappty://open?clientId=<%=cId%>&serviceId=<%=sId%>"><%=properties.getProperty("Here")%></a> <%=properties.getProperty("RestDownloadClick")%>
				   <% }%>
		   <ul data-role="listview" data-inset="true" data-filter="false">
		   
		   <% if(useragent!=null && useragent.toUpperCase().contains("BLACKBERRY")){ %>	
				<a>
				<img src="images/BB-App-World-Badge.png" width="172px" height="60px"/><%=properties.getProperty("ComingSoon")%>
				</a>
		   <% }else if (useragent!=null && useragent.toUpperCase().contains("ANDROID")){  %>
		   	<script type="text/javascript">		
				var agent = navigator.userAgent.toLowerCase();
				 if (agent.indexOf('android') != -1) { // Google phones running Android OS
			 		tmp = setInterval(function() {
		               	document.location = "market://details?id=com.ogangi.ego";
	                	clearInterval(tmp);
		        	}, 500);
			  	    document.location = "loyappty://open?clientId=<%=cId%>";
			    }
			</script>
		   
				<a href="https://play.google.com/store/apps/details?id=com.ogangi.ego">
				<img src="images/get_it_on_play_logo_large.png"  width="172px" height="60px"/>
				</a>		        
		   <% }else if (useragent!=null && (useragent.toUpperCase().contains("IPHONE") || useragent.toUpperCase().contains("IPAD"))){  %>    
			<script type="text/javascript">		
				var agent = navigator.userAgent.toLowerCase();
			   	if ((agent.indexOf('iphone') != -1)||(agent.indexOf('ipod') !=-1) ||(agent.indexOf('ipad') !=-1)) { // iOS Device
  					tmp = setInterval(function() {
                		document.location = "itms://itunes.apple.com/us/app/loyappty/id495805647?mt=8";
                		clearInterval(tmp);
    	    		}, 500);
			  	    document.location = "loyappty://open?clientId=<%=cId%>";
			   	}
            </script>
            <a href="http://itunes.com/apps/loyappty">
				<img src="images/App_Store_Badge.26821818_std.png"  width="172px" height="60px"/>
			</a>
		
       		   <% }else{%>
				
				<a href="https://play.google.com/store/apps/details?id=com.ogangi.ego">
				<img src="images/get_it_on_play_logo_large.png"  width="172px" height="60px"/>
				</a>
				<br />
				<a href="http://itunes.com/apps/loyappty">
				<img src="images/App_Store_Badge.26821818_std.png"  width="172px" height="60px"/>
				</a>
				<br />
				<a>
				<img id="comingSoon" src="images/BB-App-World-Badge.png"  width="172px" height="60px" />	<%=properties.getProperty("ComingSoon")%></a>
				<br />
			<% }%>
			</ul>
		   <% }%>
		</div>
		</div>	
		</div><!-- /content -->
<div data-role="footer" data-theme="a">
		<h4> © 2012 Loyappty</h4>
	</div><!-- /footer -->
</div><!-- /page one -->


</body>
</html>