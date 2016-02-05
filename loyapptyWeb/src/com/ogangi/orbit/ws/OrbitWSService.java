/**
 * OrbitWSService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ogangi.orbit.ws;

public interface OrbitWSService extends javax.xml.rpc.Service {
    public java.lang.String getOrbitWSPortAddress();

    public com.ogangi.orbit.ws.OrbitWS getOrbitWSPort() throws javax.xml.rpc.ServiceException;

    public com.ogangi.orbit.ws.OrbitWS getOrbitWSPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
