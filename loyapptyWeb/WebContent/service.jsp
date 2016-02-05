<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String language = (String)session.getAttribute("language");
	String footerExt="";
	if(!language.equals("1")){
		footerExt="_es";
	}
%>

<div id="submenu_serv" class="demo">
	<input type="button" id="add_link_service"  class="ui-state-default ui-corner-all" value="<%=(String) session.getAttribute("Newserv")%>" />
	<div id="QmarkButton">
		<img src="images/dialog-question.png" width="18px"/>
	</div>
	<div id="newcamp_help" style="display:none" >
		<%=(String) session.getAttribute("NewcampButton")%>
	</div>
	<a id="export_link" href="#"><%=(String) session.getAttribute("Export")%></a>
</div>

<div id="service_main">
	<table class="display" id="service_table">
		<thead>
			<tr>
				<th><%=(String) session.getAttribute("Id")%></th>
				<th><%=(String) session.getAttribute("Name")%></th>
				<th><%=(String) session.getAttribute("Alias")%></th>
				<th><%=(String) session.getAttribute("Type")%></th>
				<th><%=(String) session.getAttribute("Status")%></th>
				<th><%=(String) session.getAttribute("Visibility")%></th>
				<th><%=(String) session.getAttribute("Description")%></th>
				<th><%=(String) session.getAttribute("Send")%></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="5" class="dataTables_empty">Loading data from server</td>
			</tr>
		</tbody>
	</table>
	<div class="demo">	
		<div id="dialog_service_details" title="<%=(String)session.getAttribute("Service_Table_Details_tittle")%>">
			<p style="display: none" class="ui-state-error" id="errorServiceEditCodeNull"><%=(String)session.getAttribute("ErrorServiceCodeNULL")%></p>
			<p style="display: none" class="ui-state-error" id="errorServiceEditMsNull"><%=(String)session.getAttribute("ErrorServiceMsNULL")%></p>		
			<table id="tabledetailcampaign">
				<tr>
					<td style="width:33%"><label><%=(String) session.getAttribute("Name")%>:</label><br />
						<input type="text" id="service_details_name" value=""
						class="text ui-widget-content ui-corner-all"  maxlength="30" />
					</td>
					<td align="center"><label><%=(String) session.getAttribute("Icon")%>:<img id="Qmark_icon_detail" src="images/dialog-question.png" width="18px"/></label><br />
						<div id="service_details_logo" class="text ui-corner-all"></div>
					</td>
					<td rowspan="4">
 						<div id="serviceCodesEditInput" style="display:none">		
 							<label id="service_edit_label_private_code_1"><%=(String)session.getAttribute("CodeLabel")%>:</label>			
					 		<input id="service_edit_private_code_1" type=text class="ui-corner-all deleteServicesEditAddCodes serviceEditActualCodes " maxlength="4" size="4"/>
 							<label id="service_edit_label_private_consume_code_1"><%=(String)session.getAttribute("Use")%>:</label>			
		 					<input id="service_edit_private_consume_code_1" type=text class="ui-corner-all deleteServicesEditAddCodes serviceActualEditConsumeNumberCodes" maxlength="4" size="4" />
							<img id="service_edit_private_code_plus_img_1" src="images/plus.png" height="25" width="25" class="service_create_edit_add_private_code deleteServicesEditAddCodes serviceDeleteAllEditCodes" value="1" title="<%=(String)session.getAttribute("AddPrivateCode")%>" style="vertical-align:middle"/>
	 	 					<br id="service_edit_private_code_br_1" class="deleteServicesEditAddCodes" />					
						</div>
					</td>
				</tr>
				<tr>
					<td><label><%=(String) session.getAttribute("Description")%>:</label><br />
						<TEXTAREA id="service_details_description"
								class="text ui-corner-all"
								NAME="alert_text" COLS="34" ROWS="7" maxlength="490"></TEXTAREA>
					</td>
					<td  align="center">
						<div id="file-uploader"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="Urlfield_webservice">				
							<input type="checkbox" id="service_details_optin-check" class="ui-state-active ui-corner-all" /><label id="service_details_optin-check_label"><%=(String) session.getAttribute("Optin")%></label><br />
							<br>
							<label id="service_details_webService_label"><%=(String) session.getAttribute("urlto")%>:</label><br />
							<input type="text" id="service_details_webService" value=""
								class="text ui-widget-content ui-corner-all" maxlength="145"/>
						</div>
					</td>
					<td><label><%=(String) session.getAttribute("Status")%>:</label><br />
						<select id="service_details_status"
						class="text ui-widget-content ui-corner-all"></select>
					</td>
				</tr>
				<tr>
					<td><label><%=(String) session.getAttribute("Dateon")%>:</label><br />
						<input type="text" id="service_details_createdOn" value=""
						class="text ui-widget-content ui-corner-all" readonly="readonly" />
					</td>
					<td>
						<input type="checkbox" id="service_edit_private_checkd" class="ui-state-active ui-corner-all" 
						 value="0" /><%=(String) session.getAttribute("PrivateLoyappty")%>
						<a id="QmarkEditPrivate">
							<img src="images/dialog-question.png" width="18px"/>
						</a>
									
			<!--			<div id="QRCodeDiv"></div>
						<a href="http://en.wikipedia.org/wiki/QR_code" target="_blank" style="font-weight:bold">QR Code:</a>			
			 			<div id="Qmark_qrcode" >
							<img src="images/dialog-question.png" />
						</div> -->
			 			<div id="Qmark_qrcode_dialog" style="display:none">
							<%=(String)session.getAttribute("Qrcodeexplain")%>
						</div>
						<p id="service_details_logo_img"></p>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
									<!-- 	<label><%=(String) session.getAttribute("Type")%>:</label>
			<select id="service_details_type" class="text ui-widget-content ui-corner-all"></select> 
			<br>-->
