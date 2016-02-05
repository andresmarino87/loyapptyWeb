/*
 * 
 * Autor: Andrés Mariño
 * 
 */

//Cargo la tabla
var servideId;
var aux;
var serviceTable;
var codesCount=1;
var codesEditCount=1;

$(document).ready(function() {
	serviceTable=loadServiceTable();
	$( "input:submit,input:button, button", ".demo" , ".service_add_random_private_code" ).button();	
});

//Funcion que carga la tabla
function loadServiceTable(){
	return $('#service_table').dataTable( {
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
				"aButtons":    [ {"sExtends":"csv","mColumns": "visible","sFileName": "Loyappties.csv"}, 
				                 {"sExtends":"xls","mColumns": "visible","sFileName": "Loyappties.xls"},
				                 {"sExtends":"pdf","mColumns": "visible","sFileName": "Loyappties.pdf"}],
			}]
		},
        "sScrollX": "100%",
		"sScrollY": "450px",
        "bPaginate": false,
        "bScrollCollapse": true,
		"bAutoWidth": false,
		"bJQueryUI": true,
		"bProcessing": true, 
		"bServerSide": true,
		"aoColumnDefs": [
		    {"fnRender": function ( oObj ) {
		    	return '<button class=\"qq-upload-button\" name=\"userId\">'+SendText+'</button> ';
		    },"aTargets": [ 7 ]},		                 
		    { "bVisible": false,  "aTargets": [ 0 ] },
		    { "bVisible": false,  "aTargets": [ 2 ] },
		    { "bVisible": false,  "aTargets": [ 3 ] },
		    { "bVisible": false,  "aTargets": [ 4 ] },
		    { "bVisible": false,  "aTargets": [ 5 ] },
			{ sWidth: '20%',  "aTargets": [1], sClass:"underline_campaign"},
			{ sWidth: '20%',  "aTargets": [2]},		
			{ sWidth: '15%',  "aTargets": [3], sClass: "alignCenter"},
			{ sWidth: '15%',  "aTargets": [4],sClass: "alignCenter"},
			{ sWidth: '15%',  "aTargets": [5],sClass: "alignCenter"},
			{ sWidth: '60%',  "aTargets": [6],sClass: "alignLeft"},
			{ sWidth: '10%',  "aTargets": [7],sClass: "alignCenter"},
		],
		"sAjaxSource": "jsp/serviceLoadLogic.jsp",
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
    
function showAdvanceService(){
	if($('#service_details_optin-check').is(":checked")){
		$("#service_details_webService").show("slow");
		$("#service_details_webService_label").show("slow");
	} else {
		$("#service_details_webService").hide("slow"); 
		$("#service_details_webService_label").hide("slow");
	}
}

$("#service_details_optin-check").live('click',function (){
	showAdvanceService();
});

$("#service_private_check").live('click',function (){
	if($('#service_private_check').is(":checked")){
		$("#service_private_codes").show("slow"); 
	}else{
		$("#service_private_codes").hide("slow"); 		
	}
});

// add service private codes fuctions
function codesStyle(){
	$( '.serviceActualCodes' ).css(	"width","auto");
	$( '.serviceActualConsumeNumberCodes' ).css(	"width","auto");
	$( '.serviceEditActualCodes' ).css(	"width","auto");
	$( '.serviceActualEditConsumeNumberCodes' ).css(	"width","auto");	
	$( '.service_create_edit_add_private_code,.service_edit_delete_code_button,.service_create_add_private_code,.service_delete_code_button,.service_add_random_private_code' ).css(	"vertical-align","middle");	
}
codesStyle();

function addCodesInputs(afterNumber,idNumber){
	$( "#service_private_code_br_"+afterNumber).after('<label id="service_label_private_code_'+idNumber+'" class="deleteServicesAddCodes">'+codesMsg+': </label>'
		+'<input id="service_private_code_'+idNumber+'" type=text class="text ui-widget-content .ui-state-active ui-corner-all deleteServicesAddCodes serviceActualCodes" maxlength="4" size="4" />'
		+'<label id="service_label_private_code_'+idNumber+'" class="deleteServicesAddCodes">'+useLabel+': </label>'
		+'<input id="service_private_consume_code_'+idNumber+'" type=text class="text ui-widget-content .ui-state-active ui-corner-all deleteServicesAddCodes serviceActualConsumeNumberCodes" maxlength="4" size="4" />'
		+'<img id="service_private_code_plus_img_'+idNumber+'" src="images/plus.png" height="25" width="25" class="service_create_add_private_code deleteServicesAddCodes"  value="'+idNumber+'" title="'+AddPrivateCodeLabel+'"/>'
		+'<img id="service_private_code_minus_img_'+idNumber+'" src="images/minus.png" height="25" width="25" class="service_delete_code_button deleteServicesAddCodes" value="'+idNumber+'" title="'+DeletePrivateCodeLabel+'"/>'
		+'<img id="service_private_random_number_'+idNumber+'" src="images/random.png" height="25" width="25" class="service_add_random_private_code deleteServicesAddCodes" value="'+idNumber+'" title="'+randomLabel+'"/>'
		+'<br class="deleteServicesAddCodes" id="service_private_code_br_'+idNumber+'"/>');
	codesStyle();
}

