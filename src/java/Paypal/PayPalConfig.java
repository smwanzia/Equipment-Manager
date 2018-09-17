/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paypal;

import javax.servlet.http.*;

public class PayPalConfig {
    
   private String authToken;
   private String posturl;
   private String business;
   private String returnurl;
   private String cancelurl;
   private String cmd;

    public String getAuthToken() {
        return authToken;
    }

    public void setAuthToken(String authToken) {
        this.authToken = authToken;
    }

    public String getPosturl() {
        return posturl;
    }

    public void setPosturl(String posturl) {
        this.posturl = posturl;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    public String getReturnurl() {
        return returnurl;
    }

    public void setReturnurl(String returnurl) {
        this.returnurl = returnurl;
    }

    public String getCancelurl() {
        return cancelurl;
    }

    public void setCancelurl(String cancelurl) {
        this.cancelurl = cancelurl;
    }

    public String getCmd() {
        return cmd;
    }

    public void setCmd(String cmd) {
        this.cmd = cmd;
    }
    
    public PayPalConfig getConfig(HttpServletRequest request){
        PayPalConfig pc= new PayPalConfig();
        try{
            pc.authToken=request.getServletContext().getInitParameter("authtoken");
            pc.posturl=request.getServletContext().getInitParameter("posturl");
            pc.business=request.getServletContext().getInitParameter("business");
            pc.returnurl=request.getServletContext().getInitParameter("returnurl");
            
        }
        catch(Exception ex){
            pc=null;
        }
        return pc;
    }
   
   
   
}
