<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
    
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
 <%@include file="jsp/creditsAmbientLogic.jsp" %>
 <%
	 String paypalLan=""; 
	 if(!(((String)session.getAttribute("language")).equals("1"))){
		 paypalLan="&lc=ES";
	 }
 %>

<div align="center">
	<div id="credits_Head_Div">
		<%=(String)session.getAttribute("Buycreditsmsg") %>
		<span class="Titulo"><strong><br />
		<%=(String)session.getAttribute("Buycreditsmsg2") %>
		</strong></span>
	</div>
</div>

<div id="credits_Plans_Staging_Div">
<br/>
	<!-- Subscription -->
	<table id='credits_Plans_Staging_Subs_Table' width="492" border="0" align="center">
		<tr>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table"><%=(String)session.getAttribute("Monthly")%></td>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table"><%=(String)session.getAttribute("Annual")%></td>
		</tr>
		<tr>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$5/<%=(String)session.getAttribute("Month")%></strong></p>
				<p>1<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="QQNSH8U3H9BAA">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="SUBSCRIPTION">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="MONTH">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("Subscribe")%>" style="width:86px!important">
				</form>
			</td>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$50/<%=(String)session.getAttribute("Year")%></strong></p>
				<p>15<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="LSWJEYM3535N8">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="SUBSCRIPTION">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="ANNUAL">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("Subscribe")%>" style="width:86px!important">
				</form>					
			</td>
		</tr>
	</table>
	
	<!--Subscription Prod-->
	
	<table id='credits_Plans_Prod_Subs_Table' width="492" border="0" align="center">
		<tr>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table"><%=(String)session.getAttribute("Monthly")%></td>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table"><%=(String)session.getAttribute("Annual")%></td>
		</tr>
		<tr>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$5/<%=(String)session.getAttribute("Month")%></strong></p>
				<p>1<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				<form action="https://www.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="NQVG8HBRTJJSC">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="SUBSCRIPTION">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="MONTH">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("Subscribe")%>" style="width:86px!important">
				</form>
			</td>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$50/<%=(String)session.getAttribute("Year")%></strong></p>
				<p>15<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				<form action="https://www.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="6TT2MS7KDSC48">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="SUBSCRIPTION">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="ANNUAL">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("Subscribe")%>" style="width:86px!important">
				</form>											
			</td>
		</tr>
	</table>
	
	
	<div align="center">
		<div id="credits_Center_Table_Msg" style="display:none">
			<span class="Titulo"><strong><br />
			<%=(String)session.getAttribute("CreditsWebPusrchadeQuestion") %>
			</strong></span>
			<br />
			<br/>
			<%=(String)session.getAttribute("CreditsWebPusrchade") %>
			<br />
			<br />
		</div>
	</div>
			
	<!--Direct Purchase  -->	
	<table id="credits_Staging_Purchase_Table" width="492" border="0" align="center" style="display:none">
		<tr>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table">1</td>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table">2</td>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table">3</td>
		</tr>
		<tr>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$10</strong></p>
				<p>2<%=(String)session.getAttribute(",")%>500 <%=(String)session.getAttribute("Credit")%></p>				
				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="HNR3TFTGXQZ24">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="WEBPURCHASE">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="10DOLLAR">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("BuyNow")%>" style="width:86px!important">
				</form>
			</td>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$50</strong></p>
				<p>15<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				
				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="BN2H49Z3QDBCL">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="WEBPURCHASE">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="50DOLLAR">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("BuyNow")%>" style="width:86px!important">
				</form>			
			</td>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$100</strong></p>
				<p>35<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="VE9JEPNT6EVTL">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="WEBPURCHASE">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="100DOLLAR">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("BuyNow")%>" style="width:86px!important">
				</form>
			</td>
		</tr>
	</table>	
		<!--Direct Prod -->	
	
		<table id="credits_Prod_Purchase_Table" width="492" border="0" align="center" style="display:none">
		<tr>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table">1</td>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table">2</td>
			<td align="center" valign="top" bgcolor="#F4F4F4" class="Celta-table">3</td>
		</tr>
		<tr>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$10</strong></p>
				<p>2<%=(String)session.getAttribute(",")%>500 <%=(String)session.getAttribute("Credit")%></p>				
				<form action="https://www.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="H68NQ6GNKR8ZS">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="WEBPURCHASE">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="10DOLLAR">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("BuyNow")%>" style="width:86px!important">
				</form>
			</td>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$50</strong></p>
				<p>15<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				
				<form action="https://www.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="7JMA6SUVQHU32">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="WEBPURCHASE">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="50DOLLAR">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("BuyNow")%>" style="width:86px!important">
				</form>						
			</td>
			<td width="150" align="center" valign="top" bgcolor="#F7F7F7"><p><strong>$100</strong></p>
				<p>35<%=(String)session.getAttribute(",")%>000 <%=(String)session.getAttribute("Credit")%></p>
				<form action="https://www.paypal.com/cgi-bin/webscr<%=paypalLan %>" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="9UASJS4Q2QPSA">
					<input type="hidden" name="on0" value="idTags">
					<input type="hidden" name="os0" value="<%=(String)session.getAttribute("token")%>">
					<input type="hidden" name="on1" value="type">
					<input type="hidden" name="os1" value="WEBPURCHASE">
					<input type="hidden" name="on2" value="time">
					<input type="hidden" name="os2" value="100DOLLAR">
					<input type="submit" name="submit" class="button2" value="<%=(String)session.getAttribute("BuyNow")%>" style="width:86px!important">
				</form>
			</td>
		</tr>
	</table>
	
	<br/>
