<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- NO MOVER DESDE AKI ******* -->

<script type="text/javascript">
<% String str1=(String)session.getAttribute("Step"); %>
var varsteps="<%=str1%>"; 
<% String str2=(String)session.getAttribute("Next"); %>
var next="<%=str2%>";
<% String str3=(String)session.getAttribute("Back"); %>
var back="<%=str3%>";
var noSubject="<%=(String)session.getAttribute("NoSubject")%>";
var noText="<%=(String)session.getAttribute("NoText")%>";
var noService="<%=(String)session.getAttribute("NoService")%>";
var noUrl="<%=(String)session.getAttribute("NoUrl")%>";
var notificationText="<%=(String)session.getAttribute("Notification")%>";
var notification="<%=(String)session.getAttribute("Notification")%>";
var tableRefreshRate="<%=(String)session.getAttribute("tablesRefreshTime")%>";
var help="<%=(String)session.getAttribute("Help")%>";
(function($) {
    $.fn.formToWizard = function(options) {
        options = $.extend({  
            submitButton: "" 
        }, options); 
        
        var element = this;

        var steps = $(element).find("fieldset");
        var count = steps.size();
        var submmitButtonName = "#" + options.submitButton;
        $(submmitButtonName).hide();

        // 2
        $(element).before("<ul id='steps'></ul>");

        steps.each(function(i) {
            $(this).wrap("<div id='step" + i + "'></div>");
            $(this).append("<p id='step" + i + "commands'></p>");

            // 2
            var name = $(this).find("legend").html();
            $("#steps").append("<li id='stepDesc" + i + "'>"+ varsteps +"  "+(i + 1) + "<span>" + name + "</span></li>");

            if (i == 0) {
                createNextButton(i);
                selectStep(i);
            }
            else if (i == count - 1) {
                $("#step" + i).hide();
                createPrevButton(i);
            }
            else {
                $("#step" + i).hide();
                createPrevButton(i);
                createNextButton(i);
            }
        });

        function createPrevButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<div class='demo'><a href='#' id='" + stepName + "Prev' class='prev'>"+ back +"</a></div>");

            $("#" + stepName + "Prev").bind("click", function(e) {
                $("#" + stepName).hide();
                $("#step" + (i - 1)).show();
                $(submmitButtonName).hide();
                selectStep(i - 1);
            });
        	$( "a.prev", ".demo" ).button();
            }

        function createNextButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<div class='demo'><a href='#' id='" + stepName + "Next' class='next'>"+ next +"</a></div>");

            $("#" + stepName + "Next").bind("click", function(e) {
				if(i === 1 && ($("#alert_subject_msg").val() !="") && ($("#sendTextarea").val() !="" || $( '#sendUrl' ).val()!="")){
					$("#" + stepName).hide();
	                $("#step" + (i + 1)).show();
	                if (i + 2 == count)
	                    $(submmitButtonName).show();
	                selectStep(i + 1);
				}else if(i === 0 && ($("#alerts_service_load").val()!=null)){
					$("#alert_subject_msg").val($("#alerts_service_load option:selected").text() +" "+notificationText);
					$("#" + stepName).hide();
	                $("#step" + (i + 1)).show();
	                if (i + 2 == count)
	                    $(submmitButtonName).show();
	                selectStep(i + 1);
				}else if($("#alerts_service_load").val() === null){
					jAlert(noService, notification);
				}else if($("#alert_subject_msg").val() ===""){
					jAlert(noSubject, notification);
				}else if($("#sendTextarea").val() === "" && $("#alertTextSendCk").is(":checked")){
					jAlert(noText, notification);
				}else if($( '#sendUrl' ).val() === "" && $("#alertUrlSendCk").is(":checked")){
					jAlert(noUrl, notification);
				}
            });
        	$('#sendTextarea').focus();
			
        	$( "a.next", ".demo" ).button();
        	

            }

        function selectStep(i) {
            $("#steps li").removeClass("current");
            $("#stepDesc" + i).addClass("current");
        }

    };


	    
})(jQuery); 

