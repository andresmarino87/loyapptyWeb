<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<form id="userTableForm">
		<table  id="user_table">
			<thead>
				<tr>
					<th >id</th>
					<th >login</th>
					<th >name</th>
					<th ><input type="checkbox" id="checkAllUser" onClick="sel_all_chk(this);"></th>
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
					<th>login</th>
					<th>name</th>
					<th>Check</th>
				</tr>
			</tfoot>
		</table>
		<div><button id="delete_user"  class="ui-state-default ui-corner-all" type="submit" >delete user</button></div>
	</form>
	<div id="delete_user_confirmation"> Confirmation message</div>

<script type="text/javascript" src="js/user.js"></script>
