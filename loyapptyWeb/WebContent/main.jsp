<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<title>Loyappty</title>
<%@include file="jsp/logsLogic.jsp" %>

<!-- IE SCRIPT para HTML5 -->

<!--[if lt IE 9]>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- FAVICON -->
<link rel="shortcut icon" href="css/img/favicon.png" type="image/png" />

<!-- KENDO -->

<script type="text/javascript" src="js/libraries/jquery-1.7.2.min.js"></script>

<script type="text/javascript" src="js/kendo/kendo.core.js"></script>
<script type="text/javascript" src="js/kendo/kendo.fx.js"></script>
<script type="text/javascript" src="js/kendo/kendo.tabstrip.js"></script>
<script type="text/javascript" src="js/kendo/kendo.culture.es-ES.min.js"></script>

<!-- DATATABLES -->

<script type="text/javascript" src="js/libraries/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/libraries/TableTools.js"></script>
<script type="text/javascript" src="js/libraries/ZeroClipboard.js"></script>

<!-- JQuery UI -->

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/JavaScript" src="js/logout.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>


<script type="text/javascript" src="js/jquery.qtip-1.0.0-rc3.min.js"></script>
<script type="text/javascript" src="js/jquery.simpletip-1.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.alerts.js"></script>
<script type="text/javascript" src="js/printPage.js"></script>
<script type="text/javascript" src="js/jquery.jqprint-0.3.js"></script>
<script type="text/javascript" src="js/jquery.PrintArea.js"></script>

<!-- Google Maps -->

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDM5vw9nxADp7G_HQqz0mGvSd6P8OFPoMo&sensor=false"></script>

<!-- HOJAS DE ESTILOS -->

<link rel="stylesheet" type="text/css" href="css/styles.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/kendo.common.css"/> 
<link rel="stylesheet" type="text/css" href="css/kendo.default.css" />
<link rel="StyleSheet" type="text/css" href="css/fileuploader.css"></link>
<link rel="stylesheet" type="text/css" href="css/jquery.alerts.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.17.custom.css"/>
<link rel="stylesheet" type="text/css" href="css/table.css"  media=screen />
<link rel="stylesheet" type="text/css" href="css/TableTools_JUI.css"  media=screen />
<link rel="stylesheet" type="text/css" href="css/TableTools.css" media=screen />


<!-- DON'T MOVE THIS STYLE!!!  -->

<style media="all" type="text/css">
.alignCenter {
	text-align: center;
}
.underline_campaign{
	text-decoration:underline;
	cursor:pointer;
}

</style>


