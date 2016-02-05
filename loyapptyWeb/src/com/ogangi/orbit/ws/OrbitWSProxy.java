package com.ogangi.orbit.ws;

public class OrbitWSProxy implements com.ogangi.orbit.ws.OrbitWS {
  private String _endpoint = null;
  private com.ogangi.orbit.ws.OrbitWS orbitWS = null;
  
  public OrbitWSProxy() {
    _initOrbitWSProxy();
  }
  
  public OrbitWSProxy(String endpoint) {
    _endpoint = endpoint;
    _initOrbitWSProxy();
  }
  
  private void _initOrbitWSProxy() {
    try {
      orbitWS = (new com.ogangi.orbit.ws.OrbitWSServiceLocator()).getOrbitWSPort();
      if (orbitWS != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)orbitWS)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)orbitWS)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (orbitWS != null)
      ((javax.xml.rpc.Stub)orbitWS)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.ogangi.orbit.ws.OrbitWS getOrbitWS() {
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS;
  }
  
  public java.lang.String status(java.lang.String msisdn) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.status(msisdn);
  }
  
  public java.lang.String cancel(java.lang.String msisdn, java.lang.String transactionID) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.cancel(msisdn, transactionID);
  }
  
  public java.lang.String charge(java.lang.String msisdn, java.lang.String pricePoint, java.lang.String discount, java.lang.String mode, java.lang.String serviceType, java.lang.String serviceId, java.lang.Long contentId, java.lang.String billingLiteral) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.charge(msisdn, pricePoint, discount, mode, serviceType, serviceId, contentId, billingLiteral);
  }
  
  public java.lang.String checkBalance(java.lang.String msisdn, java.lang.String pricePoint, java.lang.String serviceId) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.checkBalance(msisdn, pricePoint, serviceId);
  }
  
  public java.lang.String refund(java.lang.String msisdn, java.lang.String transactionID) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.refund(msisdn, transactionID);
  }
  
  public java.lang.String usePromotionCode(java.lang.String msisdn, java.lang.String pricePoint, java.lang.String discount, java.lang.String mode, java.lang.String serviceType, java.lang.String serviceId, java.lang.Long contentId, java.lang.String billingLiteral, java.lang.String promotionCode) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.usePromotionCode(msisdn, pricePoint, discount, mode, serviceType, serviceId, contentId, billingLiteral, promotionCode);
  }
  
  public java.lang.String createPromotionCode(java.lang.String msisdn, java.lang.String serviceId, java.util.Calendar startDate, java.util.Calendar endDate, double percentage, int triesAvailables, int type, boolean verifyMsisdn, int codeLength) throws java.rmi.RemoteException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.createPromotionCode(msisdn, serviceId, startDate, endDate, percentage, triesAvailables, type, verifyMsisdn, codeLength);
  }
  
  public java.lang.String validatePinCard(java.lang.String id, java.lang.String pin, java.lang.String client, java.lang.String user) throws java.rmi.RemoteException, com.ogangi.orbit.ws.IOException{
    if (orbitWS == null)
      _initOrbitWSProxy();
    return orbitWS.validatePinCard(id, pin, client, user);
  }
  
  
}