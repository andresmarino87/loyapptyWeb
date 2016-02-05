<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome to Loyappty</title>
    		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	<link href="css/themes/mobile_blue.min.css" rel="stylesheet" type="text/css"/>
			
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0/jquery.mobile.structure-1.0.min.css" />	
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script> 
	<script src="http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.js"></script>
	<script type="text/javascript" src="js/i18n.js"></script>

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
	<% String useragent = request.getHeader("user-agent");%>
	
	
	<div data-role="page" id="one">

		<div data-role="header" data-position="inline" style="text-align:center">
			<img src="images/logo2.png" width="150px"/>
			
			<h1>Loyappty<br /> Download Center</h1>
			
		</div>

	<div data-role="content">	
		<div class="ui-body ui-body-a">
        <div id="wrapper">
		   <% if (request.getParameter("clientId") == null && request.getParameter("serviceId") == null && false) {%>
		
		   Lo sentimos, el QR Code parece invalido, por favor, trate de escanearlo nuevamente.
		
		   <% } else if (true){
		   String cId = request.getParameter("clientId");
		   String sId = request.getParameter("serviceId"); %>
		   
		   Please click <a href="loyappty://open?clientId=<%=cId%>&serviceId=<%=sId%>">here</a> if already have Loyappty installed
		      
		   <ul data-role="listview" data-inset="true" data-filter="false">
		   <% if(useragent!=null && useragent.toUpperCase().contains("BLACKBERRY")){ %>	
		        <li><a href="#">BlackBerry App World (Coming Soon)</a></li>
		   <% }else if (useragent!=null && useragent.toUpperCase().contains("ANDROID")){  %>
		        <li><a href="https://market.android.com/details?id=com.ogangi.ego&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS5vZ2FuZ2kuZWdvIl0">Android Market</a></li>
		   <% }else if (useragent!=null && (useragent.toUpperCase().contains("IPHONE") || useragent.toUpperCase().contains("IPAD"))){  %>    
				<li><a href="http://itunes.apple.com/us/app/loyappty/id495805647?mt=8">Apple App Store</a></li>
		   <% }else{%>
				<li><a href="https://market.android.com/details?id=com.ogangi.ego&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS5vZ2FuZ2kuZWdvIl0">Android Market</a></li>
				<li><a href="http://itunes.apple.com/us/app/loyappty/id495805647?mt=8">Apple App Store</a></li>
				<li><a href="#">BlackBerry App World (Coming Soon)</a></li>
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


<!-- Start of second page: #two -->
<div data-role="page" id="two" data-theme="a">

	<div data-role="header">
		<a href="#one"  data-direction="reverse" data-icon="back">Back</a>
		<h1>Android Market</h1>
	</div><!-- /header -->

	<div data-role="content" data-theme="a">	
		<!--<h2>Android</h2>-->
		<a href="https://market.android.com/details?id=com.ogangi.ego&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS5vZ2FuZ2kuZWdvIl0" data-role="button" data-icon="star" data-theme="a">Download</a>
	<p>	
Loyappty is a simple way to find and stay in touch with businesses you
like.  It is absolutely free. There is no registration and no login.
Simply
download and start searching for businesses by name, category, or
location.
Loyappty is location aware, search for nearby pizza, gas, wi-fi spot!
Businesses will display coupons, offers, reminders, or updates you can
opt-in to. The is no spamming in loyappty, none!  You only receive what
you
opted-in or subscribed to. Changed your mind? No problem. You can freeze
(stop temporarily) or permanently stop any, or all, of your selections at
any time.  There is no need to disclose any personal information, not even
your mobile phone number.
Start loyappting, start saving time and money!
</p>	
		
		<img src="images/lobby1.png" width="200px"/>
		<img src="images/BUSINESS_SEARCH.png" width="200px" height="355px"/>
		<img src="images/MYLOYAPPTIES.png" width="200px"/>
		
		
		
		
		<p><a href="#one" data-direction="reverse" data-role="button" data-theme="a">Back to home</a></p>	
		
	</div><!-- /content -->
	
	<div data-role="footer">
		<h4> © 2012 Loyappty</h4>
	</div><!-- /footer -->
</div><!-- /page two -->



<!-- Start of second page: #three -->
<div data-role="page" id="three" data-theme="a">

	<div data-role="header">
			<a href="#one"  data-direction="reverse" data-icon="back">Back</a>
	
		<h1>BlackBerry App World <br />(Comming Soon)</h1>
	</div><!-- /header -->

	<div data-role="content" data-theme="a">	
		<!--<h2>BlackBerry</h2> -->
		<!--   <a href="#" data-role="button" data-icon="star" data-theme="a">Download</a>
-->
	<p>	
Loyappty is a simple way to find and stay in touch with businesses you
like.  It is absolutely free. There is no registration and no login.
Simply
download and start searching for businesses by name, category, or
location.
Loyappty is location aware, search for nearby pizza, gas, wi-fi spot!
Businesses will display coupons, offers, reminders, or updates you can
opt-in to. The is no spamming in loyappty, none!  You only receive what
you
opted-in or subscribed to. Changed your mind? No problem. You can freeze
(stop temporarily) or permanently stop any, or all, of your selections at
any time.  There is no need to disclose any personal information, not even
your mobile phone number.
Start loyappting, start saving time and money!
</p>		

	
		<p><a href="#one" data-direction="reverse" data-role="button" data-theme="a">Back to home</a></p>	
		
	</div><!-- /content -->
	
	<div data-role="footer">
		<h4> © 2012 Loyappty</h4>
	</div><!-- /footer -->
</div><!-- /page three -->
	



<!-- Start of second page: #four -->
<div data-role="page" id="four" data-theme="a">

	<div data-role="header">
			<a href="#one"  data-direction="reverse" data-icon="back">Back</a>
	
		<h1>Apple App Store</h1>
	</div><!-- /header -->

	<div data-role="content" data-theme="a">	
		<!--<h2>IOS: Iphone, Ipod touch and Ipad</h2>-->
		<a href="http://itunes.apple.com/us/app/loyappty/id495805647?mt=8" data-role="button" data-icon="star" data-theme="a">Download</a>
		
	<p>	
Loyappty is a simple way to find and stay in touch with businesses you
like.  It is absolutely free. There is no registration and no login.
Simply
download and start searching for businesses by name, category, or
location.
Loyappty is location aware, search for nearby pizza, gas, wi-fi spot!
Businesses will display coupons, offers, reminders, or updates you can
opt-in to. The is no spamming in loyappty, none!  You only receive what
you
opted-in or subscribed to. Changed your mind? No problem. You can freeze
(stop temporarily) or permanently stop any, or all, of your selections at
any time.  There is no need to disclose any personal information, not even
your mobile phone number.
Start loyappting, start saving time and money!
</p>	

		<img src="images/lobby1.png" width="200px"/>
		<img src="images/BUSINESS_SEARCH.png" width="200px" height="355px"/>
		<img src="images/MYLOYAPPTIES.png" width="200px"/>
		
		
		
		<p><a href="#one" data-direction="reverse" data-role="button" data-theme="a">Back to home</a></p>	
		
	</div><!-- /content -->
	
	<div data-role="footer">
		<h4> © 2012 Loyappty</h4>
	</div><!-- /footer -->
</div><!-- /page four -->


</body>
</html>