<!-- Carga el idioma -->
		<%@page import="java.io.*"%>
		<%@page import="java.util.*"%>
		<%@page import="org.apache.log4j.*" %>
		<%@page import="loyapptyWeb.*"  %>
		<%@page import="twitter4j.*" %>
		<%@page import="twitter4j.Twitter" %>
		<%@page import="twitter4j.auth.RequestToken" %>
		<%@page import="twitter4j.auth.AccessToken" %>
		<%@page import="java.net.URL" %>
		<%@page import="java.net.*" %>	
		<%@page import="org.codehaus.jettison.json.JSONObject"  %>

		<%	
			if((String)session.getAttribute("language") == null){
				response.sendRedirect("./index.jsp");
				return;
			}
			InputStream stream = application.getResourceAsStream("config"+File.separator+"var.properties");
			Properties properties = new Properties();
			properties.load(stream);
			session.setAttribute("deployAmbient",properties.getProperty("deployAmbient"));
			session.setAttribute("lifeTime",properties.getProperty("sessionLifeTime"));
			session.setAttribute("tablesRefreshTime",properties.getProperty("tablesRefreshTime"));
			session.setAttribute("twitterConsumerKey",properties.getProperty("twitterConsumerKey"));
			session.setAttribute("twitterConsumerSecret",properties.getProperty("twitterConsumerSecret"));
			session.setAttribute("facebookAppId",properties.getProperty("facebookAppId"));
			session.setAttribute("facebookAppSecret",properties.getProperty("facebookAppSecret"));
			session.setAttribute("thisServerBase",properties.getProperty("thisServerBase"));
			session.setAttribute("MinimumCreditsAlert",properties.getProperty("MinimumCreditsAlert"));
			session.setAttribute("fileBaseLoad",properties.getProperty("fileBaseLoad"));
			
			String language = (String)session.getAttribute("language");			
			String footerExt="";
			stream = null;
			if(language.equals("1")){  
				stream = application.getResourceAsStream("config"+File.separator+"englishConf.properties");
			}else{
				stream = application.getResourceAsStream("config"+File.separator+"spanishConf.properties");
				footerExt="_es";
			}
			session.setAttribute("footerExt", footerExt);
			properties = new Properties();
			properties.load(stream);
		
			session.setAttribute("Logout",properties.getProperty("Logout"));
			session.setAttribute("LogoutMsg",properties.getProperty("LogoutMsg"));
			session.setAttribute("SignIn",properties.getProperty("SignIn"));
			session.setAttribute("Login",properties.getProperty("Login"));
			session.setAttribute("ForgotPwdMessage",properties.getProperty("ForgotPwdMessage"));
			session.setAttribute("ForgotPwdInput",properties.getProperty("ForgotPwdInput"));
			session.setAttribute("Send",properties.getProperty("Send"));
			session.setAttribute("Email",properties.getProperty("Email"));
			session.setAttribute("InvalidEmail",properties.getProperty("InvalidEmail"));
			session.setAttribute("Password",properties.getProperty("Password"));
			session.setAttribute("FatalError",properties.getProperty("FatalError"));
			session.setAttribute("ForgotPwd",properties.getProperty("ForgotPwd"));
			session.setAttribute("PasswordConfirm",properties.getProperty("PasswordConfirm"));
			session.setAttribute("Name",properties.getProperty("Name"));
			session.setAttribute("Lastname",properties.getProperty("Lastname"));
			session.setAttribute("Website",properties.getProperty("Website"));
			session.setAttribute("Zip",properties.getProperty("Zip"));
			session.setAttribute("Address",properties.getProperty("Address"));
			session.setAttribute("BusinessCategory",properties.getProperty("BusinessCategory"));
			session.setAttribute("BusinessDescription",properties.getProperty("BusinessDescription"));
			session.setAttribute("MainContact",properties.getProperty("MainContact"));
			session.setAttribute("OtherContact",properties.getProperty("OtherContact"));
			session.setAttribute("MsgRegistration",properties.getProperty("MsgRegistration"));
			session.setAttribute("NewUser",properties.getProperty("NewUser"));
			session.setAttribute("User_Menu_Tag",properties.getProperty("User_Menu_Tag"));
			session.setAttribute("Profile_Menu_Tag",properties.getProperty("Profile_Menu_Tag"));
			session.setAttribute("Suscriptor_Menu_Tag",properties.getProperty("Suscriptor_Menu_Tag"));
			session.setAttribute("List_Menu_Tag",properties.getProperty("List_Menu_Tag"));
			session.setAttribute("Service_Menu_Tag",properties.getProperty("Service_Menu_Tag"));
			session.setAttribute("Broadcast_Menu_Tag",properties.getProperty("Broadcast_Menu_Tag"));
			session.setAttribute("Credits_Menu_Tag",properties.getProperty("Credits_Menu_Tag"));
			session.setAttribute("Report_Menu_Tag",properties.getProperty("Report_Menu_Tag"));
			session.setAttribute("Id",properties.getProperty("Id"));
			session.setAttribute("Suscriptor_Table_Service",properties.getProperty("Suscriptor_Table_Service"));
			session.setAttribute("Suscriptor_Table_Opt-in",properties.getProperty("Suscriptor_Table_Opt-in"));
			session.setAttribute("Suscriptor_Table_Device",properties.getProperty("Suscriptor_Table_Device"));
			session.setAttribute("Broadcast_Send_Button_Tag",properties.getProperty("Broadcast_Send_Button_Tag"));
			session.setAttribute("InvalidPwdorEmail",properties.getProperty("InvalidPwdorEmail"));
			session.setAttribute("Validate",properties.getProperty("Validate"));
			session.setAttribute("alreadyExist",properties.getProperty("alreadyExist"));
			session.setAttribute("Suscriptor_Table_Details_tittle",properties.getProperty("Suscriptor_Table_Details_tittle"));
			session.setAttribute("PwdNotNull",properties.getProperty("PwdNotNull"));
			session.setAttribute("EmailNotNull",properties.getProperty("EmailNotNull"));
			session.setAttribute("ErrorRPwdNULL",properties.getProperty("ErrorRPwdNULL"));
			session.setAttribute("ErrorREmailRNULL",properties.getProperty("ErrorREmailRNULL"));
			session.setAttribute("ErrorRNameNULL",properties.getProperty("ErrorRNameNULL"));
			session.setAttribute("ErrorRLastNameNULL",properties.getProperty("ErrorRLastNameNULL"));
			session.setAttribute("ErrorRZipNULL",properties.getProperty("ErrorRZipNULL"));
			session.setAttribute("ErrorRAddressNULL",properties.getProperty("ErrorRAddressNULL"));
			session.setAttribute("ErrorRMCNULL",properties.getProperty("ErrorRMCNULL"));
			session.setAttribute("ErrorRPWDNM",properties.getProperty("ErrorRPWDNM"));
			session.setAttribute("ErrorRBCNULL",properties.getProperty("ErrorRBCNULL"));
			session.setAttribute("BC0",properties.getProperty("BC0"));
			session.setAttribute("BC1",properties.getProperty("BC1"));
			session.setAttribute("BC2",properties.getProperty("BC2"));
			session.setAttribute("BC3",properties.getProperty("BC3"));
			session.setAttribute("BC4",properties.getProperty("BC4"));
			session.setAttribute("BC5",properties.getProperty("BC5"));
			session.setAttribute("BC6",properties.getProperty("BC6"));
			session.setAttribute("BC7",properties.getProperty("BC7"));
			session.setAttribute("BC8",properties.getProperty("BC8"));
			session.setAttribute("BC9",properties.getProperty("BC9"));
			session.setAttribute("BC10",properties.getProperty("BC10"));
			session.setAttribute("BC11",properties.getProperty("BC11"));
			session.setAttribute("BC12",properties.getProperty("BC12"));
			session.setAttribute("BC13",properties.getProperty("BC13"));
			session.setAttribute("BC14",properties.getProperty("BC14"));
			session.setAttribute("BC15",properties.getProperty("BC15"));
			session.setAttribute("BC16",properties.getProperty("BC16"));
			session.setAttribute("BC17",properties.getProperty("BC17"));
			session.setAttribute("BC18",properties.getProperty("BC18"));
			session.setAttribute("BC19",properties.getProperty("BC19"));
			session.setAttribute("ChgPwd",properties.getProperty("ChgPwd"));
			session.setAttribute("Alias",properties.getProperty("Alias"));
			session.setAttribute("Type",properties.getProperty("Type"));
			session.setAttribute("Status",properties.getProperty("Status"));
			session.setAttribute("Service_Table_Details_tittle",properties.getProperty("Service_Table_Details_tittle"));
			session.setAttribute("invalidToken",properties.getProperty("invalidToken"));
			session.setAttribute("OK",properties.getProperty("OK"));
			session.setAttribute("CreditsAvailable",properties.getProperty("CreditsAvailable"));
			session.setAttribute("BuyCredits",properties.getProperty("BuyCredits"));
			session.setAttribute("CreditTittle",properties.getProperty("CreditTittle"));
			session.setAttribute("CreditsMessage",properties.getProperty("CreditsMessage"));
			session.setAttribute("Number",properties.getProperty("Number"));
			session.setAttribute("AreYouSure",properties.getProperty("AreYouSure"));
			session.setAttribute("Description",properties.getProperty("Description"));
			session.setAttribute("Icon",properties.getProperty("Icon"));
			session.setAttribute("OnDemandMSG",properties.getProperty("OnDemand"));
			session.setAttribute("Subscription",properties.getProperty("Subscription"));
			session.setAttribute("SubscriptionMSG",properties.getProperty("SubscriptionMSG"));
			session.setAttribute("PublishedMSG",properties.getProperty("Published"));
			session.setAttribute("CanceledMSG",properties.getProperty("Canceled"));
			session.setAttribute("FinishedMSG",properties.getProperty("Finished"));
			session.setAttribute("Cancel",properties.getProperty("Cancel"));
			session.setAttribute("Add",properties.getProperty("Add"));
			session.setAttribute("Export",properties.getProperty("Export"));
			session.setAttribute("Newgroup",properties.getProperty("Newgroup"));
			session.setAttribute("Publish",properties.getProperty("Publish"));
			session.setAttribute("Selectone",properties.getProperty("Selectone"));
			session.setAttribute("Ondemand",properties.getProperty("Ondemand"));
			session.setAttribute("Webservice",properties.getProperty("Webservice"));
			session.setAttribute("urlto",properties.getProperty("urlto"));
			session.setAttribute("Advmsg",properties.getProperty("Advmsg"));
			session.setAttribute("Indexmsg",properties.getProperty("Indexmsg"));
			session.setAttribute("Help",properties.getProperty("Help"));
			session.setAttribute("City",properties.getProperty("City"));
			session.setAttribute("Country",properties.getProperty("Country"));
			session.setAttribute("Text",properties.getProperty("Text"));
			session.setAttribute("Save",properties.getProperty("Save"));
			session.setAttribute("Htmlurl",properties.getProperty("Htmlurl"));
			session.setAttribute("Test",properties.getProperty("Test"));
			session.setAttribute("Svdtmp",properties.getProperty("Svdtmp"));
			session.setAttribute("Txttmp",properties.getProperty("Txttmp"));
			session.setAttribute("Setmsg",properties.getProperty("Setmsg"));
			session.setAttribute("Newmsg",properties.getProperty("Newmsg"));
			session.setAttribute("Fromtmp",properties.getProperty("Fromtmp"));
			session.setAttribute("Canwrite",properties.getProperty("Canwrite"));
			session.setAttribute("Htmltmp",properties.getProperty("Htmltmp"));
			session.setAttribute("Selcrecp",properties.getProperty("Selcrecp"));
			session.setAttribute("Allsubs",properties.getProperty("Allsubs"));
			session.setAttribute("Peralert",properties.getProperty("Peralert"));
			session.setAttribute("PeralertQ",properties.getProperty("PeralertQ"));
			session.setAttribute("File",properties.getProperty("File"));
			session.setAttribute("Sendalert",properties.getProperty("Sendalert"));
			session.setAttribute("Sendalertmsg",properties.getProperty("Sendalertmsg"));
			session.setAttribute("Now",properties.getProperty("Now"));
			session.setAttribute("Date",properties.getProperty("Date"));
			session.setAttribute("Restrict",properties.getProperty("Restrict"));
			session.setAttribute("Norestrict",properties.getProperty("Norestrict"));
			session.setAttribute("Strtime",properties.getProperty("Strtime"));
			session.setAttribute("Endtime",properties.getProperty("Endtime"));
			session.setAttribute("Step",properties.getProperty("Step"));
			session.setAttribute("Next",properties.getProperty("Next"));
			session.setAttribute("Back",properties.getProperty("Back"));
			session.setAttribute("Newserv",properties.getProperty("Newserv"));
			session.setAttribute("Credit",properties.getProperty("Credit"));
			session.setAttribute("Dislist",properties.getProperty("Dislist"));
			session.setAttribute("Services",properties.getProperty("Services"));
			session.setAttribute("Groups",properties.getProperty("Groups"));
			session.setAttribute("Individual",properties.getProperty("Individual"));			
			session.setAttribute("Buycredit",properties.getProperty("Buycredit"));
			session.setAttribute("Subject",properties.getProperty("Subject"));
			session.setAttribute("Subjectmsg",properties.getProperty("Subjectmsg"));
			session.setAttribute("Editprofile",properties.getProperty("Editprofile"));
			session.setAttribute("Allrequired",properties.getProperty("Allrequired"));
			session.setAttribute("Nopersonalized",properties.getProperty("Nopersonalized"));
			session.setAttribute("NoCredits",properties.getProperty("NoCredits"));
			session.setAttribute("Optin",properties.getProperty("Optin"));
			session.setAttribute("Pending",properties.getProperty("Pending"));
			session.setAttribute("Completed",properties.getProperty("Completed"));
			session.setAttribute("Processing",properties.getProperty("Processing"));
			session.setAttribute("Sleeping",properties.getProperty("Sleeping"));
			session.setAttribute("Begin_Date",properties.getProperty("Begin_Date"));
			session.setAttribute("Expected_Messages",properties.getProperty("Expected_Messages"));
			session.setAttribute("Msgs_Sent",properties.getProperty("Msgs_Sent"));
			session.setAttribute("Msgs_failed",properties.getProperty("Msgs_failed"));
			session.setAttribute("%",properties.getProperty("%"));
			session.setAttribute("RestrictedDays",properties.getProperty("RestrictedDays"));
			session.setAttribute("NoSubject",properties.getProperty("NoSubject"));
			session.setAttribute("NoText",properties.getProperty("NoText"));
			session.setAttribute("NoService",properties.getProperty("NoService"));
			session.setAttribute("Dateon",properties.getProperty("Dateon"));			
			session.setAttribute("Monday",properties.getProperty("Monday"));
			session.setAttribute("Tuesday",properties.getProperty("Tuesday"));
			session.setAttribute("Wednesday",properties.getProperty("Wednesday"));
			session.setAttribute("Thursday",properties.getProperty("Thursday"));
			session.setAttribute("Friday",properties.getProperty("Friday"));
			session.setAttribute("Saturday",properties.getProperty("Saturday"));
			session.setAttribute("Sunday",properties.getProperty("Sunday"));
			session.setAttribute("Addalert",properties.getProperty("Addalert"));
			session.setAttribute("Allfields",properties.getProperty("Allfields"));
			session.setAttribute("Loyaltytitle",properties.getProperty("Loyaltytitle"));			
			session.setAttribute("Suscriptor_Table_Alias",properties.getProperty("Suscriptor_Table_Alias"));		
			session.setAttribute("Registermsg",properties.getProperty("Registermsg"));			
			session.setAttribute("Clicktochange",properties.getProperty("Clicktochange"));
			session.setAttribute("AlreadyExistService",properties.getProperty("AlreadyExistService"));
			session.setAttribute("BusinessName",properties.getProperty("BusinessName"));
			session.setAttribute("LocationRelevant",properties.getProperty("LocationRelevant"));
			session.setAttribute("NoUrl",properties.getProperty("NoUrl"));
			session.setAttribute("Newalerthelp",properties.getProperty("Newalerthelp"));
			session.setAttribute("NewcampName",properties.getProperty("NewcampName"));
			session.setAttribute("NewcampDesc",properties.getProperty("NewcampDesc"));
			session.setAttribute("NewcampIcon",properties.getProperty("NewcampIcon"));
			session.setAttribute("NewcampAdvc",properties.getProperty("NewcampAdvc"));
			session.setAttribute("NewcampButton",properties.getProperty("NewcampButton"));
			session.setAttribute("Registerhelploc",properties.getProperty("Registerhelploc"));
			session.setAttribute("Notification",properties.getProperty("Notification"));
			session.setAttribute("Qrcodeexplain",properties.getProperty("Qrcodeexplain"));
			session.setAttribute("Changecountry",properties.getProperty("Changecountry"));
			session.setAttribute("Businesscat",properties.getProperty("Businesscat"));
			session.setAttribute("Buycreditsmsg",properties.getProperty("Buycreditsmsg"));
			session.setAttribute("Buycreditsmsg2",properties.getProperty("Buycreditsmsg2"));
			session.setAttribute("ErrorServiceNameNULL",properties.getProperty("ErrorServiceNameNULL"));
			session.setAttribute("Delivered",properties.getProperty("Delivered"));
			session.setAttribute("Logo",properties.getProperty("Logo"));
			session.setAttribute("Refresh",properties.getProperty("Refresh"));	
			session.setAttribute("ReloadTable",properties.getProperty("ReloadTable"));
			session.setAttribute("BuyNow",properties.getProperty("BuyNow"));
			session.setAttribute("PaymentTypes",properties.getProperty("PaymentTypes"));
			session.setAttribute(",",properties.getProperty(","));
			session.setAttribute(".",properties.getProperty("."));
			session.setAttribute("ProfileMsg",properties.getProperty("ProfileMsg"));
			session.setAttribute("Search",properties.getProperty("Search"));
			session.setAttribute("TableInfoEmpty",properties.getProperty("TableInfoEmpty"));
			session.setAttribute("TableInfo",properties.getProperty("TableInfo"));
			session.setAttribute("TableInfoFiltered",properties.getProperty("TableInfoFiltered"));
			session.setAttribute("TableProcessing",properties.getProperty("TableProcessing"));
			session.setAttribute("TableZeroRecords",properties.getProperty("TableZeroRecords"));
			session.setAttribute("Transaction",properties.getProperty("Transaction"));
			session.setAttribute("QRcode",properties.getProperty("QRcode"));
			session.setAttribute("BuycreditsmsgIpad",properties.getProperty("BuycreditsmsgIpad"));
			session.setAttribute("Buycreditsmsg2Ipad",properties.getProperty("Buycreditsmsg2Ipad"));
			session.setAttribute("EnterpriseLogo",properties.getProperty("EnterpriseLogo"));
			session.setAttribute("UploadFile",properties.getProperty("UploadFile"));	
			session.setAttribute("AboutUs",properties.getProperty("AboutUs"));
			session.setAttribute("Pricing",properties.getProperty("Pricing"));
			session.setAttribute("FAQ",properties.getProperty("FAQ"));
			session.setAttribute("ContactUs",properties.getProperty("ContactUs"));
			session.setAttribute("WhatsNew",properties.getProperty("WhatsNew"));
			session.setAttribute("ResellerProgram",properties.getProperty("ResellerProgram"));
			session.setAttribute("TermsofService",properties.getProperty("TermsofService"));
			session.setAttribute("Adivisionof",properties.getProperty("Adivisionof"));
			session.setAttribute("Delete",properties.getProperty("Delete"));
			session.setAttribute("ServiceDeleteConfirm",properties.getProperty("ServiceDeleteConfirm"));
			session.setAttribute("FlyerText",properties.getProperty("FlyerText"));
			session.setAttribute("Share",properties.getProperty("Share"));
			session.setAttribute("FlyerPrintSave",properties.getProperty("FlyerPrintSave"));
			session.setAttribute("Close",properties.getProperty("Close"));
			session.setAttribute("Flyer_Menu_Tag",properties.getProperty("Flyer_Menu_Tag"));	
			session.setAttribute("DragUploadText",properties.getProperty("DragUploadText"));
			session.setAttribute("UploadTypeErrorText",properties.getProperty("UploadTypeErrorText"));
			session.setAttribute("UploadTypeErrorTextEnd",properties.getProperty("UploadTypeErrorTextEnd"));
			session.setAttribute("UploadSizeError",properties.getProperty("UploadSizeError"));
			session.setAttribute("UploadMinSizeError",properties.getProperty("UploadMinSizeError"));
			session.setAttribute("UploadEmptyError",properties.getProperty("UploadEmptyError"));
			session.setAttribute("UploadOnLeave",properties.getProperty("UploadOnLeave"));
			session.setAttribute("OKButton", properties.getProperty("OKButton"));
			session.setAttribute("PrivateLoyappty", properties.getProperty("PrivateLoyappty"));
			session.setAttribute("ErrorServiceCodeNULL", properties.getProperty("ErrorServiceCodeNULL"));
			session.setAttribute("ErrorServiceMsNULL", properties.getProperty("ErrorServiceMsNULL"));
			session.setAttribute("Random", properties.getProperty("Random"));
			session.setAttribute("CodeLabel", properties.getProperty("CodeLabel"));
			session.setAttribute("Use", properties.getProperty("Use"));
			session.setAttribute("PrivateHelpMsg", properties.getProperty("PrivateHelpMsg"));
			session.setAttribute("Private", properties.getProperty("Private"));
			session.setAttribute("Public", properties.getProperty("Public"));
			session.setAttribute("Visibility", properties.getProperty("Visibility"));
			session.setAttribute("AddPrivateCode", properties.getProperty("AddPrivateCode"));
			session.setAttribute("DeletePrivateCode", properties.getProperty("DeletePrivateCode"));
			session.setAttribute("ValidateMsg", properties.getProperty("ValidateMsg"));
			session.setAttribute("CheckValidateMsg", properties.getProperty("CheckValidateMsg"));
			session.setAttribute("CheckValidateSendMsg", properties.getProperty("CheckValidateSendMsg"));
			session.setAttribute("CheckValidateEmailTitleAlert", properties.getProperty("CheckValidateEmailTitleAlert"));
			session.setAttribute("CheckValidateEmailMsgAlert", properties.getProperty("CheckValidateEmailMsgAlert"));
			session.setAttribute("CheckValidateEmailHelp", properties.getProperty("CheckValidateEmailHelp"));
			session.setAttribute("PromotionalCode", properties.getProperty("PromotionalCode"));
			session.setAttribute("PromotionalCodeHelp", properties.getProperty("PromotionalCodeHelp"));
			session.setAttribute("RandomCode", properties.getProperty("RandomCode"));
			session.setAttribute("Characters", properties.getProperty("Characters"));
			session.setAttribute("Words", properties.getProperty("Words"));
			session.setAttribute("AuthorizeTwitter", properties.getProperty("AuthorizeTwitter"));
			session.setAttribute("CheckAuthorizeTwitterMsg", properties.getProperty("CheckAuthorizeTwitterMsg"));
			session.setAttribute("AuthorizeTwitterButtonMsg", properties.getProperty("AuthorizeTwitterButtonMsg"));
			session.setAttribute("AuthorizeTwitterHelp", properties.getProperty("AuthorizeTwitterHelp"));
			session.setAttribute("PostTwitter", properties.getProperty("PostTwitter"));
			session.setAttribute("PostFacebook", properties.getProperty("PostFacebook"));
			session.setAttribute("PostEmail", properties.getProperty("PostEmail"));
			session.setAttribute("SubscriptorRequestParameter",properties.getProperty("SubscriptorRequestParameter"));
			session.setAttribute("FirstName",properties.getProperty("FirstName"));
			session.setAttribute("LastName",properties.getProperty("LastName"));
			session.setAttribute("Mobile",properties.getProperty("Mobile"));
			session.setAttribute("FB",properties.getProperty("FB"));
			session.setAttribute("TW",properties.getProperty("TW"));
			session.setAttribute("Other",properties.getProperty("Other"));
			session.setAttribute("RequestSubParameterHelp",properties.getProperty("RequestSubParameterHelp"));		
			session.setAttribute("AuthorizeFacebook",properties.getProperty("AuthorizeFacebook"));		
			session.setAttribute("CheckAuthorizeFacebookMsg",properties.getProperty("CheckAuthorizeFacebookMsg"));		
			session.setAttribute("AuthorizeFacebookButtonMsg",properties.getProperty("AuthorizeFacebookButtonMsg"));		
			session.setAttribute("AuthorizeFacebookHelp",properties.getProperty("AuthorizeFacebookHelp"));		
			session.setAttribute("SubscriptorDialogTittle", properties.getProperty("SubscriptorDialogTittle"));
			session.setAttribute("Facebook", properties.getProperty("Facebook"));
			session.setAttribute("Twitter", properties.getProperty("Twitter"));
			session.setAttribute("Continue", properties.getProperty("Continue"));
			session.setAttribute("flyerScanThis", properties.getProperty("FlyerScanThis"));
			session.setAttribute("LowCreditsDialogTitle", properties.getProperty("LowCreditsDialogTitle"));
			session.setAttribute("BuyLater", properties.getProperty("BuyLater"));
			session.setAttribute("LowOnCredits", properties.getProperty("LowOnCreditsMsg"));
			session.setAttribute("PrepaidCardInvalidParameters", properties.getProperty("PrepaidCardInvalidParameters"));
			session.setAttribute("PrepaidPinCannotValidate", properties.getProperty("PrepaidPinCannotValidate"));
			session.setAttribute("CardId", properties.getProperty("CardId"));
			session.setAttribute("Pin", properties.getProperty("Pin"));
			session.setAttribute("CardIdNotNull", properties.getProperty("CardIdNotNull"));
			session.setAttribute("PinNotNull", properties.getProperty("PinNotNull"));
			session.setAttribute("Subscribe", properties.getProperty("Subscribe"));
			session.setAttribute("PrepaidCardMsg", properties.getProperty("PrepaidCardMsg"));
			session.setAttribute("PrepaidCardMsg2", properties.getProperty("PrepaidCardMsg2"));
			session.setAttribute("PinCodeSuccessfulValidate", properties.getProperty("PinCodeSuccessfulValidate"));
			session.setAttribute("CreditsWebPusrchadeQuestion", properties.getProperty("CreditsWebPusrchadeQuestion"));
			session.setAttribute("CreditsWebPusrchade", properties.getProperty("CreditsWebPusrchade"));
			session.setAttribute("Monthly", properties.getProperty("Monthly"));
			session.setAttribute("Annual", properties.getProperty("Annual"));
			session.setAttribute("Month", properties.getProperty("Month"));
			session.setAttribute("Year", properties.getProperty("Year"));
			session.setAttribute("Activate", properties.getProperty("Activate"));
			session.setAttribute("Purchase", properties.getProperty("Purchase"));
			session.setAttribute("Schedule", properties.getProperty("Schedule"));
			session.setAttribute("Initial", properties.getProperty("Initial"));
			session.setAttribute("Active", properties.getProperty("Active"));
			session.setAttribute("Unsubscribed", properties.getProperty("Unsubscribed"));
			session.setAttribute("MultipleDates", properties.getProperty("MultipleDates"));
			session.setAttribute("PrivateKeyalreadyUsed", properties.getProperty("PrivateKeyalreadyUsed"));
			session.setAttribute("PrepaidCardFrontHelpMsg", properties.getProperty("PrepaidCardFrontHelpMsg"));
			session.setAttribute("PrepaidCardBackHelpMsg", properties.getProperty("PrepaidCardBackHelpMsg"));
			session.setAttribute("PublicTwitterButton", properties.getProperty("PublicTwitterButton"));
			session.setAttribute("PublicFacebookButton", properties.getProperty("PublicFacebookButton"));
			session.setAttribute("PublicMailButton", properties.getProperty("PublicMailButton"));
		%>
		 
