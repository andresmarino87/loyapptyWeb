/*
 * 
 * Autor: Andr�s Mari�o
 * 
 */

var suscriptorTable;
var editType;
var editId;
var editName;
var editMobile;
var editEmail;
//Se carga la tabla inicialmente

$(document).ready(function() {
	suscriptorTable=loadSuscriptorTable();
	$( "input:submit,input:button, button", ".demo" , ".service_add_random_private_code" ).button();	
});

//Funcion que carga la tabla
function loadSuscriptorTable(){
	return $('#suscriptor_table').dataTable( {
		"oLanguage": {
			"sSearch": searchText,
			"sInfoEmpty": infoEmptyText,
			"sInfo": infoText,
			"sInfoFiltered": infoFilteredText,
			"sProcessing": processingText,
			"sZeroRecords": zeroRecordsText
	      },
		"sDom": '<"H"Tfr>t<"F"ip>',
		"oTableTools": {
			"aButtons": [
			{
				"sExtends":    "collection",
				"sButtonText": exportText,
				"aButtons":    [ {"sExtends":"csv","mColumns": "visible","sFileName": SuscriptorTag+".csv"}, 
				                 {"sExtends":"xls","mColumns": "visible","sFileName": SuscriptorTag+".xls"},
				                 {"sExtends":"pdf","mColumns": "visible","sFileName": SuscriptorTag+".pdf"} ]
				}
			]
		},
		"sScrollX": "100%",
		"sScrollY": "250px",
		"bAutoWidth": false,
		"bJQueryUI": true,
		"bPaginate": false,
		"bProcessing": true,
		"bServerSide": true,
		"aoColumnDefs": [
		    {"fnRender": function ( oObj ) {
		   		return '<button class=\"qq-upload-button\" name=\"userId\">'+SendText+'</button> ';
		    },"aTargets": [ 10 ]},               
			{ "bVisible": false,  "aTargets": [ 0 ] },
			{ "bVisible": false,  "aTargets": [ 2 ] },
			{ "bVisible": false,  "aTargets": [ 4 ] },
			{ "bVisible": false,  "aTargets": [ 9 ] },
			{ sWidth: '15%',  "aTargets": [1], sClass:"underline_campaign"},
			{ sWidth: '15%',  "aTargets": [3]},	
			{ sWidth: '15%',  "aTargets": [5]},	
			{ sWidth: '30%',  "aTargets": [6]},	
			{ sWidth: '10%',  "aTargets": [7]},	
			{ sWidth: '10%',  "aTargets": [8]},	
			{ sWidth: '10%',  "aTargets": [10]},	
			],
		"sAjaxSource": "jsp/suscriptorLoadLogic.jsp",
		"fnServerData": function ( sSource, aoData , fnCallback) {
				$.ajax( {
				"dataType": 'json', 
				"type": "POST", 
				"url": sSource, 
				"data": aoData, 
				"success": fnCallback
			});
		}
	});
};

$('#suscriptor_table tbody tr td:nth-child(1)').live('click', function (){
	var aPos = suscriptorTable.fnGetPosition(this);
	var aData = suscriptorTable.dataTable().fnGetData(aPos[0]);
	$.post('jsp/suscriptorDetailsLogic.jsp',{userId:aData[0]},function(msg){	
		if(msg.result == "OK"){
			var i=2;
			var j=0;
			delete msg['result'];			
			$( '#suscriptor_details_tables_column_0' ).append("<p class='profile_Details_Parameters'>"+aliasText+"<br/><input class='text ui-widget-content ui-corner-all' value='"+aData[1]+"'  readonly='readonly'/></p>");
			$( '#suscriptor_details_tables_column_1' ).append("<p class='profile_Details_Parameters'>"+serviceText+"<br/><input class='text ui-widget-content ui-corner-all' value='"+aData[2]+"'  readonly='readonly'/></p>");
			$( '#suscriptor_details_tables_column_2' ).append("<p class='profile_Details_Parameters'>"+optInText+"<br/><input class='text ui-widget-content ui-corner-all' value='"+aData[3]+"'  readonly='readonly'/></p>");
			$( '#suscriptor_details_tables_column_0' ).append("<p class='profile_Details_Parameters'>"+deviceText+"<br/><input class='text ui-widget-content ui-corner-all' value='"+aData[4]+"'  readonly='readonly'/></p>");
			$( '#suscriptor_details_tables_column_1' ).append("<p class='profile_Details_Parameters'>"+statusText+"<br/><input class='text ui-widget-content ui-corner-all' value='"+aData[5]+"'  readonly='readonly'/></p>");
		
			for(var key in msg){					 
				if (msg.hasOwnProperty(key)) {
					j=i%3;
					i++;
					$( '#suscriptor_details_tables_column_'+j ).append("<p class='profile_Details_Parameters'>"+key+":<br/><input class='text ui-widget-content ui-corner-all' value='"+msg[key]+"'  readonly='readonly'/></p>");
				}
			}
		}
	},"json");

	$( '#suscriptor_details_dialog' ).dialog( 'open' ); 
});