</div>
<br/>
<div align="center">
	<div id="credits_Prepaid_Card_Div" >
		<span class="Titulo"><strong><%=(String)session.getAttribute("PrepaidCardMsg")%></strong></span>
		<br/><br/>
		<%=(String)session.getAttribute("PrepaidCardMsg2")%>		
		<br/><br/>
			<img id="prepaid_card_front_Qmark" src="images/dialog-question.png" width="18px" />
			<img src="images/prepaid_card_front<%=(String)session.getAttribute("footerExt") %>.jpg"  align="left" class="credits_Prepaid_Card_Images" />
			<img id="prepaid_card_back_Qmark" src="images/dialog-question.png" width="18px" align="right"/>
			<img src="images/prepaid_card_back<%=(String)session.getAttribute("footerExt") %>.jpg"  align="right" class="credits_Prepaid_Card_Images" />
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div id="credits_Prepaid_Card_Style_Card" class='formRounCorners' >
			<form id='credits_Pincode_Validate_form' method='post'>
				<table>
					<tr>
						<td>
							<%=(String)session.getAttribute("CardId")%>:
						</td>
						<td>
							<input id="credits_Card_Id" type="text" class='text ui-widget-content ui-corner-all'/>
						</td>
					</tr>
					<tr>	
						<td>
							<%=(String)session.getAttribute("Pin")%>:
						</td>
						<td>
							<input id="credits_Card_Pin" type="text" class='text ui-widget-content ui-corner-all'/>	
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" valign="baseline">
							<input type="submit" value="<%=(String)session.getAttribute("Activate")%>" class='button2' style="width:86px!important"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="prepaid_card_front_dialog" style="display:none">
		<%=(String) session.getAttribute("PrepaidCardFrontHelpMsg")%>
	</div>
	<div id="prepaid_card_back_dialog" style="display:none">
		<%=(String) session.getAttribute("PrepaidCardBackHelpMsg")%>
	</div>
</div>
<script type="text/javascript">  
	//No mover!!! necesario para el idioma
	var ambient="";
	<%
		if(deployAmbient.equalsIgnoreCase("staging")){
	%>
		ambient="0";
	<%  }else{ %>
		ambient="1";
	<%}%>

	<%
		String useragent = request.getHeader("user-agent");
		if(useragent.toUpperCase().contains("IPAD")){
	%>
		$( '.credits_Prepaid_Card_Images' ).css('width','250px');
	<%}%>
	
	var notification="<%=(String)session.getAttribute("Notification")%>";
	var CardIdNotNull='<%=(String)session.getAttribute("CardIdNotNull")%>';
	var PinNotNull='<%=(String)session.getAttribute("PinNotNull")%>';
	$.getScript( "js/credits.js" , function () { 
	});

	 
</script>