function addCodesPlusIcon(afterNumber,idNumber){
	$( '#service_private_consume_code_'+afterNumber ).after('<img id="service_private_code_plus_img_'+idNumber+'" src="images/plus.png" height="25" width="25" class="service_create_add_private_code deleteServicesAddCodes" value="'+idNumber+'"/>');
	codesStyle();
}

function randomNumber(){
	return Math.floor(Math.random()*9000)+1000;
}

$(".service_create_add_private_code").live('click',function (e){
	if($(e.target).data('oneclicked')!='yes'){
		codesCount++;
		var beforeLast=$( '.service_create_add_private_code' ).last().attr( 'value' );
		$( "#service_private_code_plus_img_"+($( '.service_create_add_private_code' ).last().attr( 'value' )) ).remove();
		if($( '.serviceActualCodes').length === 1){	
			addCodesInputs(1,codesCount);
		}else{
			addCodesInputs(beforeLast,codesCount);			
		}
	}
	$(e.target).data('oneclicked','yes');
});

$( '.service_delete_code_button' ).live('click',function(e){
	if($(e.target).data('oneclicked')!='yes'){
		var last = $( '.service_delete_code_button' ).last().attr( 'value' );
		var actual = $( this ).attr( 'value' );
		$( '#service_label_private_code_'+($( this ).attr( 'value' ))).remove();
		$( "#service_private_code_"+($( this ).attr( 'value' ))).remove();
		$( "#service_label_private_code_"+($( this ).attr( 'value' ))).remove();
		$( "#service_private_consume_code_"+($( this ).attr( 'value' ))).remove();
		$( "#service_private_code_plus_img_"+($( this ).attr( 'value' ))).remove();
		$( "#service_private_random_number_"+($( this ).attr( 'value' ))).remove();
		$( "#service_private_code_br_"+($( this ).attr( 'value' ))).remove();
		$( this ).remove();
		if($( '.serviceActualCodes').length === 1){
			addCodesPlusIcon(1,codesCount);
		}else if(last === actual){
			addCodesPlusIcon($( '.service_delete_code_button' ).last().attr( 'value' ),$( '.service_delete_code_button' ).last().attr( 'value' ));
			$( '.service_create_add_private_code' ).last().data(('oneclicked','no'));
		}	
	}
	$(e.target).data('oneclicked','yes');
});

$( '.service_add_random_private_code').live('click',function(){
	$( '#service_private_code_'+$( this ).attr('value') ).val(randomNumber);
	return false;
});

$("#service_edit_private_checkd").live('click',function (){
	if($('#service_edit_private_checkd').is(":checked")){
		$('#serviceCodesEditInput').fadeIn('slow');
	}else{
		$('#serviceCodesEditInput').hide('slow');
	}
});

// edit privates codes functions

function addEditCodesInputsWithIniValues(afterNumber,idNumber,CodeIni,MsIni){
	$( "#service_edit_private_code_br_"+afterNumber).after('<label id="service_edit_label_private_code_'+idNumber+'" class="serviceDeleteAllEditCodes">'+codesMsg+': </label>'
		+'<input id="service_edit_private_code_'+idNumber+'" type=text class="text ui-widget-content .ui-state-active ui-corner-all deleteServicesEditAddCodes serviceEditActualCodes serviceDeleteAllEditCodes" maxlength="4" size="4" value="'+CodeIni+'"/>'
		+'<label id="service_edit_label_private_consume_code_'+idNumber+'" class="serviceDeleteAllEditCodes">'+useLabel+': </label>'
		+'<input id="service_edit_private_consume_code_'+idNumber+'" type=text class="text ui-widget-content .ui-state-active ui-corner-all deleteServicesEditAddCodes serviceActualEditConsumeNumberCodes serviceDeleteAllEditCodes" maxlength="4" size="4" value="'+MsIni+'"/>'
		+'<img id="service_edit_private_code_plus_img_'+idNumber+'" src="images/plus.png" height="25" width="25" class="service_create_edit_add_private_code deleteServicesEditAddCodes serviceDeleteAllEditCodes" value="'+idNumber+'" title="'+AddPrivateCodeLabel+'"/>'			
		+'<img id="service_edit_private_code_minus_img_'+idNumber+'" src="images/minus.png" height="25" width="25" class="service_edit_delete_code_button deleteServicesEditAddCodes serviceDeleteAllEditCodes" value="'+idNumber+'" title="'+DeletePrivateCodeLabel+'"/>'
		+'<br id="service_edit_private_code_br_'+idNumber+'" class="deleteServicesEditAddCodes serviceDeleteAllEditCodes"/>');
	codesStyle();
}