<!--			<label><%=(String) session.getAttribute("Alias")%>:</label>
			<input type="text" id="service_details_alias" value="" class="text ui-widget-content ui-corner-all" maxlength="50"/>
			<br>	-->
		</div>
	</div>
	
<div id="Qmark_icon_detail_dialog" style="display:none">
				<%=(String) session.getAttribute("NewcampIcon")%>
</div></div>



<!-- formulario -->

<div id="form_service" style="display:none">
	<div id="demo">
		<form class="form_service "style="margin-left:5%;" ENCTYPE="multipart/form-data">
			<h2><%=(String) session.getAttribute("Newserv")%></h2>
			<p style="display: none" class="ui-state-error" id="errorServiceNameNull"><%=(String)session.getAttribute("ErrorServiceNameNULL")%></p>
			<p style="display: none" class="ui-state-error" id="errorServiceCodeNull"><%=(String)session.getAttribute("ErrorServiceCodeNULL")%></p>
			<p style="display: none" class="ui-state-error" id="errorServiceMsNull"><%=(String)session.getAttribute("ErrorServiceMsNULL")%></p>			
			<label><%=(String) session.getAttribute("Name")%>: </label>
			<input type=text class="text ui-widget-content ui-corner-all" id="service_Name_Add" maxlength="30">
			<div id="Qmark_name_camp" >
				<img src="images/dialog-question.png" width="18px"/>
			</div>
			<div id="Qmark_name_camp_dialog" style="display:none">
				<%=(String) session.getAttribute("NewcampName")%>
			</div>
<!--			<label><%=(String) session.getAttribute("Alias")%>: </label>
			<input type=text class="text ui-widget-content ui-state-active ui-corner-all" id="service_Alias_Add">-->
			<label><%=(String) session.getAttribute("Description")%>: </label>
			<TEXTAREA class="text ui-widget-content ui-corner-all" NAME="alert_text" COLS=40 ROWS=5 id="service_Description_Add" maxlength="490" ></TEXTAREA>
			<div id="Qmark_desc_camp" >
				<img src="images/dialog-question.png" width="18px"/>
			</div>
			<div id="Qmark_desc_camp_dialog" style="display:none">
				<%=(String) session.getAttribute("NewcampDesc")%>
			</div>
			<label><%=(String) session.getAttribute("Icon")%>: </label>
			<div id="Qmark_icon_camp" >
				<img src="images/dialog-question.png" width="18px"/>
			</div>
			<div id="Qmark_icon_camp_dialog" style="display:none">
				<%=(String) session.getAttribute("NewcampIcon")%>
			</div>
			<div id="file-uploader-demo1"></div>
