/*
 * 
 *   Autor: Andrés Mariño
 * grigri13@gmail.com / ogangico
 * http://staging.ogangi.com/loyapptyWeb/
 * */

package loyapptyWeb;
 
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import org.codehaus.jettison.json.JSONObject;


public class UrlAssambler {
	//Load Server Base
//	private String base="https://loyappty.ogangi.com:8443/loyappty/";
	private String base="https://staging.ogangi.com:8443/Ego/";
	
	//Login Url, Input: email, password
	public URL loginUrl(String email, String pwd)throws IOException{
		URL url = new URL(base+"service?action=login&email="+URLEncoder.encode(email)+"&password="+URLEncoder.encode(pwd));
		return url;
	}

	public URL  countriesLoadUrl()throws IOException{
		URL url = new URL(base+"service?action=listCountries");
		return url; 
	}

	public URL  citiesLoadUrl(String country)throws IOException{
		URL url = new URL(base+"service?action=listCities&countryIsoCode="+URLEncoder.encode(country));
		return url; 
	}
		
	public URL forgotPasswordUrl(String email, String language)throws IOException{
		URL url = new URL(base+"service?action=forgotPassword&email="+URLEncoder.encode(email)+"&language="+language);
		return url;
	}
	
	public URL registerClientUrl(String [] arg)throws IOException{
		URL url = new URL(base+"service?action=registerDefaultClient&name="+URLEncoder.encode(arg[0])+"&password="+URLEncoder.encode(arg[1])+"&mainContact="+URLEncoder.encode(arg[4])+"&categoryId="+URLEncoder.encode(arg[2])+"&website="+URLEncoder.encode(arg[3])+"&email="+URLEncoder.encode(arg[4])+"&cityId=105755&locationRelevant="+arg[5]+"&initialCredits="+arg[6]+"&otherContact=N/A"+"&promotionalCode="+URLEncoder.encode(arg[7])+"&latitude=25.792782&longitude=-80.226116"+arg[8]);
		return url;
	}
	
	public URL serviceLoadUrl(String id)throws IOException{
		URL url = new URL(base+"service?action=listServices&clientId="+id+"&excludeStatus=2");
		return url;
	}
	
	public URL serviceEditUrl(JSONObject arg)throws IOException{
		URL url=null;
		try{
			url = new URL(base+"service?action=editService&clientId="+URLEncoder.encode(arg.getString("clientId"))+"&serviceId="+URLEncoder.encode(arg.getString("serviceId"))+"&name="+URLEncoder.encode(arg.getString("name"))+"&serviceType="+arg.getString("type")+"&alias="+URLEncoder.encode(arg.getString("alias"))+arg.getString("WebOptIn")+"&publish="+arg.getString("publish")+"&description="+URLEncoder.encode(arg.getString("description"))+arg.getString("logo")+"&private="+arg.getString("isPrivate")+arg.getString("codes"));
			return url;
		}catch(Exception e){
			e.printStackTrace();
			return url;
		}

	}

	public URL serviceAddUrl(JSONObject arg)throws IOException{
		URL url=null;
		try{
			url = new URL(base+"service?action=createService&clientId="+URLEncoder.encode(arg.getString("id"))+"&name="+URLEncoder.encode(arg.getString("name"))+"&serviceType="+arg.getString("type")+"&alias="+URLEncoder.encode(arg.getString("alias"))+arg.getString("WebOptIn")+"&publish="+arg.getString("publish")+"&description="+URLEncoder.encode(arg.getString("description"))+arg.getString("logo")+"&private="+arg.getString("isPrivate")+arg.getString("codes"));
			return url;
		}catch(Exception e){
			return url;
		}
	}

	public URL profileReviewUrl(String id )throws IOException{
		URL url = new URL(base+"service?action=getClientInfo&clientId="+URLEncoder.encode(id));
		return url;
	}

	public URL profileReviewGeneric(String searchBy, String value )throws IOException{
		URL url = new URL(base+"service?action=getClientInfo&"+searchBy+"="+URLEncoder.encode(value));
		return url;
	}	
	
//	https://staging.ogangi.com:8443/Ego/service?action=getClientInfo&facebook=538421174
	
	public URL editProfileUrl(String id, String type,String value)throws IOException{
		URL url = new URL(base+"service?action=editClient&clientId="+URLEncoder.encode(id)+"&"+type+"="+URLEncoder.encode(value));
		return url;
	}
	