function addEditCodesInputs(afterNumber,idNumber){	
	$( "#service_edit_private_code_br_"+afterNumber).after('<label id="service_edit_label_private_code_'+idNumber+'" class="serviceDeleteAllEditCodes">'+codesMsg+': </label>'
		+'<input id="service_edit_private_code_'+idNumber+'" type=text class="text ui-widget-content .ui-state-active ui-corner-all deleteServicesEditAddCodes serviceEditActualCodes serviceDeleteAllEditCodes" size="4" maxlength="4" />'
		+'<label id="service_edit_label_private_consume_code_'+idNumber+'" class="serviceDeleteAllEditCodes">  '+useLabel+': </label>'
		+'<input id="service_edit_private_consume_code_'+idNumber+'" type=text class="text ui-widget-content .ui-state-active ui-corner-all deleteServicesEditAddCodes serviceActualEditConsumeNumberCodes serviceDeleteAllEditCodes" size="4" maxlength="4" />'
		+'<img id="service_edit_private_code_plus_img_'+idNumber+'" src="images/plus.png" height="25" width="25" class="service_create_edit_add_private_code deleteServicesEditAddCodes serviceDeleteAllEditCodes"  value="'+idNumber+'" title="'+AddPrivateCodeLabel+'"/>'
		+'<img id="service_edit_private_code_minus_img_'+idNumber+'" src="images/minus.png" height="25" width="25" class="service_edit_delete_code_button deleteServicesEditAddCodes serviceDeleteAllEditCodes" value="'+idNumber+'" title="'+DeletePrivateCodeLabel+'"/>'
		+'<br id="service_edit_private_code_br_'+idNumber+'" class="deleteServicesEditAddCodes serviceDeleteAllEditCodes"/>');
	codesStyle();
}

function addEditCodesPlusIcon(afterNumber,idNumber){
	$( '#service_edit_private_consume_code_'+afterNumber ).after('<img id="service_edit_private_code_plus_img_'+idNumber+'" src="images/plus.png" height="25" width="25" class="service_create_edit_add_private_code deleteServicesEditAddCodes serviceDeleteAllEditCodes"  value="'+idNumber+'"/>');
	codesStyle();
}

$(".service_create_edit_add_private_code").live('click',function (e){	
	if($(e.target).data('oneclicked')!='yes'){
		codesEditCount++;
		var beforeLast=$( '.service_create_edit_add_private_code' ).last().attr( 'value' );
		$( "#service_edit_private_code_plus_img_"+($( '.service_create_edit_add_private_code' ).last().attr( 'value' )) ).remove();
		if($( '.serviceEditActualCodes').length === 1){	
			addEditCodesInputs(1,codesEditCount);
		}else{
			addEditCodesInputs(beforeLast,codesEditCount);
		}
	}
	$(e.target).data('oneclicked','yes');	
});

$( '.service_edit_delete_code_button' ).live('click',function(e){
	if($(e.target).data('oneclicked')!='yes'){
		var last = $( '.service_edit_delete_code_button' ).last().attr( 'value' );
		var actual = $( this ).attr( 'value' );
		$( "#service_edit_label_private_code_"+($( this ).attr( 'value' ))).remove();
		$( "#service_edit_private_code_"+($( this ).attr( 'value' ))).remove();
		$( "#service_edit_label_private_consume_code_"+($( this ).attr( 'value' ))).remove();
		$( "#service_edit_private_consume_code_"+($( this ).attr( 'value' ))).remove();
		$( "#service_edit_private_code_plus_img_"+($( this ).attr( 'value' ))).remove();
		$( "#service_edit_private_random_number_"+($( this ).attr( 'value' ))).remove();
		$( "#service_edit_private_code_br_"+($( this ).attr( 'value' ))).remove();
		$( this ).remove();
		if($( '.serviceEditActualCodes').length === 1){	
			addEditCodesPlusIcon(1,codesEditCount);
		}else if(last === actual){
			addEditCodesPlusIcon($( '.service_edit_delete_code_button' ).last().attr( 'value' ),$( '.service_edit_delete_code_button' ).last().attr( 'value' ));
			$( '.service_create_edit_add_private_code' ).last().data(('oneclicked','no'));
		}	
	}
	$(e.target).data('oneclicked','yes');
});

