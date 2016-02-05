
var servideId; 
var aux;
var info;
var alertsTable;

$(document).ready(function(){
	alertsTable=loadAlertTable();
});

//Funcion que carga la tabla
function loadAlertTable(){
	return $('#alerts_schedules_table').dataTable( {
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
				"aButtons":    [ {"sExtends":"csv","mColumns": [7,2,3,4,5,6],"sFileName": SendTag+".csv"}, 
				                 {"sExtends":"xls","mColumns": [7,2,3,4,5,6],"sFileName": SendTag+".xls"}]
			}]
		},
        "sScrollX": "100%",
		"sScrollY": "380px",
		"bAutoWidth": false,
        "bScrollCollapse": true,
		"bJQueryUI": true,
        "bPaginate": false,
		"bProcessing": true, 
		"bServerSide": true,
		"aoColumnDefs": [
		    { "bVisible": false,  "aTargets": [ 7 ] },
			{"bVisible": false,  "aTargets": [ 0 ]},
	//		{ "asSorting": [ "desc", "asc" , "desc"], "aTargets": [2] },
			{ sWidth: '30%',  "aTargets": [1], sClass:"underline_campaign"},
			{ sWidth: '25%',  "aTargets": [2]},
			{ sWidth: '1%',  "aTargets": [3], sClass: "alignCenter"},
			{ sWidth: '1%',  "aTargets": [4],sClass: "alignCenter"},
			{ sWidth: '10%',  "aTargets": [5]},
			{ sWidth: '15%',  "aTargets": [6]},
			{ sWidth: '30%',  "aTargets": [7]}

		],
		"sAjaxSource": "jsp/alertsSchedulesLoadLogic.jsp",
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

$.getScript("js/jquery.textareaCounter.plugin.js", function(){
   	var options = {
		'maxCharacterSize': -2,
		'originalStyle': 'originalTextareaInfo',
		'warningStyle' : 'warningTextareaInfo',
		'warningNumber': 40
		};
	$('#sendTextarea').textareaCount(options);
});
    
$(document).ready(function(){
	

	
	$( "input:button, button", ".demo" ).button();
	
   	$.post('jsp/alertsListServiceLogic.jsp',function(msg){
   		//	alert(msg.length);
		for(var i=0;i<msg.length;i++){
			$("#alerts_service_load").append('<option value="'+msg[i].id +'" name="'+msg[i].name+'">'+msg[i].name+'</option>');		
		}
   	},"json");
    	
   	$("#alert_wiz").formToWizard({ submitButton: "alertSend" });
   	
   	
	$("#hideform").on('click',function () {
        $('.charleft').remove();
		 $("#tabstrip").data("kendoTabStrip").reload("#alertstab");
	        return false;
	});
   	
//	alert(kendo.culture().name);

   	function startChange() {
   		var startTime = start.value();
   		if (startTime) {
   			startTime = new Date(startTime);
   			end.max(startTime);
   			startTime.setMinutes(startTime.getMinutes() + this.options.interval);
   			end.min(startTime);
   			end.value(startTime);
   		}
   	}

   	$(".defaultText").focus(function(srcc){
   		if ($(this).val() == $(this)[0].title){
   			$(this).removeClass("defaultTextActive");
   			$(this).val("");
   		}
   	});
        	    
   	$(".defaultText").blur(function(){
   		if ($(this).val() == ""){
   			$(this).addClass("defaultTextActive");
   			$(this).val($(this)[0].title);
   		}
   	});
        	    
   	$(".defaultText").blur();       	
   	$('#start').timepicker({
   		hour: 09,
   		minute: 00
   	});
    $('#end').timepicker({
   		hour: 18,
   		minute: 00
    });
    $('#timepicker').datetimepicker();
});
	
$('input[name=newmsgradio]:radio').click(function () {
	var value = $(this).val();
	if(value==1) {
		$("#newmsgtmp").hide("slow");		    
		$("#newmsgtxt").show("slow");
        	// code to be executed if condition is true
	}else if(value==2) {
		$("#newmsgtxt").hide("slow");
		$("#newmsgtmp").show("slow");
        	// code to be executed if condition is false
	}else{
		$("#newmsgtxt").hide("slow");
		$("#newmsgtmp").hide("slow");	
	}
});

$("#personalize").click(function () {
	if($(this).is(":checked")) // "this" refers to the element that fired the event
	{
		$("#personalized_file").show("slow");
    } else {
    	$("#personalized_file").hide("slow");	
    }
});

$("#nowchk").click(function () {
	if($(this).is(":checked")) // "this" refers to the element that fired the event
	{
		$(".date_schedule").hide("slow");
	} else {
		$(".date_schedule").show("slow");
	}
});	

$("#restricted").click(function () {
	if($(this).is(":checked")) // "this" refers to the element that fired the event
	{
		$("#time_restrict").hide("slow");
	} else {
		$("#time_restrict").show("slow");	
	}	
});	

	
$("#add_link_alert").click(function () {
	$("#submenu_alert").hide("slow");
	$("#alets_table_div").hide("slow");
	$(".alertform").show("slow");
    });

    /*
    $("#newmsg_link").click(function () {
    	$("#newmsg").show("slow");
    	$("#fromtmp").hide("slow");
    	
    });
    $("#fromtmp_link").click(function () {
    	$("#fromtmp").show("slow");
    	$("#newmsg").hide("slow");
    });
    */
    
    