	public URL profileEditAllUrl(JSONObject arg){
		URL url=null;
		try{
			url = new URL(base+"service?action=editClient&clientId="+URLEncoder.encode(arg.getString("id"))+"&name="+URLEncoder.encode(arg.getString("name"))+"&address="+URLEncoder.encode(arg.getString("address"))+"&description="+URLEncoder.encode(arg.getString("description"))+"&zip="+URLEncoder.encode(arg.getString("zip"))+"&mainContact="+URLEncoder.encode(arg.getString("mainContact"))+"&category="+URLEncoder.encode(arg.getString("category"))+"&otherContact="+URLEncoder.encode(arg.getString("otherContact"))+"&cityId="+URLEncoder.encode(arg.getString("cityId"))+"&locationRelevant="+URLEncoder.encode(arg.getString("locationRelevant"))+"&email="+URLEncoder.encode(arg.getString("email"))+"&website="+URLEncoder.encode(arg.getString("website"))+"&promotionalCode="+URLEncoder.encode(arg.getString("promotionalCode"))+arg.getString("enterpriseLogo")+arg.getString("keys")+arg.getString("facebook")+arg.getString("twitter"));
			return url;
		}catch(Exception e){
			System.out.println("aqui");
			return url;
		}
	}
	
	public URL sendBroadcastUrl(String clientId, String text, String rest)throws IOException{
		URL url = new URL(base+"service?action=sendMessage&text="+URLEncoder.encode(text)+"&clientId="+URLEncoder.encode(clientId)+rest);		
		return url;
	}
	
	public URL creditsReviewUrl(String clientId)throws IOException{
		URL url = new URL(base+"service?action=consultCredits&clientId="+URLEncoder.encode(clientId));		
		return url;
	}
	
	public URL subscriptorReviewUrl(String clientId)throws IOException{
		URL url = new URL(base+"service?action=listUsers&clientId="+URLEncoder.encode(clientId)+"&serviceId=-1");		
		return url;
	}

	public URL schedulesListUrl(String clientId)throws IOException{
		URL url = new URL(base+"service?action=listSchedules&clientId="+URLEncoder.encode(clientId));
		return url;
	}
	
	public URL addCreditsUrl(String clientId, String amount, String origin, String expiration)throws IOException{
		URL url = new URL(base+"service?action=addCredits&clientId="+URLEncoder.encode(clientId)+"&amount="+URLEncoder.encode(amount)+"&origin="+origin+"&expiration="+expiration);
		return url;
	}
	
	public URL creditsReportUrl(String clientId)throws IOException{
		URL url = new URL(base+"service?action=creditsReport&clientId="+URLEncoder.encode(clientId)+"&from=01012012");
		return url;
	}
	
	public URL serviceCodesRevirew(String serviceId)throws IOException{
		URL url = new URL(base+"service?action=listServicesKeys&serviceId="+URLEncoder.encode(serviceId));
		return url;
	}
	
	public URL validateEmail(String clientId, String language)throws IOException{
		URL url = new URL(base+"service?action=sendEmailVerification&clientId="+URLEncoder.encode(clientId)+"&language="+URLEncoder.encode(language));
		return url;
	}	
	
	public URL checkValidEmail(String clientId)throws IOException{
		URL url = new URL(base+"service?action=isEmailVerified&clientId="+URLEncoder.encode(clientId));
		return url;
	}	
	
//	cId, latitude y longitude
	public URL updateGeoInformation(String clientId, String latitude, String longitude)throws IOException{
		URL url = new URL(base+"service?action=updateGeoInformation&clientId="+URLEncoder.encode(clientId)+"&latitude="+URLEncoder.encode(latitude)+"&longitude="+URLEncoder.encode(longitude));
		return url;
	}
	
	public URL validateEmailSecondStep(String clientId, String challenge)throws IOException{
		URL url = new URL(base+"service?action=vce&clientId="+URLEncoder.encode(clientId)+"&challenge="+URLEncoder.encode(challenge));
		return url;
	}
	
	public URL clientSocialInfoUpdate(String clientId, String rest)throws IOException{
		URL url = new URL(base+"service?action=setClientSocialInformation&clientId="+URLEncoder.encode(clientId)+rest);
		return url;
	}
	
	public URL profileReviewSocialInfo(String clientId)throws IOException{
		URL url = new URL(base+"service?action=getClientSocialInformation&clientId="+clientId);
		return url;
	}
	
	public URL profileReviewSubscriptorParameters(String clientId)throws IOException{
		URL url = new URL(base+"service?action=getClientRequestParameters&clientId="+clientId);
		return url;
	}

	public URL subscriberReviewParameters(String userId, String clientId)throws IOException{
		URL url = new URL(base+"service?action=getUserParametersByClient&userId="+userId+"&clientId="+clientId);
		return url;
	}	

	// getBusinessLogo URL Input:Business Name
	public URL getLogoImage(String name)throws IOException{
		URL url = new URL(base+"service?action=getBusinessLogo&name="+name);
		return url;
	}
	
	//isClientSubscribe URL Input: ClientId
	public URL isClientSubscribe(String clientId)throws IOException{
		URL url = new URL(base+"service?action=hasBillSubscription&clientId="+clientId);
		return url;
	}	
}