function showServiceDetails(id){
	$.post('jsp/serviceDetailsLogic.jsp',{serviceId:id},function(msg){
		$('#serviceCodesEditInput').hide();
		aux=msg;
		$( '.service_details' ).remove();
		$( '#service_details_id' ).val(msg.id);
		$( '#service_details_name' ).val(msg.name);
		$( '#service_details_description' ).val(msg.description);
		$( '#service_details_type' ).append('<option value='+msg.typeVal0+' class="service_details">'+msg.type0+'</option>');
		$( '#service_details_type' ).append('<option value='+msg.typeVal1+' class="service_details">'+msg.type1+'</option>');
		$( '#service_details_logo' ).append('<img src="'+msg.baseImg+msg.logo+'" height="115" width="115" class="service_details">');
		$( '#service_details_webService' ).val(msg.optInUrl);
//		$( '#service_details_webService' ).val(msg.webService);
		$( '#service_details_status' ).append('<option value='+msg.statusVal0+' class="service_details">'+msg.status0+'</option>');
		$( '#service_details_status' ).append('<option value='+msg.statusVal2+' class="service_details">'+msg.status2+'</option>');
		$( '#service_details_createdOn' ).val(msg.createdOn);
		$( '#service_details_alias' ).val(msg.alias);
//		$( '#service_details_logo_img' ).append('<img id="ImgQRCode" src="'+$().qrcode(msg.qr,msg.name)+'" alt="QRCODE" height="135" width="135" class="service_details">');		
		$( '#service_details_webService_label' ).text(msg.labelWebUrl+":");
		if(msg.typeVal0 === '1'){
			$('#service_details_optin-check_label').hide("slow");
			$('#service_details_optin-check').hide("slow");			
		}else{
			$('#service_details_optin-check_label').show("slow");
			$('#service_details_optin-check').show("slow");			
		}
		if(msg.typeVal0 === '1' || msg.webService != "" || msg.optInUrl != ""){
			$('#service_details_optin-check').attr('checked',true);
			$("#service_details_webService").show("slow");
			$("#service_details_webService_label").show("slow");			
		}else{
			$('#service_details_optin-check').attr('checked',false);
			$("#service_details_webService").hide("slow");
			$("#service_details_webService_label").hide("slow");
		}
		if(msg.isPrivate === "true"){
			$('#service_edit_private_checkd').attr('checked',true);
			$('#serviceCodesEditInput').fadeIn('slow');
			
			$( '#service_edit_private_code_1' ).val(msg.codes[0].code);
			$( '#service_edit_private_consume_code_1' ).val(msg.codes[0].ms);
			for(var i=1;i<msg.codesLength;i++){
				codesEditCount++;
				var beforeLast=$( '.service_create_edit_add_private_code' ).last().attr( 'value' );
				$( "#service_edit_private_code_plus_img_"+($( '.service_create_edit_add_private_code' ).last().attr( 'value' )) ).remove();
				if($( '.serviceEditActualCodes').length === 1){	
					addEditCodesInputsWithIniValues(1,codesEditCount,msg.codes[i].code,msg.codes[i].ms);
				}else{
					addEditCodesInputsWithIniValues(beforeLast,codesEditCount,msg.codes[i].code,msg.codes[i].ms);
				}
			}
		}else{
			$('#service_edit_private_checkd').attr('checked',false);
		}		
	},"json");
	$( '#dialog_service_details' ).dialog( "open" );
	return false;
}

//Load Details
$('#service_table tbody tr td:nth-child(1)').live('click', function (){
	var aPos = serviceTable.fnGetPosition(this);
	var aData = serviceTable.dataTable().fnGetData(aPos[0]);	
	showServiceDetails(aData[0]);
});

$("#dialog_service_details").dialog( "destroy" );

