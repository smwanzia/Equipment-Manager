/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.text.DateFormat;
import java.util.*;
//import java.util.;

/**
 *
 * @author xmore mmohz
 */
public class Invoice extends Customer {
    //declare variable
    private int id;
    private String invoicedate;
    private Date invoiceDate;
    private String isprocessed;
    private int invoicenumber;
    private List<Item> items;
    //create an instance of customer
    private Customer customer;
    private double fixedAmount;
    private double initialAmount;
    private String paybackpperiod;
    private String invoiceduedate;
    private String rentalenddate;
    private String rentalstartdate;
    private String customerid;
    private String updatedBy;
    private String last_update;
    private String eventlocation;
    private String eventtype;
   
    
    
    public Invoice(){
         super();
         
         
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getLast_update() {
        return last_update;
    }

    public String getEventlocation() {
        return eventlocation;
    }

    public void setEventlocation(String eventlocation) {
        this.eventlocation = eventlocation;
    }

    public String getEventtype() {
        return eventtype;
    }

    public void setEventtype(String eventtype) {
        this.eventtype = eventtype;
    }

    public void setLast_update(String last_update) {
        this.last_update = last_update;
    }

    public String getCustomerid() {
        return customerid;
    }

    public void setCustomerid(String customerid) {
        this.customerid = customerid;
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

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public double getFixedAmount() {
        return fixedAmount;
    }

    public void setFixedAmount(double fixedAmount) {
        this.fixedAmount = fixedAmount;
    }

    public double getInitialAmount() {
        return initialAmount;
    }

    public void setInitialAmount(double initialAmount) {
        this.initialAmount = initialAmount;
    }

    public String getPaybackpperiod() {
        return paybackpperiod;
    }

    public void setPaybackpperiod(String paybackpperiod) {
        this.paybackpperiod = paybackpperiod;
    }

    public String getInvoiceduedate() {
        return invoiceduedate;
    }

    public void setInvoiceduedate(String invoiceduedate) {
        this.invoiceduedate = invoiceduedate;
    }
    
   
    public String getInvoicedate() {
        return invoicedate;
    }

    public void setInvoicedate(String invoicedate) {
       this.invoicedate = invoicedate;
    }
    public String getFormatedDate(){
        DateFormat shortDate=DateFormat.getDateInstance(DateFormat.SHORT);
        return shortDate.format(invoiceDate);
    }
    public Date getInvoiceDate(){
        return invoiceDate;
    }
    public void setInvoiceDate(Date date){ 
        invoiceDate=date;
    }

    public String getIsprocessed() {
        return isprocessed;
    }

    public void setIsprocessed(String isprocessed) {
        this.isprocessed = isprocessed;
    }

    public int getInvoicenumber() {
        return invoicenumber;
    }

    public void setInvoicenumber(int invoicenumber) {
        this.invoicenumber = invoicenumber;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    
    
    
}
