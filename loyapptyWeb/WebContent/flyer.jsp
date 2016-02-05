<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- <div id="contInnerWhite">
	<div id="flyerLeftContainer"><br/><br/>
		<span id="promotionalCode"></span> 
		<img id="flyer_QRcode_input" src="" width="100%" align="left" />
	</div>
	<div id="flyerRightContainer">
		<div  id="flyerBusinessName"></div>
		<textarea id="flyerInputText"><%=(String) session.getAttribute("FlyerText")%>
		</textarea>
	</div>
</div>-->

<div id="flyer_wrapper"  >
	<table>
		<tr>
			<td>
				<div id="flyer_container">
					<table width="95%" border="0" cellspacing="2" cellpadding="2">
						<tr>
							<td width="41%">
								<img id='flyer_Logo_input' src="" width="150" height="104"/>
							</td>
							<td width="59%" class="flyer_round_corners_back">
								<textarea name="txa_slogan" id='flyer_Text_Slogan_BusinessName' class="flyer_round_corners flyer_textarea" cols="45" rows="3" title="slogan"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="flyer_round_corners_back">
								<textarea name="txa_description" id="txa_description"  class="flyer_round_corners flyer_textarea"cols="45" rows="7"><%=(String) session.getAttribute("FlyerText")%></textarea>
							</td>
						</tr>
					</table>
				</div>	
			</td>
			<td rowspan="2">
				<div id="flyer_qrcode" ><div id="hd_qr" class="flyer_qr_text flyer_round_top" style="float:right;"> <span class="flyer_txt_blue"><%=(String)session.getAttribute("flyerScanThis") %></span></div>
					<div id="flyer_QR"><img id='flyer_QRcode_image' src="" align="middle" style='width:350px'/></div>
					<div id="qr_code" class="flyer_qr_text flyer_round_bottom" style="float:left;"><span id='flyer_Promotional_Code_Append' class="flyer_txt"></span></div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="flyer_head_corner" class="flyer_head_corner flyer_head_corner_class"><!-- <img  src="images/ballom_corner.png" align="right"/>--></div>
				<div class="flyer_cellphone_class"><img id="flyer_cellphone" src="images/imgApps.png" /></div>
			</td>
		</tr>
	</table>
</div>

<div class="centerbutton demo">
	<input type="button" id="flyer_Print_button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
		value="<%=(String) session.getAttribute("FlyerPrintSave")%>"></input>
	<input type="button" id="flyer_Share_button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
		value="<%=(String) session.getAttribute("Share")%>"></input>
</div>

<script type="text/javascript">
	var thisServerBase="<%=(String)session.getAttribute("thisServerBase")%>";
	var facebookAppId="<%=(String)session.getAttribute("facebookAppId")%>";
	var scanThisMsgTag="<%=(String) session.getAttribute("flyerScanThis")%>";
	var promotionalMsgTag="<%=(String) session.getAttribute("PromotionalCode")%>";
	var closeButton="<%=(String)session.getAttribute("Close")%>";
	$.getScript("js/flyer.js", function() {});
</script>