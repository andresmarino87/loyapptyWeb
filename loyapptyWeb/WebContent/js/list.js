/*
 * 
 * Autor: Andrés Mariño
 * 
 */

var listTable;
var groupId;
var groupNa;
var lista1;
var lista2;
var lista3;
var lista4;
var j;
//Se carga la tabla inicialmente

$(document).ready(function() {
	listTable=loadListTable();
});
 
//Funcion que carga la tabla
function loadListTable(){
	return $( '#list_table' ).dataTable( {
		"bJQueryUI": true,
		"bAutoWidth": false,
        "bPaginate": false,
		"bProcessing": true,
		"bServerSide": true,
		"aoColumnDefs": [{
			"fnRender": function ( oObj ) {
				return '<input type=\"checkbox\" name=\"listId\" value=\"'+ oObj.aData[0] +'\"/> ';
			},"aTargets": [ 3 ]},
			{ "bVisible": false,  "aTargets": [ 0 ] },
			{ "bSortable": false, "aTargets": [2] },
			{ "bSortable": false, "aTargets": [3] },
 			{ sWidth: '100%',  "aTargets": [1]},
			{ sWidth: '5%',  "aTargets": [2],sClass: "alignCenter"}
			],
		"sAjaxSource": "jsp/listLoadLogic.jsp",
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

//Funcion que edita una lista


$( '#list_table tbody tr td:nth-child(1)' ).live('click', function (){
	var aPos = listTable.fnGetPosition(this);
	var aData = listTable.dataTable().fnGetData(aPos[0]);
	groupId = aData[0];
	groupNa = aData[1];
	$( '#groupN' ).val(groupNa);
	$.post('jsp/listModifyLoadLogic.jsp',{groupId:groupId},function(msg){
		//msg=jQuery.trim(msg);
		if(msg.result === 'noToken'){
			alert("Periodo de inactividad excedido, por favor ingrese de nuevo a la pagina");
			document.location='./index.jsp';
		}else if(msg.result === 'OK'){
			lista4=[];
			lista1=(msg.list).split(",");
			lista2=(lista1[1]).split("|");
			lista1=(lista1[0]).split("|");
			lista3=[];
			$.merge(lista3,lista2);
			$.merge(lista3,lista1);
			j=0;
			for(var k=0;k<lista3.length;k++){
				if(lista3[k]!==""){
					lista4[j]=lista3[k];
					j++;
				}
			}
			
			for(var i=0;i<lista1.length;i=i+2){
				if(lista1[i]!== ""){
					$( '#sortable1' ).append('<li id="'+lista1[i]+'" class="ui-state-highlight">'+lista1[i+1]+'</li>');
				}		
			}
			for(var i=0;i<lista2.length;i=i+2){
				if(lista2[i]!== ""){
					$( '#sortable2' ).append('<li id="'+lista2[i]+'" class="ui-state-highlight">'+lista2[i+1]+'</li>');
				}		
			}
		}
	},"json");			

	$( '#dialog_modify_list_form' ).dialog( "open" );
});

//Funcion que elimina listas(s)

$( '#delete_list_confirmation' ).dialog( "destroy" );

$( '#delete_list_confirmation' ).dialog({
	autoOpen: false,
	height: 250,
	width: 350,
	modal: true,
	buttons: {
		"Ok": function() {
			var sData = $('input', listTable.fnGetNodes()).serialize();
			$.post('jsp/listDeleteLogic.jsp',{sData:sData},function(msg){
				if(msg.result === 'OK'){
					alert(msg.value);
					listTable.fnFilter('');
				}else if(msg.result === 'noToken'){
					alert(msg.value);
					document.location='./index.jsp';
				}else if(msg.result === 'NO'){
					alert(msg.value);
				}
			},"json");			
			$( this ).dialog( "close" );	
		},
		Cancel: function() {
			$( this ).dialog( "close" );
		}
	},close: function() {
		allFields.val( "" ).removeClass( "ui-state-error" );
	}
});

$( '#listTableForm' ).submit( function() {
	$( "#delete_list_confirmation" ).dialog( "open" );
	return false;
});

//Funcion que agrega una lista
$(function() {
	$( "#dialog_add_list_form" ).dialog( "destroy" );
	
	var name = $( "#name" ),
		
		allFields = $( [] ).add( name ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips
			.text( t )
			.addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		}, 500 );
	}

	function checkLength( o, n, min, max ) {
		if ( o.val().length > max || o.val().length < min ) {
			o.addClass( "ui-state-error" );
			updateTips( "Length of " + n + " must be between " +
				min + " and " + max + "." );
			return false;
		} else {
			return true;
		}
	}

	function checkRegexp( o, regexp, n ) {
		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "ui-state-error" );
			updateTips( n );
			return false;
		} else {
			return true;
		}
	}
	
	$( "#dialog_add_list_form" ).dialog({
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		buttons: {
			"Create list": function() {
				var bValid = true;
				allFields.removeClass( "ui-state-error" );
/*
				bValid = bValid && checkLength( name, "name", 1, 20 );
*/
				if ( bValid ) {
					$.post('jsp/listAddLogic.jsp',{name:name.val()},function(msg){
						if(msg.result === 'OK'){
							alert(msg.value);
							listTable.fnFilter('');
						}else if(msg.result === 'noToken'){
							alert(msg.value);
							document.location='./index.jsp';
						}else if( msg.result === 'NO'){
							alert(msg.value);
						}
					},"json");
					$( this ).dialog( "close" );
				}
			},
			Cancel: function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "ui-state-error" );
		}
	});

	$( "#add_list" ).button().click(function() {
		$( "#dialog_add_list_form" ).dialog( "open" );
	});
});