<!-- 			 <label><%=(String) session.getAttribute("Type")%>: </label> 
				 <select id="service_Type_Add" class=".ui-state-active ui-corner-all">
					<option value="1"><%=(String) session.getAttribute("Ondemand")%></option>
				</select> -->
	<!--  		<div id="ondemand_service" >
				<br />
				<label><%=(String) session.getAttribute("Webservice")%>: </label>
				<input id="service_url_input_onDemand" type=text class="text ui-widget-content .ui-state-active ui-corner-all" maxlength="215">
			</div>-->

			<div id="optin-div" >
				<input type="checkbox" id="optin-check" class="ui-state-active ui-corner-all"  value="0" /><%=(String) session.getAttribute("Optin")%>
				<div id="QmarkAdvc">
					<img src="images/dialog-question.png" width="18px"/>
				</div>
				<div id="Advc_help_dialog" style="display:none">
					<%=(String) session.getAttribute("NewcampAdvc")%>
				</div>
				<br />
			</div>
			<div id="advance_service" style="display:none">
				<p><%=(String) session.getAttribute("Advmsg")%>
				</p>
				<label><%=(String) session.getAttribute("urlto")%>: </label>
				<input id="service_url_input_subscription" type=text class="text ui-widget-content ui-state-active ui-corner-all" maxlength="145">
			</div>
			<br/>
			<div id="private_service">
				<input type="checkbox" id="service_private_check" class="ui-state-active ui-corner-all"  value="0" /><%=(String) session.getAttribute("PrivateLoyappty")%>
				<a id="QmarkPrivate">
					<img src="images/dialog-question.png" width="18px"/>
				</a>
				<div id="Qmark_icon_private_dialog" style="display:none">
					<%=(String) session.getAttribute("PrivateHelpMsg")%>
				</div>
				<div id="service_private_codes" style="display:none">
					<label id="service_label_private_code_1"><%=(String)session.getAttribute("CodeLabel")%>:</label>
					<input id="service_private_code_1" type=text class="text ui-widget-content .ui-state-active ui-corner-all serviceActualCodes" maxlength="4" size="4" />
					<label id="service_label_consume_private_code_1"><%=(String)session.getAttribute("Use")%>:</label>
					<input id="service_private_consume_code_1" type=text class="text ui-widget-content .ui-state-active ui-corner-all serviceActualConsumeNumberCodes" maxlength="4" size="4" style="vertical-align:middle"/>
					<img id="service_private_code_plus_img_1" src="images/plus.png" height="25" width="25" class="service_create_add_private_code deleteServicesAddCodes" value="1" title="<%=(String)session.getAttribute("AddPrivateCode")%>" style="vertical-align:middle"/>
					<img id="service_private_random_number_1" src="images/random.png" height="25" width="25" class="service_add_random_private_code" value="1" title="<%=(String)session.getAttribute("Random")%>" style="vertical-align:middle"/>
					<br id="service_private_code_br_1" />
				</div>
			</div>			
			<br />	
			<br />		
			<input type="checkbox" id="service_Publish_Add" class="ui-state-active ui-corner-all" checked value="1" /><%=(String) session.getAttribute("Publish")%><br />
			
			<div class="centerbutton demo">		
				<button  class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="send_service" >
					<%=(String) session.getAttribute("Save")%>
				</button>
				<button id="hideformservice" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" >
					<%=(String) session.getAttribute("Cancel")%>
				</button>
			</div>
		</form> 
	</div>
	<br />
</div>

<!-- Send Loyappty -->

