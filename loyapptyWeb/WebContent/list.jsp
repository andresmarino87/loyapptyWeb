<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- JSP -->
	<%@page import="java.io.*"  %>
	<%@page import="java.util.*"  %> 
			<%	
			String language = (String)session.getAttribute("language");
			InputStream stream = null;
			if(language.equals("1")){  
				stream = application.getResourceAsStream("config/englishConf.properties");
			}else{
				stream = application.getResourceAsStream("config/spanishConf.properties");
			}
			Properties properties = new Properties();
			properties.load(stream);
	
			%>
			<script type="text/javascript">

 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-29036687-1']);
 _gaq.push(['_trackPageview']);

 (function() {
 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();

 </script> 
</head>
<body>

<div id="submenu">

<a id="add_link" href="#" >Agregar</a>
<a id="export_link" href="#">Exportar</a>
</div>

<div id="list_main" >
	<form id="listTableForm">
		<table id="list_table">
			<thead>
				<tr>
					<th>id</th>
					<th>nombre</th>
					<th>Number</th>
					<th><input type="checkbox" id="checkAllList" onClick="sel_all_chk(this);"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" class="dataTables_empty">Loading data from server</td>
				</tr>
			</tbody> 
			<tfoot>
				<tr>
					<th>id</th>
					<th>nombre</th>
					<th>Number</th>
					<th>Check</th>
				</tr>
			</tfoot>
		</table>
		<button id="delete_list"  type="submit" ><img id="delete_list_icon" src="images/delete-icon.png" WIDTH=40 /></button>
	</form>
	<div class="demo">
		<div id="dialog_add_list_form" title="Create list">
			<p class="validateTips">All form fields are required.</p>
			<form>
				<fieldset>
					<label for="description"><%=properties.getProperty("Name")%></label>
					<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
				</fieldset>
			</form>
		</div>
		<button id="add_list"><img id="add_list_icon" src="images/Add-icon.png" WIDTH=40 /></button>
 	
	</div>
		<div id="delete_list_confirmation"><%=properties.getProperty("AreYouSure")%></div><br>
	<div id="dialog_modify_list_form" title="Lista"> 
		<input type="text" name="groupName" id="groupN" value="" class="text ui-widget-content ui-corner-all" />*
		<div id="list_search_suscriptor">
			<form><input id="list_suscriptor_filter" type="text"></form>
		</div>
		<div id="BPD"><img id="pass_list_icon" src="images/AF.png" WIDTH=40 /></div>
		<div id="BPI"><img id="pass_list_icon" src="images/AB.png" WIDTH=40 /></div>
		<div class="demo">
			<ul id="sortable1" class='droptrue'>
			</ul>
			<ul id="sortable2" class='dropfalse'>
			</ul>
			<br>
		</div>
	</div>
</div>	
	
<script type="text/javascript" src="js/list.js"></script>  
</body>
</html>