(function ($) {
	$.fn.qrcode = function(url, service) { 
		return 'http://www.sparqcode.com/qrgen?qt=url&data='+url+'&group=13P&nocap=1&ecc=H&tags='+service;
	};
})(jQuery);

$( '#send_service' ).on('click',function(){
	hideAddErrors();

	var cen = true;
	var url="";
	var publish;
	var codes="";
	var ms="";
	var isPrivate=false;
	
	if($('#service_Publish_Add').is(':checked')){
		publish="1";
	}else{
		publish="0";
	}	

	if($( '#service_Type_Add' ).val() === '1'){
		url= $( '#service_url_input_onDemand' ).val();	
//	}else if($( '#service_Type_Add' ).val() === '2'){
	}else if(true){
		url= $( '#service_url_input_subscription' ).val();
	}
	
	if($( '#service_Name_Add' ).val() === ""){
		cen=false;
//		jAlert("msg.valu", 'Notification');
		$( '#errorServiceNameNull' ).fadeIn();
	}
		
	if ($('#service_private_check').is(':checked')){
		isPrivate=true;	
		codes = $('.serviceActualCodes').map(function(i,n) {
			if($(n).val().length > 3){
				return $(n).val();
			}else{
				cen=false;
				$( '#errorServiceCodeNull' ).fadeIn();
			}
		}).get().join(',');
		ms = $('.serviceActualConsumeNumberCodes').map(function(i,n) {
			if($(n).val().length > 0){
				return $(n).val();
			}else{
				return 0;	
			}
		}).get().join(',');
	}

	if(cen){
		$.post('jsp/serviceAddLogic.jsp',{
			name:$( '#service_Name_Add' ).val(),
			//type:$( '#service_Type_Add' ).val(),
			//alias:$( '#service_Alias_Add' ).val(),
			url:url,
			publish:publish,
			description:$( '#service_Description_Add' ).val(),
			logo:" ",
			isPrivate:isPrivate,
			codes:codes,
			ms:ms
			},function(msg){
				if(msg.result === "OK"){
					serviceTable.fnFilter('');
			    	showServiceDetails(msg.id);
			    	restoreServiceMainScreen();
				}else{
					jAlert(msg.value, notification);
				}
		},"json");
	}
	return false;
});

function hideEditErrors(){
	$( '#errorServiceEditCodeNull' ).hide();
	$( '#errorServiceEditMsNull' ).hide();
}

function hideAddErrors(){
	$( '#errorServiceNameNull' ).hide();
	$( '#errorServiceCodeNull' ).hide();
	$( '#errorServiceMsNull' ).hide();	
}

function restoreServiceMainScreen(){
//	$('.qq-upload-file').remove();
	$('#service_Name_Add').val("");
	$('#service_Description_Add').val("");
	$('#service_private_code_1').val("");
	$('#service_private_consume_code_1').val("");
	$('#service_url_input_subscription').val("");
	$('.deleteServicesAddCodes,.qq-upload-success,.qq-upload-fail').remove();
	addCodesPlusIcon(1,codesCount);
	$('#service_private_check').attr('checked',false);
	$('#optin-check').attr('checked',false);
	$('#service_private_codes').hide();
	$('#advance_service').hide();
	hideAddErrors();
	$('#form_service').hide("slow");
	$('#service_main').show("slow");
	$('#submenu_serv').show("slow");	
}

$("#add_link_service").click(
		function() {
			$("#service_main").hide("slow");
			$("#submenu_serv").hide("slow");
			$("#form_service").show("slow");
			$(':input#service_Name_Add').focus();
			
		});

$("#hideformservice").click(
	function() {
		$.post('jsp/serviceUploadImageCancelLogic.jsp');
		restoreServiceMainScreen();
		return false;
});


$('#service_Type_Add').change(function(){ 
    var value = $(this).val();
    if(value==1) {
	 	$("#optin-div").hide("slow");		    
	 	$("#ondemand_service").show("slow");
    	// code to be executed if condition is true
    }
    else if(value==2) {
	 	$("#ondemand_service").hide("slow");
	 	$("#optin-div").show("slow");
    	// code to be executed if condition is false
    }
    else{
	 	$("#ondemand_service").hide("slow");
	 	$("#optin-div").hide("slow");
	    }
});


$("#optin-check").click(function () {
    if($(this).is(":checked")) // "this" refers to the element that fired the event
    {
    	$("#advance_service").show("slow");
    } else {
    	$("#advance_service").hide("slow");	
   	}
});

