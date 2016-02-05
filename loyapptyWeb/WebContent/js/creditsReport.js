/*
 * 
 * Autor: Andr�s Mari�o
 * 
 */

//Cargo la tabla
var servideId;
var aux;
var creditsReportTable;

$(document).ready(function() {
	creditsReportTable=loadServiceTable();
});

//Funcion que carga la tabla
function loadServiceTable(){
	return $('#credits_Report_Table').dataTable( {
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
				"aButtons":    [ {"sExtends":"csv","mColumns": [6,1,2,3,4],"sFileName": ReportsTag+".csv"}, 
				                 {"sExtends":"xls","mColumns": [6,1,2,3,4],"sFileName": ReportsTag+".xls"}]			
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
		    { "bVisible": false,  "aTargets": [ 0 ] },
		    { "bVisible": false,  "aTargets": [ 6 ] },
			{ sWidth: '20%',  "aTargets": [1], sClass: "underline_campaign"},			
			{ sWidth: '40%',  "aTargets": [2], sClass: "alignLeft"},		
			{ sWidth: '15%',  "aTargets": [3], sClass: "alignCenter"},
			{ sWidth: '15%',  "aTargets": [4], sClass: "alignCenter"},
			{ sWidth: '15%',  "aTargets": [5], sClass: "alignCenter"},

			
		],
		"sAjaxSource": "jsp/creditsReportLoadLogic.jsp",
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

$( "#dialog_reports_text" ).dialog( "destroy" );

$('#credits_Report_Table tbody tr td:nth-child(1)').live('click', function (){
	$( '.reports_text_popout' ).remove();
	var aPos = creditsReportTable.fnGetPosition(this);
	var aData = creditsReportTable.dataTable().fnGetData(aPos[0]);
	$( "#dialog_reports_text" ).append('<p class="reports_text_popout">'+aData[6]+'</p');
	$( "#dialog_reports_text" ).dialog( "open" );
	$('.ui-dialog :button').blur();
});

$( "#dialog_reports_text" ).dialog({
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
		$( '.reports_text_popout' ).remove();
	}
});
