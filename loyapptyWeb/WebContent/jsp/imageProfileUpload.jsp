<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.io.FilenameUtils" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.lang.Exception" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@page import="org.apache.log4j.*" %>


<%
//	JSONObject msg = new JSONObject();
	InputStream stream = null;
	stream = application.getResourceAsStream("config/var.properties");
	Properties properties = new Properties();
	properties.load(stream);

	String ua = request.getHeader( "User-Agent" );
    boolean isMSIE = ( ua != null && ua.indexOf( "MSIE" ) != -1 );
	PrintWriter writer = null;
	InputStream is = null;	
	FileOutputStream fos = null;

	try {
		writer = response.getWriter();
	} catch (IOException ex) {
	//    log(OctetStreamReader.class.getName() + "has thrown an exception: " + ex.getMessage());
	}
	String filename = "";

	try {
		if( isMSIE ){
			File file ;
			ServletContext context = pageContext.getServletContext();
			String contentType = request.getContentType();
			if ((contentType.indexOf("multipart/form-data") >= 0)) {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				try{ 
					// Parse the request to get file items.
					List fileItems = upload.parseRequest(request);
					// Process the uploaded file items
					Iterator i = fileItems.iterator();
					while ( i.hasNext () ){
						FileItem fi = (FileItem)i.next();
						if ( !fi.isFormField() && fi.getSize() < (1024 * 400 + 1)){
							filename = Long.toString(System. currentTimeMillis())+"EL"+((String)session.getAttribute("login")).replaceAll("@|[.]","")+"."+FilenameUtils.getExtension(fi.getName());
							file = new File( properties.getProperty("fileBaseSave") + filename);
							fi.write( file ) ;
			    			session.setAttribute("fileProfileName",filename);
			    			session.setAttribute("fileBaseSave",properties.getProperty("fileBaseSave"));
			    			response.setStatus(response.SC_OK);
			    			writer.print("{success: true}");
						}else{
							writer.print("{success: false, IESizeMax: true}");
						}						
					}
				}catch(Exception ex) {
		  			((Logger)session.getAttribute("log")).error("Error in File= "+ex);
				}
			}
		}else{	
			filename = Long.toString(System. currentTimeMillis())+"EL"+((String)session.getAttribute("login")).replaceAll("@|[.]","")+"."+FilenameUtils.getExtension(request.getHeader("X-File-Name"));
	    	is = request.getInputStream();
			fos = new FileOutputStream(new File(properties.getProperty("fileBaseSave")+filename));
			IOUtils.copy(is, fos);
			response.setStatus(response.SC_OK);
			session.setAttribute("fileProfileName",filename);
			session.setAttribute("fileBaseSave",properties.getProperty("fileBaseSave"));
			writer.print("{success: true}");
		}
	} catch (FileNotFoundException ex) {
		((Logger)session.getAttribute("log")).error("Error in File= "+ex);
		response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
		writer.print("{success: false}");
	} catch (IOException ex) {
		((Logger)session.getAttribute("log")).error("Error in File= "+ex);
		response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
		writer.print("{success: false}");
	} finally {
    	try {
			if( !isMSIE ){
				fos.close();
				is.close();
			}
		} catch (IOException ignored) {
    	}
	}
	writer.flush();
	writer.close();
%>