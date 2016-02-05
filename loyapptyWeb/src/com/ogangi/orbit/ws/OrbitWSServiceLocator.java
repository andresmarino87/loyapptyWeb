/**
 * OrbitWSServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ogangi.orbit.ws;

public class OrbitWSServiceLocator extends org.apache.axis.client.Service implements com.ogangi.orbit.ws.OrbitWSService {

    public OrbitWSServiceLocator() {
    }


    public OrbitWSServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public OrbitWSServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for OrbitWSPort
    private java.lang.String OrbitWSPort_address = "http://backend5.ogangi.com:9004/ORBIT/OrbitWS";

    public java.lang.String getOrbitWSPortAddress() {
        return OrbitWSPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String OrbitWSPortWSDDServiceName = "OrbitWSPort";

    public java.lang.String getOrbitWSPortWSDDServiceName() {
        return OrbitWSPortWSDDServiceName;
    }

    public void setOrbitWSPortWSDDServiceName(java.lang.String name) {
        OrbitWSPortWSDDServiceName = name;
    }

    public com.ogangi.orbit.ws.OrbitWS getOrbitWSPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(OrbitWSPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getOrbitWSPort(endpoint);
    }

    public com.ogangi.orbit.ws.OrbitWS getOrbitWSPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.ogangi.orbit.ws.OrbitWSPortBindingStub _stub = new com.ogangi.orbit.ws.OrbitWSPortBindingStub(portAddress, this);
            _stub.setPortName(getOrbitWSPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setOrbitWSPortEndpointAddress(java.lang.String address) {
        OrbitWSPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.ogangi.orbit.ws.OrbitWS.class.isAssignableFrom(serviceEndpointInterface)) {
                com.ogangi.orbit.ws.OrbitWSPortBindingStub _stub = new com.ogangi.orbit.ws.OrbitWSPortBindingStub(new java.net.URL(OrbitWSPort_address), this);
                _stub.setPortName(getOrbitWSPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("OrbitWSPort".equals(inputPortName)) {
            return getOrbitWSPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://ws.orbit.ogangi.com/", "OrbitWSService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://ws.orbit.ogangi.com/", "OrbitWSPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("OrbitWSPort".equals(portName)) {
            setOrbitWSPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
