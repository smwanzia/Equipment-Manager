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
public class Customer extends AdminUsers {
    private int idno;
    private String homeaddress;
    private String city;
    private String gender;
    private String fax;
    private String preferredmethodofcontact;
    private String rentalenddate;
    private String rentalstartdate;
    private String company;
    private String county;
    private String eventtype;
    
    public Customer(){
        //inherit adminuser attributes and behaviour
        super();
        idno=0;
        homeaddress="";
        city="";
        company="";
        county="";
        rentalstartdate="";
        rentalenddate="";
        preferredmethodofcontact="";
        eventtype="";
        
    }

    public String getEventtype() {
        return eventtype;
    }

    public void setEventtype(String eventtype) {
        this.eventtype = eventtype;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getPreferredmethodofcontact() {
        return preferredmethodofcontact;
    }

    public void setPreferredmethodofcontact(String preferredmethodofcontact) {
        this.preferredmethodofcontact = preferredmethodofcontact;
    }

    public String getRentalenddate() {
        return rentalenddate;
    }

    public void setRentalenddate(String rentalenddate) {
        this.rentalenddate = rentalenddate;
    }

    public String getRentalstartdate() {
        return rentalstartdate;
    }

    public void setRentalstartdate(String rentalstartdate) {
        this.rentalstartdate = rentalstartdate;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getIdno() {
        return idno;
    }

    public void setIdno(int idno) {
        this.idno = idno;
    }

    public String getHomeaddress() {
        return homeaddress;
    }

    public void setHomeaddress(String homeaddress) {
        this.homeaddress = homeaddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
}