var uploader0 = new qq.FileUploader({
    element: document.getElementById('file-uploader-demo1'),
    action: 'jsp/imageUpload.jsp',
    sizeLimit: 1024*400,
    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],        
    debug: true
});      

var uploader1 = new qq.FileUploader({
    element: document.getElementById('file-uploader'),
    sizeLimit: 1024*400,
    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],   
    action: 'jsp/imageUpload.jsp',
    debug: true
});           



$("#QmarkAdvc").click(function () {
	$("#Advc_help_dialog").dialog('open');
});

$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});

$("#QmarkButton").click(function () {
$("#newcamp_help").dialog('open');
});

$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});


$("#Qmark_name_camp").click(function () {
	$("#Qmark_name_camp_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});


$("#Qmark_desc_camp").click(function () {
	$("#Qmark_desc_camp_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );	
});
	
	
$("#Qmark_icon_camp").click(function () {
	$("#Qmark_icon_camp_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});

$("#Qmark_icon_detail").click(function () {
	$("#Qmark_icon_detail_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});

$("#Qmark_qrcode").click(function () {
	$("#Qmark_qrcode_dialog").dialog('open');
});

$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});

$("#QmarkPrivate").click(function () {
	$("#Qmark_icon_private_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});
	
$("#QmarkEditPrivate").click(function () {
	$("#Qmark_icon_private_dialog").dialog('open');
	});

	$(function() {
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
});

function closeEditBox(){
	$( '#service_edit_private_code_1' ).val("");
	$( '#service_edit_private_consume_code_1' ).val("");
	$( '.serviceDeleteAllEditCodes').remove();
	addEditCodesPlusIcon(1,codesEditCount);	
}

var buttonOpts = {};
buttonOpts[save] = function() {
	hideEditErrors();
	var serviceName=$( '#service_details_name' ).val();
	var webService=$( '#service_details_webService' ).val();
	var isPrivate=false;
	var codes="";
	var ms="";
	var cen = true;
	
	if(aux.typeVal0 === '2' && !($('#service_details_optin-check').is(":checked"))){
		webService="";
	}
				
	if( $( '#service_details_name' ).val() === "" ){
		serviceName=aux.name;
	}
	
	if ($('#service_edit_private_checkd').is(':checked')){
		isPrivate=true;	
		codes = $('.serviceEditActualCodes').map(function(i,n) {
			if($(n).val().length > 3){
				return $(n).val();
			}else{
				cen=false;
				$( '#errorServiceEditCodeNull' ).fadeIn();
			}
		}).get().join(',');
		ms = $('.serviceActualEditConsumeNumberCodes').map(function(i,n) {
			if($(n).val().length > 0){
				return $(n).val();
			}else{
				return 0;
			}
		}).get().join(',');
	}

	if(cen){
		$.post('jsp/serviceEditLogic.jsp',{
			serviceId:aux.id,
			name:serviceName,
			type:aux.typeVal0,
	//		alias:$( '#service_details_alias' ).val(),
			url:webService,
			publish:$( '#service_details_status' ).val()	,
			description:$( '#service_details_description' ).val(),		
			logo:"",
			isPrivate:isPrivate,
			codes:codes,
			ms:ms},
			function(msg){
				if(msg.result === "OK"){
					$('.qq-upload-success,.qq-upload-fail').remove();
					serviceTable.fnFilter('');
					$( "#dialog_service_details" ).dialog( "close" );
				}else{
					jAlert(msg.value, notification);
					serviceTable.fnFilter('');
				}
		},"json");
	}
};		

buttonOpts[del] = function() {
	hideEditErrors();
	jQuery.alerts.okButton = ok;
    jQuery.alerts.cancelButton = cancel;                 
	jConfirm(confirmationMsg, notification, function(r) {
		if(r){
			var isPrivate=false;
			var codes="";
			var ms="";
			var serviceName=$( '#service_details_name' ).val();
			var webService=$( '#service_details_webService' ).val();
			if ($('#service_edit_private_checkd').is(':checked')){
				isPrivate=true;	
			}

			if(aux.typeVal0 === '2' && !($('#service_details_optin-check').is(":checked"))){
				webService="";
			}				
			if( $( '#service_details_name' ).val() === "" ){
				serviceName=aux.name;
			}			
			$.post('jsp/serviceEditLogic.jsp',{
				serviceId:aux.id,
				name:serviceName,
				type:aux.typeVal0,
				url:webService,
				publish:"2",
				description:$( '#service_details_description' ).val(),		
				logo:"",
				isPrivate:isPrivate,
				codes:codes,
				ms:ms,
				action:"delete"
				},
				function(msg){
					if(msg.result === "OK"){
						serviceTable.fnFilter('');
						$( "#dialog_service_details" ).dialog( "close" );
					}else{
						jAlert(msg.value, notification);
						serviceTable.fnFilter('');
					}
			},"json");
		}
	});
};		

buttonOpts[cancel] = function() {
	$.post('jsp/serviceUploadImageCancelLogic.jsp');
	hideEditErrors();
	closeEditBox();
	$( this ).dialog( "close" );
};

$("#dialog_service_details").dialog({
	autoOpen: false,
	//height: 670, //Use this when include QRCode field
	height: 600,
//	width: 700,
	width: 900,
//	resize: "auto",
	modal: true,
	buttons: buttonOpts,close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	},beforeClose: function() {
		closeEditBox();
		serviceTable.fnFilter('');
		$('.qq-upload-success,.qq-upload-fail').remove();
		$( '#ImgQRCode' ).remove();
		$( '.service_details' ).remove();
	}
});

$( "#Qmark_name_camp_dialog" ).dialog({
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

$( "#Qmark_icon_private_dialog" ).dialog({
	autoOpen: false,
	height: 370,
	width: 550,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});

$( "#Qmark_desc_camp_dialog" ).dialog({
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

$( "#Qmark_icon_camp_dialog" ).dialog({
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

$( "#Qmark_icon_detail_dialog" ).dialog({
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

$( "#Qmark_qrcode_dialog" ).dialog({
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

$( "#newcamp_help" ).dialog({
	autoOpen: false,
	height: 380,
	width: 550,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});

$( "#Advc_help_dialog" ).dialog({
	autoOpen: false,
	height: 600,
	width: 900,
	title: help,
	modal: true,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});

//Send Messages to a services

$('#service_table tbody tr td:nth-child(3)').live('click', function (){	
	var aPos = serviceTable.fnGetPosition(this);
	var aData = serviceTable.dataTable().fnGetData(aPos[0]);
	$( '#send_Message_service' ).attr('service_id',aData[0]);
//	$( '#send_Message_service' ).attr('service_name',aData[1]);
	$( '#form_Send_service' ).show('slow');
	$("#service_main").hide("slow");
	$("#submenu_serv").hide("slow");
});

$( '#cancel_Message_service' ).click(function(){
	restoreMainServiceAfterSend();
});

//time selectors
$('#service_Timepicker').datetimepicker();

$("#service_Now_Check").click(function () {
	if($(this).is(":checked")) // "this" refers to the element that fired the event
	{
		$(".service_date_schedule").hide("slow");
	} else {
		$(".service_date_schedule").show("slow");
	}
});	

$("#service_No_Restricted_Days").click(function () {
    if($(this).is(":checked")) // "this" refers to the element that fired the event
    {
    	$("#service_Set_Restricted_Days").show("slow");	
    } else {
    	$("#service_Set_Restricted_Days").hide("slow");
   	}
});

$("#service_time_restricted").click(function () {
	if($(this).is(":checked")) // "this" refers to the element that fired the event
	{
		$("#service_div_time_restrict").hide("slow");
	} else {
		$("#service_div_time_restrict").show("slow");	
	}	
});

$('#service_time_start').timepicker({
		hour: 09,
		minute: 00
	});
$('#service_time_end').timepicker({
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
	$('#service_send_Textarea').textareaCount(options);
}); 

//send msg to service
$('#send_Message_service').click(function(){
	var isUrl="0";
	var text=$("#service_send_Textarea").val();
	var when ="";
	var from="";
	var to="";
	var restrictedDays="";
	var postTwitter="0";
	var postFacebook="0";
	var postEmail="0";

	if(!($('#service_Now_Check').is(':checked'))){
		when =$("#service_Timepicker").val();
	}	

	if(!($('#service_time_restricted').is(':checked'))){
		from=$("#service_time_start").val();
		to=$("#service_time_end").val();
	}	
	
	if ($('#service_No_Restricted_Days').is(':checked')){
		restrictedDays = $('.service_setResDays').map(function(i,n) {
			if($(this).is(':checked')){
				return $(n).val();
			}
		}).get().join(',');
	}
	
	if ($('#service_post_twitter').is(':checked')){
		postTwitter="1";
	}

	if ($('#service_post_facebook').is(':checked')){
		postFacebook="1";
	}

	if ($('#service_post_email').is(':checked')){
		postEmail="1";
	}
	
	//alert('isUrl='+isUrl+"|text="+text+"|when="+when+"|from="+from+"|to="+to+"|restrictedDays="+restrictedDays+"|postTwitter="+postTwitter+"|postFacebook="+postFacebook+"|postEmail="+postEmail);
		
	$.post('jsp/checkEmailIsValidLogic.jsp',function(msg){
		if((msg.result === 'OK') && (msg.isValid === 'true')){
				$('#alertSend').hide();
				$('#hideform').hide();
				$.post('jsp/broadcastSendLogic.jsp',{
					isUrl:isUrl,
					text:text,
					service:(($("#send_Message_service").attr('service_id')).toString()),
			//		subject:(($("#send_Message_service").attr('service_name')).toString()),
					when:when,
					from:from,
					to:to,
					restrictedDays:restrictedDays,
					postTwitter:postTwitter,
					postFacebook:postFacebook,
					sendEmails:postEmail
					},function(res){
						if(res.result === "OK"){
							refreshCredits('low');
						}else if(res.result === "noCredits"){
							refreshCredits('insufficient');
						}
						restoreMainServiceAfterSend();
				},"json");
		}else if((msg.result === 'OK') && (msg.isValid === 'false')){
			$( "#service_Email_Check_Valid_Dialog" ).dialog( "open" );
		}else{
		}
	},"json");
	return false;
});

//Validate email

//validate email dialog
$( "#service_Email_Check_Valid_Dialog" ).dialog( "destroy" );

var buttonOpts = {};
buttonOpts[validateText] = function() {
	$.post('jsp/validateEmailLogic.jsp',function(msg){
		if(msg.result === 'OK'){
			$( '#validateEmailProfileButton' ).hide();
			$( '#QmarkprofileValidateEmail' ).hide();
			$( '#profile_Email_input' ).attr("readonly","readonly");
			jAlert(msg.value, notification);
			$( '#service_Email_Check_Valid_Dialog' ).dialog( "close" );
		}else{
			jAlert(msg.value, notification);
		}	
	},"json");
};		

buttonOpts[cancel] = function() {
	$( '#service_Email_Check_Valid_Dialog' ).dialog( "close" );
};

$("#service_Email_Check_Valid_Dialog").dialog({
	autoOpen: false,
	height: 300,
	width: 450,
	modal: true,
	buttons: buttonOpts,close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	},beforeClose: function() { 
	}
});

//Restore Main Table After Send a message
function restoreMainServiceAfterSend(){
	$( '#service_send_Textarea' ).val('');
	$( '#service_post_twitter' ).attr('checked',false);
	$( '#service_post_facebook' ).attr('checked',false);
	$( '#service_post_email' ).attr('checked',false);
	
	$( '#service_Now_Check' ).attr('checked',true);
	$( '#service_Timepicker' ).val('');
	$( '#service_No_Restricted_Days' ).attr('checked',false);

	$( '#service_resDayMon' ).attr('checked',false);
	$( '#service_resDayTue' ).attr('checked',false);
	$( '#service_resDayWed' ).attr('checked',false);
	$( '#service_resDayThu' ).attr('checked',false);
	$( '#service_resDayFri' ).attr('checked',false);
	$( '#service_resDaySat' ).attr('checked',true);
	$( '#service_resDaySun' ).attr('checked',true);
	$( '#service_Set_Restricted_Days' ).hide();
	$( '.service_date_schedule' ).hide();

	$( '#service_time_restricted' ).attr('checked',true);
	$( '#service_time_start' ).val('');
	$( '#service_time_end' ).val('');
	$( '#service_div_time_restrict' ).hide();

	$( '#send_Message_service' ).attr('service_id','');
//	$( '#send_Message_service' ).attr('service_name','');

	
	$("#form_Send_service").hide();
	$('#service_main').show("slow");
	$('#submenu_serv').show("slow");
}

$("#service_QmarkButton_tw").click(function () {
	$("#service_QmarkButton_tw_help_Dialog").dialog('open');
	});

$("#service_QmarkButton_fb").click(function () {
	$("#service_QmarkButton_fb_help_Dialog").dialog('open');
	});

$("#service_QmarkButton_mail").click(function () {
	$("#service_QmarkButton_mail_help_Dialog").dialog('open');
	});

$( "#service_QmarkButton_tw_help_Dialog" ).dialog({
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

$( "#service_QmarkButton_fb_help_Dialog" ).dialog({
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

$( "#service_QmarkButton_mail_help_Dialog" ).dialog({
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