<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
</head>
<body  onload="initialize()">
<div id="profile_main">
<div id="profile_table">
				<table>					
					<tr>
						<td class="tableprofile_label"><label id="profile_Email_label" for="profile_Email_input"><%=(String) session.getAttribute("Email")%>:</label>
						</td>
						<td class="tableprofile_input"><input class="text ui-widget-content ui-corner-all" type="email" id="profile_Email_input" />
							<button id="validateEmailProfileButton" type="button" class="qq-upload-button" style="display: none"><%=(String) session.getAttribute("ValidateMsg")%></button>	
							<img id="QmarkprofileValidateEmail" width="18px" src="images/dialog-question.png" style="display: none">							
							<img id="validImageEmailCheck" src="images/checkIcon.png" width="25px" style="display: none" title="<%=(String) session.getAttribute("CheckValidateMsg")%>"/>
						</td>		
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="profile_BN_label" for="profile_BN_input"><%=(String) session.getAttribute("BusinessName")%>:</label>
						</td>
						<td class="tableprofile_input"><input class="text ui-widget-content ui-corner-all" type="text" id="profile_BN_input" maxlength="70"/></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="profile_PWD_label" for="profile_PWD_input"><%=(String) session.getAttribute("Password")%>:</label>
						</td>
						<td class="tableprofile_input"><input class="text ui-widget-content ui-corner-all" type="text" id="profile_PWD_input" maxlength="50"/></td>
					</tr>
					<tr>
						<td height="21" colspan="2" align="left" valign="top"><em><strong><%=(String)session.getAttribute("Registermsg") %></strong></em></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_OtherContact_label"
							for="profile_Logo_input"><%=(String) session.getAttribute("Logo")%>:<img id="Qmark_logo" src="images/dialog-question.png" width="18px" /></label>
						</td>
						<td class="tableprofile_input"><img id="profile_Logo_input" src="" width="100px" /><div id="file-uploader-profile"></div>
						</td>
					</tr>					
					
					<tr>
						<td class="tableprofile_label"><label id="proile_Website_label"
							for="profile_Website_input"><%=(String) session.getAttribute("Website")%>:</label>
						</td>
						<td class="tableprofile_input">http:// <input class="text ui-widget-content ui-corner-all" type="text" id="profile_Website_input" maxlength="490"/>
						</td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="profile_BusinessCat_label"
							for="profile_BusinessCat_input"><%=(String) session.getAttribute("Businesscat")%>:</label>
						</td>
						<td class="tableprofile_input"><select id="profile_BusinessCat_input">
								<option value=1><%=(String) session.getAttribute("BC1")%></option>
								<option value=3><%=(String) session.getAttribute("BC3")%></option>
								<option value=4><%=(String) session.getAttribute("BC4")%></option>
								<option value=5><%=(String) session.getAttribute("BC5")%></option>
								<option value=8><%=(String) session.getAttribute("BC8")%></option>
								<option value=9><%=(String) session.getAttribute("BC9")%></option>
								<option value=10><%=(String) session.getAttribute("BC10")%></option>
								<option value=14><%=(String) session.getAttribute("BC14")%></option>
								<option value=17><%=(String) session.getAttribute("BC17")%></option>
								<option value=18><%=(String) session.getAttribute("BC18")%></option>
								<option value=19><%=(String) session.getAttribute("BC19")%></option>
						</select></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="profile_BusinessDes_label"
							for="profile_BusinessDes_input"><%=(String) session.getAttribute("BusinessDescription")%>:</label>
						<td class="tableprofile_input"><textarea class="text ui-widget-content ui-corner-all" id="profile_BusinessDes_input" cols="45" rows="5"  maxlength="512"></textarea></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><%=(String) session.getAttribute("Country")%>/<%=(String) session.getAttribute("City")%>:</td>
						<td class="tableprofile_input"><select id="profile_Country_input"></select>/ <select
							id="profile_City_input"></select><span id="loadingCity"><img src="images/loading.gif" /></span>
							<div id="map" style="width:100%; height:250px"></div>
						</td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_Address_label"
							for="profile_Address_input"><%=(String) session.getAttribute("Address")%>:</label>
						</td>
						<td class="tableprofile_input"><textarea class="text ui-widget-content ui-corner-all" id="profile_Address_input" cols="45" rows="3"  maxlength="175"/></textarea></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_Zip_label" for="profile_Zip_input"><%=(String) session.getAttribute("Zip")%>:</label>
						</td>
						<td class="tableprofile_input"><input class="text ui-widget-content ui-corner-all" type="text" id="profile_Zip_input" maxlength="15"/></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_LocationRelevant_label"
							for="profile_LocationRelevant_input"><%=(String) session.getAttribute("LocationRelevant")%>:<img id="Qmarkprofile" src="images/dialog-question.png" width="18px" /></label>
							</td>
						<td class="tableprofile_input"><input class="text ui-widget-content ui-corner-all" type="checkbox"
							id="profile_LocationRelevant_input" /></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_MainContact_label"
							for="profile_MainContact_input"><%=(String) session.getAttribute("MainContact")%>:</label>
						</td>
						<td class="tableprofile_input"><input class="text ui-widget-content ui-corner-all" type="text" id="profile_MainContact_input" maxlength="490"/></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_OtherContact_label"
							for="profile_OtherContact_input"><%=(String) session.getAttribute("OtherContact")%>:</label>
						</td>
						<td class="tableprofile_input"><input class="text ui-widget-content ui-corner-all" type="text" id="profile_OtherContact_input" maxlength="490"/></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_QRcode_label"
							for="profile_QRcode_input"><%=(String) session.getAttribute("QRcode")%>:</label>
							<div id="Qmark_qrcode" >
								<img width="18px" src="images/dialog-question.png" />
							</div> 
			 				<div id="Qmark_qrcode_dialog" style="display:none">
								<%=(String)session.getAttribute("Qrcodeexplain")%>
							</div>			
						</td>
						<td class="tableprofile_input"><img id="profile_QRcode_input" src="" width="135px" /></td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="proile_QRcode_label"
							for="profile_QRcode_input"><%=(String) session.getAttribute("PromotionalCode")%>:</label>
							<a id="Qmark_promotionalCode" >
								<img width="18px" src="images/dialog-question.png" />
							</a> 
						</td>
						<td class="tableprofile_input">
							<input class="text ui-widget-content ui-corner-all" type="text" id="profile_promotionalCode_input" maxlength="70"/>
							<button id="profile_Add_Random_PromotionalCode" type="button" class="qq-upload-button"><%=(String) session.getAttribute("RandomCode")%></button>								
						</td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="profile_twitterCheck_label"
							for="profile_twitterCheck_input"><%=(String) session.getAttribute("AuthorizeTwitter")%>:</label>
							<a id="Qmark_twitterCheck" >
								<img width="18px" src="images/dialog-question.png" />
							</a> 
						</td>
						<td class="tableprofile_input">
							<input class="text ui-widget-content ui-corner-all" type="text" id="profile_Twitter_Input" />
							<img id="valid_Image_Twitter_Check" src="images/checkIcon.png" width="25px" style="display: none" title="<%=(String)session.getAttribute("CheckAuthorizeTwitterMsg")%>"/>
							<a id="profile_twitterCheck_button" type="button" class="qq-upload-button" href="" style="display: none"><%=(String)session.getAttribute("AuthorizeTwitterButtonMsg") %></a>
						</td>
					</tr>
			
			<!-- 					<tr>
						<td class="tableprofile_label"><label id="profile_facebookCheck_label"
							for="profile_facebookCheck_input"><%=(String)session.getAttribute("Facebook")%>:</label>
							<a id="Qmark_facebookCheck" >
								<img width="18px" src="images/dialog-question.png" />
							</a> 
						</td>
						<td class="tableprofile_input">
							<input class="text ui-widget-content ui-corner-all" type="email" id="profile_Facebook_Input" />
						</td>
					</tr>-->
			
			
			
					<tr>
						<td class="tableprofile_label"><label id="profile_facebookCheck_label"
							for="profile_facebookCheck_input"><%=(String) session.getAttribute("AuthorizeFacebook")%>:</label>
							<a id="Qmark_facebookCheck" >
								<img width="18px" src="images/dialog-question.png" />
							</a> 
						</td>
						<td class="tableprofile_input">
							<input class="text ui-widget-content ui-corner-all" type="email" id="profile_Facebook_Input" />
							<img id="valid_Image_Facebook_Check" src="images/checkIcon.png" width="25px" style="display: none" title="<%=(String)session.getAttribute("CheckAuthorizeFacebookMsg")%>"/>
							<a id="profile_FacebookCheck_button" type="button" class="qq-upload-button" href="https://graph.facebook.com/oauth/authorize?type=client_cred&client_id=<%=(String)session.getAttribute("facebookAppId") %>&redirect_uri=<%=(String)session.getAttribute("thisServerBase")+"main.jsp" %>&scope=email,publish_actions" style="display: none"><%=(String)session.getAttribute("AuthorizeFacebookButtonMsg") %></a>
						</td>
					</tr>
					<tr>
						<td class="tableprofile_label"><label id="Request_Sub_Parameter_label"
							for="profile_Request_Sub_Parameter_input"><%=(String) session.getAttribute("SubscriptorRequestParameter")%>:</label>
							<a id="Qmark_Request_Sub_Parameter" >
								<img width="18px" src="images/dialog-question.png" />
							</a> 
						</td>
						<td class="tableprofile_input" style="width:100%">
							<table>
								<tr style="width:100%">
									<td>
										<input id='profile_Request_Sub_Parameter_Name' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="f_name" value="f_name">
										<label id="profile_Request_Sub_Parameter_label" for="profile_Request_Sub_Parameter_Name"><%=(String)session.getAttribute("FirstName") %></label>
									</td>
									<td>
										<input id='profile_Request_Sub_Parameter_Last' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="l_name" value="l_name">
										<label id="profile_Request_Sub_Parameter_Last_label" for="profile_Request_Sub_Parameter_Last"> <%=(String)session.getAttribute("LastName") %></label>

									</td>
									<td>
										<input id='profile_Request_Sub_Parameter_Email' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="email" value="email">
										<label id="profile_Request_Sub_Parameter_Email_label" for="profile_Request_Sub_Parameter_Email"> <%=(String)session.getAttribute("Email") %></label>
									</td>
								<tr>	
								<tr style="width:100%">
									<td>
										<input id='profile_Request_Sub_Parameter_Mobile' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="mobile" value="mobile">
										<label id="profile_Request_Sub_Parameter_Mobile_label" for="profile_Request_Sub_Parameter_Mobile">	<%=(String)session.getAttribute("Mobile") %></label>
									</td>
									<td>
										<input id='profile_Request_Sub_Parameter_FB' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="fb" value="fb">
										<label id="profile_Request_Sub_Parameter_FB_label" for="profile_Request_Sub_Parameter_FB"> <%=(String)session.getAttribute("FB") %></label>
									</td>
									<td>						
										<input id='profile_Request_Sub_Parameter_TW' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="tw" value="tw">
										<label id="profile_Request_Sub_Parameter_TW_label" for="profile_Request_Sub_Parameter_TW"> <%=(String)session.getAttribute("TW") %></label>
									</td>
								</tr>	
								<tr style="width:100%">
									<td>
										<input id='profile_Request_Sub_Parameter_City' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="city" value="city">
										<label id="profile_Request_Sub_Parameter_City_label" for="profile_Request_Sub_Parameter_City"> <%=(String)session.getAttribute("City") %></label>
									</td>
									<td>
										<input id='profile_Request_Sub_Parameter_Zip' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="zip" value="zip">
										<label id="profile_Request_Sub_Parameter_Zip_label" for="profile_Request_Sub_Parameter_Zip"> <%=(String)session.getAttribute("Zip") %></label>
									</td>
									<td>