<div id="form_Send_service" style="display:none">
	<div id="demo">
			<!-- <legend><%=(String)session.getAttribute("Setmsg")%></legend> -->
			<p>
				<span id="newmsg_link" ><%=(String)session.getAttribute("Newmsg")%></span>
			</p>
			<p>
				<a style="display:none "href="#" id="fromtmp_link"><%=(String)session.getAttribute("Fromtmp")%></a>
			</p>
			<div id="newmsg">
			<!-- <%=(String)session.getAttribute("Canwrite")%>  -->
			<br />
			<label for="service_send_Textarea"><%=(String)session.getAttribute("Text")%>:</label> 
			<div id="newmsgtxt" style="display">
				<TEXTAREA id="service_send_Textarea" style="margin-left: 4px;" class="text ui-widget-content ui-corner-all" NAME="service_text" COLS='50' ROWS='7'></TEXTAREA>
				<input id="service_post_twitter" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" />
					<img src="images/twsend<%=footerExt %>.png" alt="" border="0" width="150" class="social_network"/>
					<a id="service_QmarkButton_tw">
						<img src="images/dialog-question.png" width="18px" class="public_social_network_help_button"/>
					</a><br/>
				<input id="service_post_facebook" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" />
					<img src="images/fbsend<%=footerExt %>.png" alt="" border="0" width="150" class="social_network"/>
					<a id="service_QmarkButton_fb">
						<img src="images/dialog-question.png" width="18px" class="public_social_network_help_button"/>
					</a><br/>
				<input id="service_post_email" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" />
					<img src="images/mailsend<%=footerExt %>.png" alt="" border="0" width="150" class="social_network"/>
					<a id="service_QmarkButton_mail">
						<img src="images/dialog-question.png" width="18px" class="public_social_network_help_button"/>
					</a><br/>
			</div>
			<div id="newmsgtmp" style="display:none">
				<label for="sendUrl"><%=(String)session.getAttribute("Htmlurl")%>: </label> 
				<input id="sendUrl" type="text" class="text ui-widget-content ui-corner-all"/>
			</div>
		</div>
		<p><%=(String)session.getAttribute("Sendalertmsg")%></p>
		<input id="service_Now_Check" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" checked/><%=(String)session.getAttribute("Now")%><br />
		<div class="service_date_schedule" style="display:none">
			<%=(String)session.getAttribute("Date")%>:<input type="text" id="service_Timepicker" class="ui-state-active ui-corner-all"><br/>
			<div id="restrictedinline">
				<label for="service_No_Restricted_Days"><%=(String)session.getAttribute("RestrictedDays")%></label>
				<input name="service_No_Restricted_Days" type="checkbox" id="service_No_Restricted_Days" />
				<div id="service_Set_Restricted_Days" style="display:none">
					<label for="service_resDayMon"><%=(String)session.getAttribute("Monday")%>:</label>
					<input class="service_setResDays" name="service_resDayMon" type="checkbox" id="service_resDayMon"  value="mon" />
					<label for="service_resDayTue"><%=(String)session.getAttribute("Tuesday")%>:</label>
					<input class="service_setResDays" name="service_resDayTue" type="checkbox" id="service_resDayTue"  value="tue"/>
					<label for="service_resDayWed"><%=(String)session.getAttribute("Wednesday")%>:</label>
					<input class="service_setResDays" name="service_resDayWed" type="checkbox" id="service_resDayWed"  value="wed"/>
					<label for="service_resDayThu"><%=(String)session.getAttribute("Thursday")%>:</label>
					<input class="service_setResDays" name="service_resDayThu" type="checkbox" id="service_resDayThu"  value="thu"/>
					<label for="service_resDayFri"><%=(String)session.getAttribute("Friday")%>:</label>
					<input class="service_setResDays" name="service_resDayFri" type="checkbox" id="service_resDayFri"  value="fri"/>
					<label for="service_resDaySat"><%=(String)session.getAttribute("Saturday")%>:</label>
					<input class="service_setResDays" name="service_resDaySat" type="checkbox" id="service_resDaySat" checked="checked" value="sat"/>
					<label for="service_resDaySun"><%=(String)session.getAttribute("Sunday")%>:</label>
					<input class="service_setResDays" name="service_resDaySun" type="checkbox" id="service_resDaySun" checked="checked" value="sun"/>
				</div>
			</div>
		</div>
		<!--Restricted Hours -->
		<p style='display:none'><%=(String)session.getAttribute("Restrict")%>:</p>
		<input style='display:none' id="service_time_restricted" type="checkbox" name="nohours" value="nohours" checked/><!-- <%=(String)session.getAttribute("Norestrict")%><br />-->
		<div id="service_div_time_restrict" style="display:none">
			<label for="service_time_start"><%=(String)session.getAttribute("Strtime")%>:</label> 
			<input type="text" id="service_time_start" class="ui-state-active ui-corner-all">
			<br />
			<label for="service_time_end"><%=(String)session.getAttribute("Endtime")%>:</label> 
			<input type="text" id="service_time_end" class="ui-state-active ui-corner-all" style="margin-left: 9px;">
		</div>
		<br/>
		<div class="centerbutton demo">		
			<button  class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="send_Message_service" >
				<%=(String) session.getAttribute("Send")%>
			</button>	
			<button  class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="cancel_Message_service">
				<%=(String) session.getAttribute("Cancel")%>
			</button>
		</div>
	</div>
	<br />
