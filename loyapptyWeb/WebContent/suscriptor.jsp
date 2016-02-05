<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String language = (String)session.getAttribute("language");
	String footerExt="";
	if(!language.equals("1")){
		footerExt="_es";
	}
%>
<div id="suscriptor_main"> 
	<div id="submenu_subs">
		<a id="export_link" href="#"><%=(String)session.getAttribute("Export")%></a>
	</div>
 
	<table class="display" id="suscriptor_table">
		<thead>
			<tr>
				<th><%=(String)session.getAttribute("Id")%></th>
				<th ><%=(String)session.getAttribute("Suscriptor_Table_Alias")%></th>
				<th ><%=(String)session.getAttribute("Suscriptor_Table_Service")%></th>
				<th ><%=(String)session.getAttribute("Suscriptor_Table_Opt-in")%></th>
				<th ><%=(String)session.getAttribute("Suscriptor_Table_Device")%></th>
				<th><%=(String)session.getAttribute("Status")%></th>
				<th><%=(String)session.getAttribute("Name")%></th>	
				<th><%=(String)session.getAttribute("Email")%></th>
				<th><%=(String)session.getAttribute("Mobile")%></th>
 				<th ><%=(String)session.getAttribute("ServiceId")%></th> 
				<th><%=(String) session.getAttribute("Send")%></th>
			</tr>
		</thead>
		<tbody> 
			<tr>
				<td colspan="5" class="dataTables_empty">Loading data from server</td>
			</tr>
		</tbody>
	</table>
</div>

<div id="suscriptor_details_dialog" style="display:none">
	<div id='subscriptorDtails'>	
		<table>
			<tr style="width:100%">
				<td id='suscriptor_details_tables_column_0' class='suscriptor_details_tables_column'>
				</td>
				<td id='suscriptor_details_tables_column_1' class='suscriptor_details_tables_column'>
				</td>
				<td id='suscriptor_details_tables_column_2' class='suscriptor_details_tables_column'>
				</td>
			</tr>
		</table>	
	
	
	</div>
</div>

<div id=form_group style="display:none">
	<form style="margin-left:5%;"> 
		<label><%=(String)session.getAttribute("Name")%>:</label>
		<input type=text class="text ui-widget-content .ui-state-active ui-corner-all">
		<label><%=(String)session.getAttribute("Alias")%>:</label>
		<input type=text class="text ui-widget-content .ui-state-active ui-corner-all">
		<label><%=(String)session.getAttribute("Description")%>:</label>
		<TEXTAREA class="text ui-widget-content ui-corner-all" NAME="alert_text" COLS=40 ROWS=5></TEXTAREA>
		<br />	
		<br />		
		<input type="button"class="ui-state-default ui-corner-all"  value="<%=(String)session.getAttribute("Send")%>" />
	</form>
	<br />
	<div class="centerbutton">		
		<button id="hideformgroup"  class="ui-state-default ui-corner-all"><%=(String)session.getAttribute("Cancel")%></button>
	</div>
</div>

<!-- Send Loyappty -->

