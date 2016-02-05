/*
 * 
 *   Autor: Andrés Mariño
 * 
 * */

package loyapptyWeb;
 
import java.net.URL;
import javax.net.ssl.*;
//import javax.security.cert.X509Certificate;
//import javax.net.ssl.X509TrustManager;
///port javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import java.io.DataInputStream;
import java.io.IOException;
//import javax.security.cert.CertificateException;
//import javax.security.cert.*;

public class ServletCalls {
	
	final static HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
	        public boolean verify(String hostname, SSLSession session) {
	                return true;
	        }
	};

	private static void trustAllHosts() {
        // Create a trust manager that does not validate certificate chains
        TrustManager[] trustAllCerts = new TrustManager[] { 		new X509TrustManager() {
                public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                        return new java.security.cert.X509Certificate[] {};
                }

                public void checkClientTrusted(java.security.cert.X509Certificate[] chain,
                	    String authType) throws java.security.cert.CertificateException {
                	    }
                	    
                	    public void checkServerTrusted(java.security.cert.X509Certificate[] chain,
                	    String authType) throws java.security.cert.CertificateException {
                	    }
        } };

        // Install the all-trusting trust manager
        try {
                SSLContext sc = SSLContext.getInstance("TLS");
                sc.init(null, trustAllCerts, new java.security.SecureRandom());
                HttpsURLConnection
                                .setDefaultSSLSocketFactory(sc.getSocketFactory());
        } catch (Exception e) {
                e.printStackTrace();
        }
}
	
	private class CustomizedHostnameVerifier implements HostnameVerifier {
		public boolean verify(String hostname, SSLSession session) {
			return true;
		}
	}

	public String callServlet(URL url) throws IOException {
		trustAllHosts();
		HttpsURLConnection.setDefaultHostnameVerifier(new CustomizedHostnameVerifier());
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setHostnameVerifier(DO_NOT_VERIFY);
		conn.setDoOutput(true);
		conn.setUseCaches(false);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		String outputXml = "";
		DataInputStream in = new DataInputStream(conn.getInputStream());
		String line = "";
		while ((line = in.readLine()) != null) {
			outputXml += line; 
		}
		in.close();
		conn.disconnect();
		return outputXml;
	}
}