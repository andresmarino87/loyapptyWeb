/**
 * OrbitWS.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.ogangi.orbit.ws;

public interface OrbitWS extends java.rmi.Remote {
    public java.lang.String status(java.lang.String msisdn) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException;
    public java.lang.String cancel(java.lang.String msisdn, java.lang.String transactionID) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException;
    public java.lang.String charge(java.lang.String msisdn, java.lang.String pricePoint, java.lang.String discount, java.lang.String mode, java.lang.String serviceType, java.lang.String serviceId, java.lang.Long contentId, java.lang.String billingLiteral) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException;
    public java.lang.String checkBalance(java.lang.String msisdn, java.lang.String pricePoint, java.lang.String serviceId) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException;
    public java.lang.String refund(java.lang.String msisdn, java.lang.String transactionID) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException;
    public java.lang.String usePromotionCode(java.lang.String msisdn, java.lang.String pricePoint, java.lang.String discount, java.lang.String mode, java.lang.String serviceType, java.lang.String serviceId, java.lang.Long contentId, java.lang.String billingLiteral, java.lang.String promotionCode) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException;
    public java.lang.String createPromotionCode(java.lang.String msisdn, java.lang.String serviceId, java.util.Calendar startDate, java.util.Calendar endDate, double percentage, int triesAvailables, int type, boolean verifyMsisdn, int codeLength) throws java.rmi.RemoteException;
    public java.lang.String validatePinCard(java.lang.String id, java.lang.String pin, java.lang.String client, java.lang.String user) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException;
}