</div>
<div class="demo">
	<div id="service_Email_Check_Valid_Dialog"  title="<%=(String)session.getAttribute("CheckValidateEmailTitleAlert")%>" style="display:none">
		<%=(String) session.getAttribute("CheckValidateEmailMsgAlert")%>
	</div>	
</div>
<div id="service_QmarkButton_tw_help_Dialog" style="display:none">
	<%=(String) session.getAttribute("PublicTwitterButton")%>
</div>
<div id="service_QmarkButton_fb_help_Dialog" style="display:none">
	<%=(String) session.getAttribute("PublicFacebookButton")%>
</div>
<div id="service_QmarkButton_mail_help_Dialog" style="display:none">
	<%=(String) session.getAttribute("PublicMailButton")%>
</div>
<script type="text/javascript">

var save = '<%=(String)session.getAttribute("Save")%>';
var ok = '<%=(String)session.getAttribute("OKButton")%>';
var cancel = '<%=(String)session.getAttribute("Cancel")%>';
var help = '<%=(String)session.getAttribute("Help")%>';
var notification="<%=(String)session.getAttribute("Notification")%>";
var searchText="<%=(String)session.getAttribute("Search")%>:";
var exportText="<%=(String)session.getAttribute("Export")%>";
var infoEmptyText="<%=(String)session.getAttribute("TableInfoEmpty")%>";
var infoText="<%=(String)session.getAttribute("TableInfo")%>";
var infoFilteredText="<%=(String)session.getAttribute("TableInfoFiltered")%>";
var processingText="<%=(String)session.getAttribute("TableProcessing")%>";
var zeroRecordsText="<%=(String)session.getAttribute("TableZeroRecords")%>";
var del="<%=(String)session.getAttribute("Delete")%>";
var confirmationMsg="<%=(String)session.getAttribute("ServiceDeleteConfirm")%>";
var codesMsg="<%=(String)session.getAttribute("CodeLabel")%>";
var randomLabel="<%=(String)session.getAttribute("Random")%>";
var useLabel=" <%=(String)session.getAttribute("Use")%>";
var AddPrivateCodeLabel="<%=(String)session.getAttribute("AddPrivateCode")%>";
var DeletePrivateCodeLabel="<%=(String)session.getAttribute("DeletePrivateCode")%>";
var words="<%=(String)session.getAttribute("Words")%>";
var characters="<%=(String)session.getAttribute("Characters")%>";
var SendText="<%=(String)session.getAttribute("Send")%>";
var validateText="<%=(String)session.getAttribute("ValidateMsg")%>";

$.getScript( "js/service.js" , function () { 
}); 
</script>