<!-- 										<input id='profile_Request_Sub_Parameter_Other' class="profile_Request_Subscriptor_Parameters" type="checkbox" name="other" value="other">
										<label id="profile_Request_Sub_Parameter_Other_label" for="profile_Request_Sub_Parameter_Other"> <%=(String)session.getAttribute("Other") %></label>
 -->									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>				
	</div>
	<div class="centerbutton demo">
		<button id="profile_Save_button" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" ><%=(String) session.getAttribute("Save")%></button> 
		<button id="profile_Cancel_button" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"><%=(String) session.getAttribute("Cancel")%></button>
	</div>
<div class="demo">
		<div id="dialog_change_password_form" title="<%=(String) session.getAttribute("ChgPwd")%>" style="display:none">
			<form> 
				<fieldset>
					<br />
					<p style="display: none" class="ui-state-error" id="errorProfilePwdNULL"><%=(String)session.getAttribute("PwdNotNull")%></p>
					<p style="display: none" class="ui-state-error" id="errorProfilePWDNM"><%=(String)session.getAttribute("ErrorRPWDNM")%></p>
					<label for="new_password"><%=(String) session.getAttribute("Password")%>:</label>
					<input type="password" name="new_password" id="new_password" class="text ui-widget-content ui-corner-all"  maxlength="50"/>
					<br /><br />
					<label for="new_password_2"><%=(String) session.getAttribute("PasswordConfirm")%>:</label>
					<input type="password" name="new_password_2" id="new_password_2" class="text ui-widget-content ui-corner-all"  maxlength="50"/>
				</fieldset>
			</form>
		</div>
		<br>
		
	</div>

	<div id="Qmarkprofile_dialog" style="display:none">
		<%=(String) session.getAttribute("Registerhelploc")%>
	</div>	
	
	<div id="Qmark_logo_dialog" style="display:none">
		<%=(String) session.getAttribute("EnterpriseLogo")%>
	</div>
	<div id="Qmark_validate_dialog" style="display:none">
		<%=(String) session.getAttribute("CheckValidateEmailHelp")%>
	</div>
	<div id="Qmark_promotionalCode_dialog" style="display:none">
		<%=(String) session.getAttribute("PromotionalCodeHelp")%>
	</div>
	<div id="Qmark_twitter_dialog" style="display:none">
		<%=(String) session.getAttribute("AuthorizeTwitterHelp")%>
	</div>
	<div id="Qmark_facebook_dialog" style="display:none">
		<%=(String) session.getAttribute("AuthorizeFacebookHelp")%>
	</div>	
	<div id="Qmark_Request_Sub_Parameter_dialog" style="display:none">
		<%=(String)session.getAttribute("RequestSubParameterHelp") %>
	</div>
</div>
<script type="text/javascript">  
//No mover!!! necesario para el idioma
var promotionalMsgTag="<%=(String) session.getAttribute("PromotionalCode")%>";
var help="<%=(String)session.getAttribute("Help")%>";
var cancel="<%=(String)session.getAttribute("Cancel")%>";
var notification="<%=(String)session.getAttribute("Notification")%>";
var emailNotValid="<%=(String)session.getAttribute("EmailNotNull")%>";
var promotionalMsgTag="<%=(String) session.getAttribute("PromotionalCode")%>";
$.getScript( "js/profile.js" , function () { 
}); 
</script>	
</body>
</html>