$( '#Qmark_Request_Sub_Parameter' ).click(function(){
	$( '#suscriptor_details_dialog' ).dialog( 'open' ); 
});

$( "#suscriptor_details_dialog" ).dialog({
	autoOpen: false,
	height: 450,
	width: 650,
	title: tittleDialog,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	},beforeClose: function() { 
		$( '.profile_Details_Parameters' ).empty();
	}
});

//Send Message to User

$('#suscriptor_table tbody tr td:nth-child(7)').live('click', function (){
	var aPos = suscriptorTable.fnGetPosition(this);
	var aData = suscriptorTable.dataTable().fnGetData(aPos[0]);
	$( '#send_Message_suscriptor' ).attr('user_id',aData[0]);
	$( '#send_Message_suscriptor' ).attr('service_id',aData[9]);
	$( '#suscriptor_main' ).hide('slow');
	$( '#form_Send_suscriptor' ).show('slow');
});

$( '#send_Message_suscriptor' ).click(function(){
	
});

$( '#cancel_Message_suscriptor' ).click(function(){
	restoreMainSuscriptor();
});

//Restore Main Table After Send a message

function restoreMainSuscriptor(){
	$( '#suscriptor_send_Textarea' ).val('');
	$( '#suscriptor_post_twitter' ).attr('checked',false);
	$( '#suscriptor_post_facebook' ).attr('checked',false);
	$( '#suscriptor_post_email' ).attr('checked',false);
	$( '#suscriptor_Now_Check' ).attr('checked',true);
	$( '#suscriptor_Timepicker' ).val('');
	$( '#suscriptor_No_Restricted_Days' ).attr('checked',false);
	$( '#suscriptor_resDayMon' ).attr('checked',false);
	$( '#suscriptor_resDayTue' ).attr('checked',false);
	$( '#suscriptor_resDayWed' ).attr('checked',false);
	$( '#suscriptor_resDayThu' ).attr('checked',false);
	$( '#suscriptor_resDayFri' ).attr('checked',false);
	$( '#suscriptor_resDaySat' ).attr('checked',true);
	$( '#suscriptor_resDaySun' ).attr('checked',true);
	$( '#suscriptor_Set_Restricted_Days' ).hide();
	$( '.suscriptor_date_schedule' ).hide();
	$( '#suscriptor_time_restricted' ).attr('checked',true);
	$( '#suscriptor_time_start' ).val('');
	$( '#suscriptor_time_end' ).val('');
	$( '#suscriptor_div_time_restrict' ).hide();
	$( '#send_Message_suscriptor' ).attr('user_id','');
	$( '#send_Message_suscriptor' ).attr('service_id','');
	$( '#form_Send_suscriptor' ).hide('slow');
	$( '#suscriptor_main' ).show('slow');
}

//time selectors
$('#suscriptor_Timepicker').datetimepicker();

$("#suscriptor_Now_Check").click(function () {
	if($(this).is(":checked")) // "this" refers to the element that fired the event
	{
		$(".suscriptor_date_schedule").hide("slow");
	} else {
		$(".suscriptor_date_schedule").show("slow");
	}
});	

$("#suscriptor_No_Restricted_Days").click(function () {
    if($(this).is(":checked")) // "this" refers to the element that fired the event
    {
    	$("#suscriptor_Set_Restricted_Days").show("slow");	
    } else {
    	$("#suscriptor_Set_Restricted_Days").hide("slow");
   	}
});

$("#suscriptor_time_restricted").click(function () {
	if($(this).is(":checked")) // "this" refers to the element that fired the event
	{
		$("#suscriptor_div_time_restrict").hide("slow");
	} else {
		$("#suscriptor_div_time_restrict").show("slow");	
	}	
});

$('#suscriptor_time_start').timepicker({
		hour: 09,
		minute: 00
	});
$('#suscriptor_time_end').timepicker({
		hour: 18,
		minute: 00
});

//text Area counter
$.getScript("js/jquery.textareaCounter.plugin.js", function(){
   	var options = {
		'maxCharacterSize': -2,
		'originalStyle': 'originalTextareaInfo',
		'warningStyle' : 'warningTextareaInfo',
		'warningNumber': 40
		};
	$('#suscriptor_send_Textarea').textareaCount(options);
}); 

