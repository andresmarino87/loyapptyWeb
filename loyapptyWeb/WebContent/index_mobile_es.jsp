<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome to Loyappty</title>
    		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	<link rel="stylesheet" href="css/themes/loyappty_mobile.min.css" />
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
	
	
	<div data-role="page" id="one">

		<div data-role="header" data-position="inline">
			<h1>Bienvenido al centro de descargas<br /> Loyappty</h1>
			<a href="download.jsp"  data-direction="reverse" data-icon="star">English</a>
			
		</div>

	<div data-role="content">	
		<div class="ui-body ui-body-a">
        <div id="wrapper">
		   <% if (request.getParameter("clientId") == null && request.getParameter("serviceId") == null && false) {%>
		
		   Lo sentimos, el QR Code parece invalido, por favor, trate de escanearlo nuevamente.
		
		   <% } else if (true){
		   String cId = request.getParameter("clientId");
		   String sId = request.getParameter("serviceId"); %>
		   
		   <a href="LOYAPPTY://open?clientId=<%=cId%>&serviceId=<%=sId%>">Ver contenido</a>
		   		   
		   <ul data-role="listview" data-inset="true" data-filter="false">
				<li><a href="#two">Android</a></li>
				<li><a href="#three">Blackberry</a></li>
				<li><a href="#four">IOS</a></li>
			</ul>
		
		   <% }%>
		</div>
		</div>	
		</div><!-- /content -->

	
<div data-role="footer" data-theme="a">
		<h4>Loyappty copyright 2012</h4>
	</div><!-- /footer -->
</div><!-- /page one -->


<!-- Start of second page: #two -->
<div data-role="page" id="two" data-theme="a">

	<div data-role="header">
		<a href="#one"  data-direction="reverse" data-icon="back">Back</a>
		<h1>Andriod app</h1>
	</div><!-- /header -->

	<div data-role="content" data-theme="a">	
		<h2>Android</h2>
		<a href="https://market.android.com/details?id=com.ogangi.ego" data-role="button" data-icon="star" data-theme="a">Download</a>
		
		<p>I have an id of "two" on my page container. I'm the second page container in this multi-page template.</p>	
		<p>Notice that the theme is different for this page because we've added a few <code>data-theme</code> swatch assigments here to show off how flexible it is. You can add any content or widget to these pages, but we're keeping these simple.</p>	
		
		<img src="images/androidapp1.jpg"/>
		<img src="images/androidapp2.jpg"/>
		
		
		
		<p><a href="#one" data-direction="reverse" data-role="button" data-theme="a">Back to home</a></p>	
		
	</div><!-- /content -->
	
	<div data-role="footer">
		<h4>Loyappty copyright 2012</h4>
	</div><!-- /footer -->
</div><!-- /page two -->



<!-- Start of second page: #three -->
<div data-role="page" id="three" data-theme="a">

	<div data-role="header">
			<a href="#one"  data-direction="reverse" data-icon="back">Back</a>
	
		<h1>Blackberry app</h1>
	</div><!-- /header -->

	<div data-role="content" data-theme="a">	
		<h2>Blackberry</h2>
		<a href="https://market.android.com/details?id=com.ogangi.ego" data-role="button" data-icon="star" data-theme="a">Download</a>
		
		<p>I have an id of "two" on my page container. I'm the second page container in this multi-page template.</p>	
		<p>Notice that the theme is different for this page because we've added a few <code>data-theme</code> swatch assigments here to show off how flexible it is. You can add any content or widget to these pages, but we're keeping these simple.</p>	
		
		<img src="images/androidapp1.jpg"/>
		<img src="images/androidapp2.jpg"/>
		
		
		
		<p><a href="#one" data-direction="reverse" data-role="button" data-theme="a">Back to home</a></p>	
		
	</div><!-- /content -->
	
	<div data-role="footer">
		<h4>Loyappty copyright 2012</h4>
	</div><!-- /footer -->
</div><!-- /page three -->
	



<!-- Start of second page: #four -->
<div data-role="page" id="four" data-theme="a">

	<div data-role="header">
			<a href="#one"  data-direction="reverse" data-icon="back">Back</a>
	
		<h1>IOS app</h1>
	</div><!-- /header -->

	<div data-role="content" data-theme="a">	
		<h2>IOS: Iphone, Ipod touch and Ipad</h2>
		<a href="https://market.android.com/details?id=com.ogangi.ego" data-role="button" data-icon="star" data-theme="a">Download</a>
		
		<p>I have an id of "two" on my page container. I'm the second page container in this multi-page template.</p>	
		<p>Notice that the theme is different for this page because we've added a few <code>data-theme</code> swatch assigments here to show off how flexible it is. You can add any content or widget to these pages, but we're keeping these simple.</p>	
		
		<img src="images/androidapp1.jpg"/>
		<img src="images/androidapp2.jpg"/>
		
		
		
		<p><a href="#one" data-direction="reverse" data-role="button" data-theme="a">Back to home</a></p>	
		
	</div><!-- /content -->
	
	<div data-role="footer">
		<h4>Loyappty copyright 2012</h4>
	</div><!-- /footer -->
</div><!-- /page four -->


</body>
</html>