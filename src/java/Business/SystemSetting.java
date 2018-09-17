/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

/**
 *
 * @author xmore mmohz
 */
public class SystemSetting {
    
    private String name;
    private String postaladdress;
    private String status;
    private String website;
    private String fax;
    private String email;
    private String emailstatus;
    private String phonenumber;
   private String tellnumber; 
   private String smsstatus;
    
    
   public SystemSetting(){
       
   }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPostaladdress() {
        return postaladdress;
    }

    public void setPostaladdress(String postaladdress) {
        this.postaladdress = postaladdress;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailstatus() {
        return emailstatus;
    }

    public void setEmailstatus(String emailstatus) {
        this.emailstatus = emailstatus;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getTellnumber() {
        return tellnumber;
    }

    public void setTellnumber(String tellnumber) {
        this.tellnumber = tellnumber;
    }

    public String getSmsstatus() {
        return smsstatus;
    }

    public void setSmsstatus(String smsstatus) {
        this.smsstatus = smsstatus;
    }
   
   
}
