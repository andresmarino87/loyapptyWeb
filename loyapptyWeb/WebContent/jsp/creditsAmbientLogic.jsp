<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<script type="text/javascript"> 
$(document).ready(function(){

	<% String deployAmbient=((String)session.getAttribute("deployAmbient")).trim(); 
		if(deployAmbient.equalsIgnoreCase("staging")){
	%>
		$('#credits_Plans_Prod_Subs_Table').hide();
	<%  }else{ %>
		$('#credits_Plans_Staging_Subs_Table').hide();	
	<%}%>
 });

</script>