<div id="form_Send_suscriptor" style="display:none">
	<div id="demo">
			<!-- <legend><%=(String)session.getAttribute("Setmsg")%></legend> -->
			<p>
				<span id="newmsg_link" ><%=(String)session.getAttribute("Newmsg")%></span>
			</p>
			<p>
				<a style="display:none "href="#" id="fromtmp_link"><%=(String)session.getAttribute("Fromtmp")%></a>
			</p>
			<div id="newmsg">
			<br />
			<label for="suscriptor_send_Textarea"><%=(String)session.getAttribute("Text")%>:</label> 
			<div id="newmsgtxt" style="display">
				<TEXTAREA id="suscriptor_send_Textarea" style="margin-left: 4px;" class="text ui-widget-content ui-corner-all" NAME="suscriptor_text" COLS='50' ROWS='7'></TEXTAREA>	 
				<input id="service_post_twitter" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" />
					<img src="images/twsend<%=footerExt %>.png" alt="" border="0" width="150" class="social_network"/>
					<a id="suscriptor_QmarkButton_tw">
						<img src="images/dialog-question.png" width="18px" class="public_social_network_help_button"/>
					</a><br/>
				<input id="service_post_facebook" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" />
					<img src="images/fbsend<%=footerExt %>.png" alt="" border="0" width="150" class="social_network"/>
					<a id="suscriptor_QmarkButton_fb">
						<img src="images/dialog-question.png" width="18px" class="public_social_network_help_button"/>
					</a><br/>
				<input id="service_post_email" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" />
					<img src="images/mailsend<%=footerExt %>.png" alt="" border="0" width="150" class="social_network"/>
					<a id="suscriptor_QmarkButton_mail">
						<img src="images/dialog-question.png" width="18px" class="public_social_network_help_button"/>
					</a><br/>
			</div>
			<div id="newmsgtmp" style="display:none">
				<label for="sendUrl"><%=(String)session.getAttribute("Htmlurl")%>: </label> 
				<input id="sendUrl" type="text" class="text ui-widget-content ui-corner-all"/>
			</div>
		</div>
		<p><%=(String)session.getAttribute("Sendalertmsg")%></p>
		<input id="suscriptor_Now_Check" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" checked/><%=(String)session.getAttribute("Now")%><br />
		<div class="suscriptor_date_schedule" style="display:none">
			<%=(String)session.getAttribute("Date")%>:<input type="text" id="suscriptor_Timepicker" class="ui-state-active ui-corner-all"><br/>
			<div id="restrictedinline">
				<label for="suscriptor_No_Restricted_Days"><%=(String)session.getAttribute("RestrictedDays")%></label>
				<input name="suscriptor_No_Restricted_Days" type="checkbox" id="suscriptor_No_Restricted_Days" />
				<div id="suscriptor_Set_Restricted_Days" style="display:none">
					<label for="suscriptor_resDayMon"><%=(String)session.getAttribute("Monday")%>:</label>
					<input class="suscriptor_setResDays" name="suscriptor_resDayMon" type="checkbox" id="suscriptor_resDayMon"  value="mon" />
					<label for="suscriptor_resDayTue"><%=(String)session.getAttribute("Tuesday")%>:</label>
					<input class="suscriptor_setResDays" name="suscriptor_resDayTue" type="checkbox" id="suscriptor_resDayTue"  value="tue"/>
					<label for="suscriptor_resDayWed"><%=(String)session.getAttribute("Wednesday")%>:</label>
					<input class="suscriptor_setResDays" name="suscriptor_resDayWed" type="checkbox" id="suscriptor_resDayWed"  value="wed"/>
					<label for="suscriptor_resDayThu"><%=(String)session.getAttribute("Thursday")%>:</label>
					<input class="suscriptor_setResDays" name="suscriptor_resDayThu" type="checkbox" id="suscriptor_resDayThu"  value="thu"/>
					<label for="suscriptor_resDayFri"><%=(String)session.getAttribute("Friday")%>:</label>
					<input class="suscriptor_setResDays" name="suscriptor_resDayFri" type="checkbox" id="suscriptor_resDayFri"  value="fri"/>
					<label for="suscriptor_resDaySat"><%=(String)session.getAttribute("Saturday")%>:</label>
					<input class="suscriptor_setResDays" name="suscriptor_resDaySat" type="checkbox" id="suscriptor_resDaySat" checked="checked" value="sat"/>
					<label for="suscriptor_resDaySun"><%=(String)session.getAttribute("Sunday")%>:</label>
					<input class="suscriptor_setResDays" name="suscriptor_resDaySun" type="checkbox" id="suscriptor_resDaySun" checked="checked" value="sun"/>
				</div>
			</div>
		</div>
		<!-- Restricted Hours -->
		<p style="display:none"><%=(String)session.getAttribute("Restrict")%>:</p>
		<input style="display:none" id="suscriptor_time_restricted" type="checkbox" name="nohours" value="nohours" checked/><!-- <%=(String)session.getAttribute("Norestrict")%><br /> -->
		<div id="suscriptor_div_time_restrict" style="display:none">
			<label for="suscriptor_time_start"><%=(String)session.getAttribute("Strtime")%>:</label> 
			<input type="text" id="suscriptor_time_start" class="ui-state-active ui-corner-all">
			<br />
			<label for="suscriptor_time_end"><%=(String)session.getAttribute("Endtime")%>:</label> 
			<input type="text" id="suscriptor_time_end" class="ui-state-active ui-corner-all" style="margin-left: 9px;">
		</div>
		<br/>
		<div class="centerbutton demo">		
			<button  class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="send_Message_suscriptor" >
				<%=(String) session.getAttribute("Send")%>
			</button>	
			<button  class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="cancel_Message_suscriptor">
				<%=(String) session.getAttribute("Cancel")%>
			</button>
		</div>
	</div>
	<br />
</div>
<div class="demo">
	<div id="suscriptor_Email_Check_Valid_Dialog"  title="<%=(String)session.getAttribute("CheckValidateEmailTitleAlert")%>" style="display:none">
		<%=(String) session.getAttribute("CheckValidateEmailMsgAlert")%>
	</div>	
</div>
<div id="suscriptor_QmarkButton_tw_help_Dialog" style="display:none">
	<%=(String) session.getAttribute("PublicTwitterButton")%>
</div>
<div id="suscriptor_QmarkButton_fb_help_Dialog" style="display:none">
	<%=(String) session.getAttribute("PublicFacebookButton")%>
</div>
<div id="suscriptor_QmarkButton_mail_help_Dialog" style="display:none">
	<%=(String) session.getAttribute("PublicMailButton")%>
</div>
<script type="text/javascript">  
//No mover!!! necesario para el idioma
var aliasText="<%=(String)session.getAttribute("Suscriptor_Table_Alias")%>:";
var serviceText="<%=(String)session.getAttribute("Suscriptor_Table_Service")%>:";
var optInText="<%=(String)session.getAttribute("Suscriptor_Table_Opt-in")%>:";
var deviceText="<%=(String)session.getAttribute("Suscriptor_Table_Device")%>:";
var statusText="<%=(String)session.getAttribute("Status")%>:";
var searchText="<%=(String)session.getAttribute("Search")%>:";
var exportText="<%=(String)session.getAttribute("Export")%>";
var infoEmptyText="<%=(String)session.getAttribute("TableInfoEmpty")%>";
var infoText="<%=(String)session.getAttribute("TableInfo")%>";
var infoFilteredText="<%=(String)session.getAttribute("TableInfoFiltered")%>";
var processingText="<%=(String)session.getAttribute("TableProcessing")%>";
var zeroRecordsText="<%=(String)session.getAttribute("TableZeroRecords")%>";
var SuscriptorTag="<%=(String)session.getAttribute("Suscriptor_Menu_Tag")%>";
var tittleDialog="<%=(String)session.getAttribute("SubscriptorDialogTittle")%>";
var words="<%=(String)session.getAttribute("Words")%>";
var characters="<%=(String)session.getAttribute("Characters")%>";
var validateText="<%=(String)session.getAttribute("ValidateMsg")%>";

$.getScript( "js/suscriptor.js" , function () { 
}); 
</script>	