/*
	$("#all_subs").click(function () {
	    if($(this).is(":checked")) // "this" refers to the element that fired the event
	    {
	    	$("#no_all").hide("slow");
	    } else {
	    	$("#no_all").show("slow");	
	   	}
		});
*/
	$("#noRestrictedDays").click(function () {
	    if($(this).is(":checked")) // "this" refers to the element that fired the event
	    {
	    	$("#setRestrictedDays").show("slow");	
	    } else {
	    	$("#setRestrictedDays").hide("slow");
	   	}
		});
    
    
	
	$('#dis_list').bind('click change blur focus',function(){ 
	    var value = $(this).val();
	    if(value==1) {
		 	$("#individual_list").hide("slow");		    		    
		 	$("#group_list").hide("slow");
		 	$("#service_list").show("slow");
		 	
	    }
	    else if(value==2) {
		 	$("#service_list").hide("slow");
		 	$("#individual_list").hide("slow");		    		    
		 	$("#group_list").show("slow");
	    }
	    else if(value==3) {
		 	$("#service_list").hide("slow");
		 	$("#group_list").hide("slow");
		 	$("#individual_list").show("slow");		    		    
		 	
	    }
	    else{
		 	$("#service_list").hide("slow");
		 	$("#individual_list").hide("slow");		    		    
		 	$("#group_list").hide("slow");
	    }
	});
	
$('#alertSend').click(function(){
	var isUrl="";
	var text="";
	var when ="";
	var from="";
	var to="";
	var restrictedDays="";
	var postTwitter="0";
	var postFacebook="0";
	var postEmail="0";

	if($("#alertTextSendCk").is(":checked")){
		text=$("#sendTextarea").val();
		isUrl="0";
	}else if($("#alertUrlSendCk").is(":checked")){
		text=$( '#sendUrl' ).val();
		isUrl="1";
	}
			
	if(!($('#nowchk').is(':checked'))){
		when =$("#timepicker").val();
	}	

	if(!($('#restricted').is(':checked'))){
		from=$("#start").val();
		to=$("#end").val();
	}	

	if ($('#noRestrictedDays').is(':checked')){
		restrictedDays = $('.setResDays').map(function(i,n) {
			if($(this).is(':checked')){
				return $(n).val();
			}
		}).get().join(',');
	}

	if ($('#alert_post_twitter').is(':checked')){
		postTwitter="1";
	}

	if ($('#alert_post_facebook').is(':checked')){
		postFacebook="1";
	}

	if ($('#alert_post_email').is(':checked')){
		postEmail="1";
	}
/*	$('#alertSend').hide();
	$('#hideform').hide();
	*/
	$.post('jsp/checkEmailIsValidLogic.jsp',function(msg){
	//	alert(msg.isValid);
	//	alert(msg.result);
		if((msg.result === 'OK') && (msg.isValid === 'true')){
				$('#alertSend').hide();
				$('#hideform').hide();
				$.post('jsp/broadcastSendLogic.jsp',{
					isUrl:isUrl,
					text:text,
					service:($("#alerts_service_load").val()+""),
					subject:($("#alert_subject_msg").val()+""),
					when:when,
					from:from,
					to:to,
					restrictedDays:restrictedDays,
					postTwitter:postTwitter,
					postFacebook:postFacebook,
					sendEmails:postEmail
					},function(res){
						alertsTable.fnFilter('');
						refreshCredits();
						$("#tabstrip").data("kendoTabStrip").reload("#alertstab");
				},"json");
		}else if((msg.result === 'OK') && (msg.isValid === 'false')){
			$( "#alertEmailCheckValidDialog" ).dialog( "open" );
		}else{
			alert("NO");
		}
	},"json");
	return false;
});
	
$( "#dialog_alerts_text" ).dialog( "destroy" );

$('#alerts_schedules_table tbody tr td:nth-child(1)').live('click', function (){
	$( '.alert_text_popout' ).remove();
	var aPos = alertsTable.fnGetPosition(this);
	var aData = alertsTable.dataTable().fnGetData(aPos[0]);
	$( "#dialog_alerts_text" ).append('<p class="alert_text_popout">'+aData[7]+'</p');
	$( "#dialog_alerts_text" ).dialog( "open" );
	$('.ui-dialog :button').blur();
});

$( "#dialog_alerts_text" ).dialog({
	autoOpen: false,
	height: 300,
	width: 370,
	modal: true,
	buttons: {
		"Ok": function() {
			$( this ).dialog( "close" );
		}	
	},
	close: function() {
	allFields.val( "" ).removeClass( "ui-state-error" );
	},beforeClose: function() { 
		serviceTable.fnFilter('');
		$( '.alert_text_popout' ).remove();
	}
});

//validate email dialog
$( "#alertEmailCheckValidDialog" ).dialog( "destroy" );

var buttonOpts = {};
buttonOpts[validateText] = function() {
	$.post('jsp/validateEmailLogic.jsp',function(msg){
		if(msg.result === 'OK'){
			jAlert(msg.value, notification);
			$( '#alertEmailCheckValidDialog' ).dialog( "close" );
		}else{
			jAlert(msg.value, notification);
		}	
	},"json");
};		

buttonOpts[cancel] = function() {
	$( '#alertEmailCheckValidDialog' ).dialog( "close" );
};

$("#alertEmailCheckValidDialog").dialog({
	autoOpen: false,
	height: 300,
	width: 450,
	modal: true,
	buttons: buttonOpts,close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	},beforeClose: function() { 
	}
});

//refresh table
$( '#alerts_table_refresh_button').click(function(){
	alertsTable.fnFilter('');
	refreshCredits();
});

//Help

$("#Qmark_alerts").click(function () {
	$("#newalert_help").dialog('open');
});

$("#Qmark_refresh_alert").click(function () {
	$("#alert_refresh_help").dialog('open');
});

//refresh Credits Box
function refreshCredits(){
	$.post('jsp/creditReviewLogic.jsp',function(msg){
		$('#credits_number').remove();
		$("#credits_aviable_main").before('<span id="credits_number">'+msg.credits+'</span>');
	},"json");
}