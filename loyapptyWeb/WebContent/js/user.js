/*
 * 
 * Autor: Andrés Mariño
 * 
 */

var userTable;

//Se carga la tabla inicialmente

$(document).ready(function() {
	userTable=loadUserTable();
	
});

//Funcion que carga la tabla
function loadUserTable(){
	return $('#user_table').dataTable( {
		"bAutoWidth": false,
//		"sScrollY": "400px",
		"bJQueryUI": true, 
        "bPaginate": false,
		"bProcessing": true,
		"bServerSide": true,
		"aoColumnDefs": [{
			"fnRender": function ( oObj ) {
				return '<input type=\"checkbox\" name=\"userId\" value=\"'+ oObj.aData[0] +'\"> ';
			},"aTargets": [ 3 ]},
			{ "bVisible": false,  "aTargets": [ 0 ] },
			{ "bSortable": false, "aTargets": [3] }	,		
			{ sWidth: '80%',  "aTargets": [1]},
			{ sWidth: '30%',  "aTargets": [2]},
			{ sWidth: '5%',  "aTargets": [3],sClass: "alignCenter"}

			],
		"sAjaxSource": "jsp/userLoadLogic.jsp",
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

//Funcion que elimina usuarios 

$("#delete_user_confirmation").dialog( "destroy" );

$("#delete_user_confirmation").dialog({
	autoOpen: false,
	height: 100,
	width: 350,
	modal: true,
	buttons: {
		"Ok": function() {
			var sData = $('input', userTable.fnGetNodes()).serialize();
			$.post('jsp/userDeleteLogic.jsp',{sData:sData},function(msg){
				alert(msg);
				/*	if(jQuery.trim(msg) === 'OK'){
					alert("Se eliminaron exitosamente");
					user.fnFilter('');
				}else if(jQuery.trim(msg) === 'noToken'){
					alert("Periodo de inactividad excedido, por favor ingrese de nuevo a la pagina");
					document.location='./index.jsp';
				}else{
					alert("La operación no fue exitosa");
					//alert(msg);
				}*/
			},"text");			
			//alert(sData);
			$( this ).dialog( "close" );	
		},
		Cancel: function() {
			$( this ).dialog( "close" );
		}
	},close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	}
});

$('#userTableForm').submit( function() {
	$("#delete_user_confirmation").dialog( "open" );
return false;
});

//funcion chekall

$('#checkAllUser').click( function() {
	$('input', userTable.fnGetNodes()).attr('checked',this.checked);
} );