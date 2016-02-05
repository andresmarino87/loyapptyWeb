<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div id="submenu_subs">
	<a id="export_link" href="#"><%=(String)session.getAttribute("Export")%></a>
</div>

<div id="credits_Report_main">
	<table class="display" id="credits_Report_Table">
		<thead>
			<tr>
				<th><%=(String)session.getAttribute("Id")%></th>
				<th><%=(String)session.getAttribute("Text")%></th>
				<th><%=(String)session.getAttribute("Suscriptor_Table_Service")%></th>
				<th><%=(String)session.getAttribute("Date")%></th>
				<th><%=(String)session.getAttribute("Transaction")%></th>
				<th><%=(String)session.getAttribute("Credit")%></th>
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
	<div id="dialog_reports_text" title=<%=(String)session.getAttribute("Text") %>>
	</div>
	<br>
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
var ReportsTag="<%=(String)session.getAttribute("Report_Menu_Tag")%>";
$.getScript( "js/creditsReport.js" , function () { 
}); 
</script>	