//manipulacion de los suscriptores en las listas

$("#dialog_modify_list_form").dialog("destroy");

$( "#dialog_modify_list_form" ).dialog({
	autoOpen: false,
	height: 600,
	width: 500,
	modal: true,
	buttons: {
		OK:function(){
			var idsAdd = $('#sortable2 li').map(function(i,n) {
			    return $(n).attr('id');
			}).get().join(',');
			var idsRem = $('#sortable1 li').map(function(i,n) {
			    return $(n).attr('id');
			}).get().join(',');
			
			$.post('jsp/listModifySaveLogic.jsp',{groupId:groupId,groupName:$( '#groupN' ).val(),
				idsAdd:idsAdd,
				idsRem:idsRem,},function(msg){
				if(msg.result === 'OK'){
					alert(msg.value);
					listTable.fnFilter('');
				}else if(msg.result === 'noToken'){
					alert(msg.value);
					document.location='./index.jsp';
				}else if(msg.result === 'NO'){
					alert(msg.value);
				}
			},"json");
			$( this ).dialog( "close" );
			return false;
		},
		Cancel: function() {
			$( this ).dialog( "close" );
			return false;
		}
	},
	beforeClose: function() { 
		$("dest_list").remove();
	}
});

//manipulacion de los suscriptores en las listas
$(function() {
	$( 'ul.droptrue' ).sortable({
		connectWith: "ul"
	});

	$( 'ul.dropfalse' ).sortable({
		connectWith: "ul",
		dropOnEmpty: true
	});

	$( '#sortable1, #sortable2' ).disableSelection();
});

//todo a la izquierda
$('#BPI').click(function(){
	$('li').remove();
	for(var i=0;i<lista4.length;i=i+2){
		if(lista4[i]!== ""){
			// CLASES A DESTRUIR
			$("#sortable1").append('<li id="'+lista4[i]+'" class="ui-state-highlight" name="dest_list">'+lista4[i+1]+'</li>');
		}		
	}		
});
//todo a la derecha
$('#BPD').click(function(){
	$('li').remove();
	for(var i=0;i<lista4.length;i=i+2){
		if(lista4[i]!== ""){
			//CLASES A DESTRUIR
			$("#sortable2").append('<li id="'+lista4[i]+'" class="ui-state-highlight" name="dest_list">'+lista4[i+1]+'</li>');
		}		
	}		
});

//funcion check all
$('#checkAllList').click( function() {
	$('input', listTable.fnGetNodes()).attr('checked',this.checked);
} );

//Funcion busqueda suscriptores en las listas
 
jQuery.expr[':'].Contains = function(a,i,m){
    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
};

$('#list_suscriptor_filter').change(function(){
	var filter = $(this).val();
	if(filter){
        $('#sortable1').find("li:not(:Contains(" + filter + "))").slideUp();
        $('#sortable1').find("li:Contains(" + filter + ")").slideDown();
    }else{
		$('#sortable1').find("li").slideDown();		
	}	
}).keyup(function(){
	$(this).change();
});