<!-- FILEUPLOADER.js -->
<script type="text/javascript">  
//No mover!!! necesario para el idioma
var failedText="<%=(String)session.getAttribute("Msgs_failed")%>";
var cancelText="<%=(String)session.getAttribute("Cancel")%>";

var fileUploadText="<%=(String)session.getAttribute("UploadFile")%>";
var fileDragUploadText="<%=(String)session.getAttribute("DragUploadText")%>";
var UploadTypeErrorText="<%=(String)session.getAttribute("UploadTypeErrorText")%>";
var UploadTypeErrorTextEnd="<%=(String)session.getAttribute("UploadTypeErrorTextEnd")%>";
var UploadSizeError="<%=(String)session.getAttribute("UploadSizeError")%>";
var UploadMinSizeError="<%=(String)session.getAttribute("UploadMinSizeError")%>";
var UploadEmptyError="<%=(String)session.getAttribute("UploadEmptyError")%>";
var UploadOnLeave="<%=(String)session.getAttribute("UploadOnLeave")%>";
$.getScript( "js/libraries/fileuploader.js" , function () { 
}); 
</script>
		
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
 <%@page import="loyapptyWeb.*"  %> 
 <% 
	UrlAssambler url = new UrlAssambler(); 
	ServletCalls call = new ServletCalls();
	String credits=request.getParameter("credits");
	String res=request.getParameter("result");
	
	if(credits!=null && res!=null){
		if(res.equals("OK")){
			String result = call.callServlet(url.addCreditsUrl((String)session.getAttribute("token"),"WEB PURCHASE" ,credits,""));
			((Logger)session.getAttribute("log")).info("User "+(String)session.getAttribute("login")+" has been added "+credits+" credits");
			response.sendRedirect("./main.jsp");
		}
	}
 %>
 
 <%
 	//Twitter
	String oauth_token=request.getParameter("oauth_token");
 	String oauth_verifier=request.getParameter("oauth_verifier");
 	String code=request.getParameter("code");

	if(oauth_token!=null && oauth_verifier!=null){
	    Twitter twitter = new TwitterFactory().getInstance();
	    twitter.setOAuthConsumer((String)session.getAttribute("twitterConsumerKey"), (String)session.getAttribute("twitterConsumerSecret"));
		RequestToken reqToken =new RequestToken(oauth_token, (String)session.getAttribute("twitterConsumerSecret")); 		
		AccessToken accessToken = twitter.getOAuthAccessToken(reqToken, oauth_verifier);
 		String [] tags= new String[3];
 		Xml xml= new Xml();
		String rest="&twTokenId="+accessToken.getToken()+"&twTokenSecret="+accessToken.getTokenSecret()+"&nullClean=false";		
		String result = call.callServlet(url.clientSocialInfoUpdate((String)session.getAttribute("token"), rest));
		tags[0]="status"; 
		tags[1]="reason";
		tags[2]="response";
	 	tags = xml.getTagsContent(result, tags);
	 	if(tags[0].equals("0014")){
			((Logger)session.getAttribute("log")).info("User "+(String)session.getAttribute("login")+" user has approved post in twitter");
	 	}else{
			((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
	 	}			
		response.sendRedirect("./main.jsp");
 	}
	
	//Facebook 
	if(code!=null){
		try {
			String result="";
			String rest="";
			Xml xml= new Xml();
	 		String [] tags= new String[3];
			String arg[]=null;
		    URL urlFB = new URL("https://graph.facebook.com/oauth/access_token?code="+code+"&redirect_uri="+session.getAttribute("thisServerBase")+"main.jsp&&client_cred&client_id="+session.getAttribute("facebookAppId")+"&client_secret="+session.getAttribute("facebookAppSecret"));
			String outputXml="";
			DataInputStream in = new DataInputStream(urlFB.openStream());
			String line = "";
			while ((line = in.readLine()) != null) {
				outputXml += line; 
			}
			in.close();
			arg=outputXml.split("&");
			urlFB = new URL("https://graph.facebook.com/me?access_token="+arg[0].split("=")[1]);
			in = new DataInputStream(urlFB.openStream());
			line = "";
			outputXml="";
			while ((line = in.readLine()) != null) {
				outputXml += line; 
			}
			in.close();	
			JSONObject msg = new JSONObject(outputXml);
			((Logger)session.getAttribute("log")).info("Test "+msg.getString("id"));			
			rest=rest+"&fbUid="+msg.getString("id")+"&fbAccessToken="+arg[0].split("=")[1]+"&nullClean=false";		
			result = call.callServlet(url.clientSocialInfoUpdate((String)session.getAttribute("token"), rest));
			tags[0]="status"; 
			tags[1]="reason";
			tags[2]="response";
		 	tags = xml.getTagsContent(result, tags);
		 	if(tags[0].equals("0014")){
				((Logger)session.getAttribute("log")).info("User "+(String)session.getAttribute("login")+" user has approved post in Facebook");
		 	}else{
				((Logger)session.getAttribute("log")).error("Error "+tags[0]+":"+tags[1]);
		 	}			
			response.sendRedirect("./main.jsp");
		} 
		catch (MalformedURLException e) { 
			((Logger)session.getAttribute("log")).error(e);

		    // new URL() failed
		    // ...
		} 
		catch (IOException e) {   
			((Logger)session.getAttribute("log")).error(e);
		    // openConnection() failed
		    // ...
		}
		
	}
%>
 
     <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
    </style>
 
</head>
<body onload="initialize()">
	<script  type="text/javascript">
		var lifeTime=<%=(String)session.getAttribute("lifeTime") %>;	
		var timeoutHandle =	window.setTimeout(function() {
			$.post('jsp/logoutLogic.jsp',function(msg){
				if(msg.result === 'OK'){
					document.location='./index.jsp';
				}else{
					document.location='./index.jsp';
				}
			},"json");	
		}, lifeTime); 
		
		$( 'body' ).mousemove(function(e){
			$.post('jsp/sessionRefresh.jsp');
			window.clearTimeout(timeoutHandle);
			timeoutHandle = window.setTimeout(function() {
				$.post('jsp/logoutLogic.jsp',function(msg){
					if(msg.result === 'OK'){
						document.location='./index.jsp';
					}else{
						document.location='./index.jsp';
					}
				},"json");	
			}, lifeTime);
		});	
		kendo.culture("es-ES");
	</script>


	<div id="pagewidth">
		<div id="header">
			<div id="logo">
				<a href="#">			
				<img src="" width="150px" height="107px" id="logoimage" alt="logo ogangi" /></a>
			</div>
			<div id="nav">
						<a href="#" id="logout" class="button2" style="text-decoration:none">
							<%=(String)session.getAttribute("Logout")%>
						</a>
			</div>
		</div>

		<!-- fin header-->
		<div id="wrapper" class="clearfix">

			<div id="twocols">
				<div id="maincol">

					<div id="maintabs" class="k-content">
					
						<div id="tabstrip">
							<ul>
								<li id="profiletab" ><%=(String)session.getAttribute("Profile_Menu_Tag")%></li>
								<li id="subscriptortab"><%=(String)session.getAttribute("Suscriptor_Menu_Tag")%></li>
								<li id="servicetab"><%=(String)session.getAttribute("Service_Menu_Tag")%></li>
						<!--	<li id="alertstab"><%=(String)session.getAttribute("Broadcast_Menu_Tag")%></li> -->
						 		<li id="creditstab"><%=(String)session.getAttribute("Credits_Menu_Tag")%></li>
						 		<li id="creditsReporttab"><%=(String)session.getAttribute("Report_Menu_Tag")%></li>
						 		<li id="flyertab"><%=(String)session.getAttribute("Flyer_Menu_Tag")%></li>
							</ul>
						</div>
					</div>
				</div>

				<div id="rightcol">
						
						<div id="credit_block" class="coins_icon"><a href="#" id="credit_link" class="selectTab" style="text-decoration:none;color:#fff;"><input id="tabIndex" value="3" style="display:none" />
						
						<img src="images/coins-icon.png"/>
						<br />
						<span id="credits_aviable_main" style="display:inline;"></span> <%=(String)session.getAttribute("Credit")%>
						<br /><%=(String)session.getAttribute("Buycredit")%></a>
						
						</div>
						
						<script src="http://widgets.twimg.com/j/2/widget.js"></script>
						<script>
								new TWTR.Widget({
								  version: 2,
								  type: 'profile',
								  rpp: 2,
								  interval: 30000,
								  width: 172,
								  height: 180,
								  theme: {
								    shell: {
								      background: '#C5C5C5',
								      color: '#000000'
								    },
								    tweets: {
								      background: '#7a7a7a',
								      color: '#000',
								      links: '#fff'
								    }
								  },
								  features: {
								    scrollbar: false,
								    loop: false,
								    live: false,
								    behavior: 'all'
								  }
								}).render().setUser('loyappty').start();
						</script>

				</div>
			</div>
		</div>
 
 
	<div id="footer">
		<table style="margin: 0 auto;">
			<tr>
				<td align="center">
					<table width="100%" border="0" align="center">
						<tr>
							<td colspan="2" align="center">&nbsp;</td>
						</tr>
						<tr>
					        <td colspan="2" align="center"><a href="about<%=footerExt %>.html" target="_blank"><%=(String)session.getAttribute("AboutUs")%></a> 
					        | <a href="pricing<%=footerExt %>.html" target="_blank"><%=(String)session.getAttribute("Pricing")%></a> 
					        | <a href="faq<%=footerExt %>.html" target="_blank"><%=(String)session.getAttribute("FAQ")%></a> 
					        | <a href="contact<%=footerExt %>.html" target="_blank"><%=(String)session.getAttribute("ContactUs")%></a> <!-- | <a href="#">Support</a> --> 
					        | <a href="press<%=footerExt %>.html" target="_blank"><%=(String)session.getAttribute("WhatsNew")%></a> </td>
						</tr>
						<tr>
							<td colspan="2" align="center"><a href="copyrightpolicy<%=footerExt%>.html" target="_blank">© 2012</a> Loyappty (<%=(String)session.getAttribute("Adivisionof")%> <a href="http://www.ogangi.com" target="_black">Ogangi Corporation</a>)</td>
						</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>  
	</div>
	<div id="dialog_minimum_low_credits" title="<%=(String)session.getAttribute("LowCreditsDialogTitle")%>" style="display:none">
	</div>	

<script type="text/javascript">
	var BuyNow = '<%=(String)session.getAttribute("BuyNow")%>';
	var ok = '<%=(String)session.getAttribute("OKButton")%>';
	var BuyLater = '<%=(String)session.getAttribute("BuyLater")%>';
	var help = '<%=(String)session.getAttribute("Help")%>';
	var notification="<%=(String)session.getAttribute("Notification")%>";
	var del="<%=(String)session.getAttribute("Delete")%>";
	var MinimunCredits='<%=(String)session.getAttribute("MinimumCreditsAlert")%>';
	var isCustomImageMain='<%=(String)session.getAttribute("isCustomImageMain")%>';			
	var NoCreditsMsg="<%=(String)session.getAttribute("NoCredits")%>";
	var LowCreditsMsg="<%=(String)session.getAttribute("LowOnCredits")%>";
	var fileBaseLoad="<%=(String)session.getAttribute("fileBaseLoad")%>";
	
	$.getScript( "js/main.js" , function () { 
	}); 
</script>
</body>
</html>