$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$( "#newalert_help" ).dialog({
		autoOpen: false,
		height: 320,
		width: 500,
		title: help,
		modal: true,
		buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );

	$( "#alert_refresh_help" ).dialog({
		autoOpen: false,
		height: 300,
		width: 500,
		title: help,
		modal: true,
		buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

$( '#start' ).val("09:00");
$( '#end' ).val("18:00");

//Refresh table without button
function refreshAlertTable(){
	alertsTable.fnFilter('');
	setTimeout ( "refreshAlertTable()" , tableRefreshRate);
	return false;
}
//setTimeout ( "refreshAlertTable()" , tableRefreshRate);

</script>


<!-- ************* HASTA AKI -->


	<div id="submenu_alert" class="demo">
	<input type="button" id="add_link_alert"  style="float:left" class="ui-state-default ui-corner-all" value="<%=(String)session.getAttribute("Addalert")%>" />
	<div id="Qmark_alerts">
		<img src="images/dialog-question.png" width="18px"/>
	</div>
	<div id="Qmark_refresh_alert" style="float:right">
		<img src="images/dialog-question.png" width="18px"/>
	</div>
	<input type="button" id="alerts_table_refresh_button"  style="float:right" class="ui-state-default ui-corner-all" value="<%=(String)session.getAttribute("Refresh")%>" />
	
	<a id="export_link" href="#"><%=(String)session.getAttribute("Export")%></a>
	</div>
	<div id="newalert_help" style="display:none">
		<%=(String)session.getAttribute("Newalerthelp")%>
	</div>
	<div id="alert_refresh_help" style="display:none">
		<%=(String)session.getAttribute("ReloadTable")%>
	</div>
	<div id="alert_form">

		<div id="mainw" class="alertform" style="display: none;">
			<div id="headerw"></div>
			<form id="alert_wiz" action="" class="demo">
					<fieldset>
					<legend><%=(String)session.getAttribute("Selcrecp")%></legend>
					<div id="no_all" class="text ui-widget-content ui-corner-all" style="padding: 0.8em;">
						<!-- <label><%=(String)session.getAttribute("Dislist")%>:</label> 
						<select id="dis_list" class="text ui-widget-content ui-state-active ui-corner-all">
							<option value="0"><%=(String)session.getAttribute("Selectone")%></option>
							<option value="1"><%=(String)session.getAttribute("Services")%></option>
							 <option value="2"><%=(String)session.getAttribute("Groups")%></option>
							 <option value="3"><%=(String)session.getAttribute("Individual")%></option> 
						</select>
						-->
						<div id="service_list">
							<SELECT id=alerts_service_load MULTIPLE SIZE=3 class="text ui-state-active ui-corner-all">
							</SELECT>
						</div>
						<div id="group_list" class="text ui-widget-content ui-corner-all" style="display:none">
							<SELECT MULTIPLE SIZE=5>
									 <OPTION VALUE="o1">Option 1
									 <OPTION VALUE="o2">Option 2
									 <OPTION VALUE="o3">Option 3
									 <OPTION VALUE="o4">Option 4
									 <OPTION VALUE="o5">Option 5
									 <OPTION VALUE="o6">Option 6
							</SELECT>
						</div>
						<div id="individual_list" class="text ui-widget-content ui-corner-all" style="display:none">
							<SELECT MULTIPLE SIZE=3>
									 <OPTION VALUE="o1">Option 1
									 <OPTION VALUE="o2">Option 2
									 <OPTION VALUE="o3">Option 3
							</SELECT>
						</div>
				</div>
				</fieldset>
				<fieldset>
					<legend><%=(String)session.getAttribute("Setmsg")%></legend>
					<p>
						<span id="newmsg_link" ><%=(String)session.getAttribute("Newmsg")%></span>
					</p>
					<p>
						<a style="display:none "href="#" id="fromtmp_link"><%=(String)session.getAttribute("Fromtmp")%></a>
					</p>
					<div id="newmsg">
					<!-- <%=(String)session.getAttribute("Canwrite")%>  -->
					<br /><br />
						<input id=alertTextSendCk type="radio" name="newmsgradio" value="1" checked/><%=(String)session.getAttribute("Text")%>
						<input id=alertUrlSendCk type="radio" name="newmsgradio" value="2" /><%=(String)session.getAttribute("Htmlurl")%>
						<br />
						<label for="text"><%=(String)session.getAttribute("Subject")%>:</label> 
						<input id="alert_subject_msg" type="text" class="text ui-widget-content ui-corner-all" 
						title=" <%=(String)session.getAttribute("Subjectmsg")%> "/><br />

							
							<div id="newmsgtxt" style="display">
							<label for="text"><%=(String)session.getAttribute("Text")%>:</label> 
							<TEXTAREA id="sendTextarea" style="margin-left: 4px;" class="text ui-widget-content ui-corner-all" NAME="alert_text" COLS='27' ROWS='5'></TEXTAREA>	 
							<input id="alert_post_twitter" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" /><%=(String)session.getAttribute("PostTwitter")%>
							<input id="alert_post_facebook" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" /><%=(String)session.getAttribute("PostFacebook")%>
							<input id="alert_post_email" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" /><%=(String)session.getAttribute("PostEmail")%><br />
							</div>
							<div id="newmsgtmp" style="display:none">
							<label for="sendUrl"><%=(String)session.getAttribute("Htmlurl")%>: </label> 
							<input id="sendUrl" type="text" class="text ui-widget-content ui-corner-all"/>
							
							</div>
					</div>
					<div id="fromtmp" class="ui-corner-all">
						<%=(String)session.getAttribute("Svdtmp")%><label for="Name"><%=(String)session.getAttribute("Txttmp")%></label> 
						<select
							id="text_tmp" class="ui-state-active ui-corner-all">
							<option>template 1</option>
							<option>template 2</option>
							<option>template 3</option>
						</select> 
						<label for="Name"><%=(String)session.getAttribute("Htmltmp")%>:</label> 
						<select id="text_tmp" class="ui-state-active ui-corner-all">
							<option>template 1</option>
							<option>template 2</option>
							<option>template 3</option>
						</select>
					</div>
				</fieldset>
				<fieldset>
					<legend><%=(String)session.getAttribute("Sendalert")%></legend>
					<p>
					<%=(String)session.getAttribute("Sendalertmsg")%>
					</p>

					<input id="nowchk" type="checkbox" name="starton" value="starton" class="text ui-widget-content ui-corner-all" checked/><%=(String)session.getAttribute("Now")%><br />
					<div class="date_schedule" style="display:none">
							<%=(String)session.getAttribute("Date")%>:<input type="text" id="timepicker" class="ui-state-active ui-corner-all">
							<br>
							<div id="restrictedinline">
					<label for="noRestrictedDays"><%=(String)session.getAttribute("RestrictedDays")%></label>
					<input name="noRestrictedDays" type="checkbox" id="noRestrictedDays" />
						<div id="setRestrictedDays" style="display:none">
							<label for="resDayMon"><%=(String)session.getAttribute("Monday")%>:</label>
							<input class="setResDays" name="resDayMon" type="checkbox" id="resDayMon"  value="mon" />
											
							<label for="resDayTue"><%=(String)session.getAttribute("Tuesday")%>:</label>
							<input class="setResDays" name="resDayTue" type="checkbox" id="resDayTue"  value="tue"/>
							
							<label for="resDayWed"><%=(String)session.getAttribute("Wednesday")%>:</label>
							<input class="setResDays" name="resDayWed" type="checkbox" id="resDayWed"  value="wed"/>
							
							<label for="resDayThu"><%=(String)session.getAttribute("Thursday")%>:</label>
							<input class="setResDays" name="resDayThu" type="checkbox" id="resDayThu"  value="thu"/>
							
							<label for="resDayFri"><%=(String)session.getAttribute("Friday")%>:</label>
							<input class="setResDays" name="resDayFri" type="checkbox" id="resDayFri"  value="fri"/>
						
							<label for="resDaySat"><%=(String)session.getAttribute("Saturday")%>:</label>
							<input class="setResDays" name="resDaySat" type="checkbox" id="resDaySat" checked="checked" value="sat"/>
						
							<label for="resDaySun"><%=(String)session.getAttribute("Sunday")%>:</label>
							<input class="setResDays" name="resDaySun" type="checkbox" id="resDaySun" checked="checked" value="sun"/>
						</div>
						</div>
					</div>
					<p><%=(String)session.getAttribute("Restrict")%>:</p>
					<input id="restricted" type="checkbox" name="nohours" value="nohours" checked/><%=(String)session.getAttribute("Norestrict")%><br />
					<div id="time_restrict" style="display:none">
						<label for="start"><%=(String)session.getAttribute("Strtime")%>:</label> 
						<input type="text" id="start" class="ui-state-active ui-corner-all">
						<br />
						<label for="end"><%=(String)session.getAttribute("Endtime")%>:</label> 
						<input type="text" id="end" class="ui-state-active ui-corner-all" style="margin-left: 9px;">
					</div>
				</fieldset>
				<br />
				<div class="centerbutton demo">
					
					<button id="alertSend" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
						<%=(String)session.getAttribute("Send")%>
					</button> 
					<button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="hideform">
						<%=(String)session.getAttribute("Cancel")%>
					</button> 

				</div>
			</form>
				
		</div>
<div id=alets_table_div>		
		<table class="display" id="alerts_schedules_table">
			<thead>
				<tr>
					<th><%=(String)session.getAttribute("Id")%></th>
					<th ><%=(String)session.getAttribute("Text")%></th>
					<th ><%=(String)session.getAttribute("Begin_Date")%></th>
					<th ><%=(String)session.getAttribute("Expected_Messages")%></th>
					<th ><%=(String)session.getAttribute("Delivered")%></th>
					<th><%=(String)session.getAttribute("Status")%></th>
					<th><%=(String)session.getAttribute("Suscriptor_Table_Service")%></th>
					<th><%=(String)session.getAttribute("Text")%></th>
				</tr>
			</thead>
			<tbody> 
				<tr>
					<td colspan="5" class="dataTables_empty">Loading data from server</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="demo">
		<div id="dialog_alerts_text" title=<%=(String)session.getAttribute("Text") %>>
		</div>
		<br>
	</div>
	
	<div class="demo">
		<div id="alertEmailCheckValidDialog"  title="<%=(String)session.getAttribute("CheckValidateEmailTitleAlert")%>" style="display:none">
			<%=(String) session.getAttribute("CheckValidateEmailMsgAlert")%>
		</div>	
	</div>
</div>
	
<script type="text/javascript">  
//No mover!!! necesario para el idioma
var searchText="<%=(String)session.getAttribute("Search")%>:";
var exportText="<%=(String)session.getAttribute("Export")%>";
var infoEmptyText="<%=(String)session.getAttribute("TableInfoEmpty")%>";
var infoText="<%=(String)session.getAttribute("TableInfo")%>";
var infoFilteredText="<%=(String)session.getAttribute("TableInfoFiltered")%>";
var processingText="<%=(String)session.getAttribute("TableProcessing")%>";
var zeroRecordsText="<%=(String)session.getAttribute("TableZeroRecords")%>";
var validateText="<%=(String)session.getAttribute("ValidateMsg")%>";
var CancelText="<%=(String)session.getAttribute("Cancel")%>";
var words="<%=(String)session.getAttribute("Words")%>";
var characters="<%=(String)session.getAttribute("Characters")%>";
var SendTag="<%=(String)session.getAttribute("Send")%>";

$.getScript( "js/alerts.js" , function () { 
}); 
</script>		