//send msg to service
$('#send_Message_suscriptor').click(function(){
	var isUrl="0";
	var text=$("#suscriptor_send_Textarea").val();
	var when ="";
	var from="";
	var to="";
	var restrictedDays="";
	var postTwitter="0";
	var postFacebook="0";
	var postEmail="0";

	if(!($('#suscriptor_Now_Check').is(':checked'))){
		when =$("#suscriptor_Timepicker").val();
	}	

	if(!($('#suscriptor_time_restricted').is(':checked'))){
		from=$("#suscriptor_time_start").val();
		to=$("#suscriptor_time_end").val();
	}	
	
	if ($('#suscriptor_No_Restricted_Days').is(':checked')){
		restrictedDays = $('.suscriptor_setResDays').map(function(i,n) {
			if($(this).is(':checked')){
				return $(n).val();
			}
		}).get().join(',');
	}
	
	if ($('#suscriptor_post_twitter').is(':checked')){
		postTwitter="1";
	}

	if ($('#suscriptor_post_facebook').is(':checked')){
		postFacebook="1";
	}

	if ($('#suscriptor_post_email').is(':checked')){
		postEmail="1";
	}

	$.post('jsp/checkEmailIsValidLogic.jsp',function(msg){
		if((msg.result === 'OK') && (msg.isValid === 'true')){
				$.post('jsp/broadcastSendLogic.jsp',{
					isUrl:isUrl,
					text:text,
					user:(($("#send_Message_suscriptor").attr('user_id')).toString()),
					service:(($("#send_Message_suscriptor").attr('service_id')).toString()),
					when:when,
					from:from,
					to:to,
					restrictedDays:restrictedDays,
					postTwitter:postTwitter,
					postFacebook:postFacebook,
					sendEmails:postEmail
					},function(res){
						if(res.result === "OK")
							refreshCredits('low');
						else if(res.result === "noCredits"){
							refreshCredits('insufficient');
						}
						restoreMainSuscriptor();
				},"json");
		}else if((msg.result === 'OK') && (msg.isValid === 'false')){
			$( "#suscriptor_Email_Check_Valid_Dialog" ).dialog( "open" );
		}else{
		}
	},"json");
	return false;
});

//Validate email

//validate email dialog
$( "#suscriptor_Email_Check_Valid_Dialog" ).dialog( "destroy" );

var buttonOpts = {};
buttonOpts[validateText] = function() {
	$.post('jsp/validateEmailLogic.jsp',function(msg){
		if(msg.result === 'OK'){
			$( '#validateEmailProfileButton' ).hide();
			$( '#QmarkprofileValidateEmail' ).hide();
			$( '#profile_Email_input' ).attr("readonly","readonly");
			jAlert(msg.value, notification);
			$( '#suscriptor_Email_Check_Valid_Dialog' ).dialog( "close" );
		}else{
			jAlert(msg.value, notification);
		}	
	},"json");
};		

buttonOpts[cancel] = function() {
	$( '#suscriptor_Email_Check_Valid_Dialog' ).dialog( "close" );
};

$("#suscriptor_Email_Check_Valid_Dialog").dialog({
	autoOpen: false,
	height: 300,
	width: 450,
	modal: true,
	buttons: buttonOpts,close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	},beforeClose: function() { 
	}
});

$("#newgroup_link").click(
	function() {
		$("#suscriptor_main").hide("slow");
		$("#submenu_subs").hide("slow");
		$("#form_group").show("slow");
		$("#hideform_group").click(
		function() {
			$("#form_group").hide("slow");
			$("#submenu_subs").show("slow");
			$("#suscriptor_main").show("slow");
			$(':input', '#form_group').not(':button, :submit, :reset, :hidden')
			.val('').removeAttr('checked').removeAttr('selected');
	});
});


$("#suscriptor_QmarkButton_tw").click(function () {
	$("#service_QmarkButton_tw_help_Dialog").dialog('open');
	});

$("#suscriptor_QmarkButton_fb").click(function () {
	$("#service_QmarkButton_fb_help_Dialog").dialog('open');
	});

$("#suscriptor_QmarkButton_mail").click(function () {
	$("#service_QmarkButton_mail_help_Dialog").dialog('open');
	});

$( "#suscriptor_QmarkButton_tw_help_Dialog" ).dialog({
	autoOpen: false,
	height: 320,
	width: 550,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});

$( "#suscriptor_QmarkButton_fb_help_Dialog" ).dialog({
	autoOpen: false,
	height: 320,
	width: 550,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});

$( "#suscriptor_QmarkButton_mail_help_Dialog" ).dialog({
	autoOpen: false,
	height: 320,
	width: 550,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});