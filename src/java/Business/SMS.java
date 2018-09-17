/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.util.Date;

/**
 *
 * @author xmore mmohz
 */


/**
 *
 * @author xmore mmohz
 */
public class SMS {
  private int smsId;
    private Date date;
    private String recipientMsisdn;
    private String recipientName;
    private String recipientLink;
    private String senderMsisdn;
    private String senderName;
    private String senderLink;
    private String status;
    private String type;
    private String content;
    private String action;
    private String subject;
    
    public void SMS(){
        smsId = 0;
       recipientMsisdn = "";
        recipientName = "";
        recipientLink = "";
        senderMsisdn = "";
        senderName = "";
        senderLink = "";
        status = "";
        type = "";
        content = "";
        action = "";
        subject = "";
        date = new Date();
    }
    
    public void setSmsId(int id){
        smsId = id;
    }
    public int getSmsId(){
        return smsId;
    }
    
    public void setDate(Date d){
        date = d;
    }
    public void setDate(long d){
        date = new Date(d);
    }
    public Date getDate(){
        return date;
    }
    
    public void setRecipientMsisdn(String msisdn){
        recipientMsisdn = msisdn;
    }
    public String getRecipientMsisdn(){
        return recipientMsisdn;
    }
    
    public void setRecipientName(String name){
        recipientName = name;
    }
    public String getRecipientName(){
        return recipientName;
    }
    
    public void setRecipientLink(String link){
        recipientLink = link;
    }
    public String getRecipientLink(){
        return recipientLink;
    }
    
    public void setSenderMsisdn(String msisdn){
        senderMsisdn = msisdn;
    }
    public String getSenderMsisdn(){
        return senderMsisdn;
    }
    
    public void setSenderName(String name){
        senderName = name;
    }
    public String getSenderName(){
        return senderName;
    }
    
    public void setSenderLink(String link){
        senderLink = link;
    }
    public String getSenderLink(){
        return senderLink;
    }
    
    public void setStatus(int s){
        if(s==0){
            status = "Draft";
        }else if(s==1){
            status = "Received";
        }else if(s==2){
            status = "Outbox";
        }else if(s==3){
            status = "Pending";
        }else if(s==4){
            status = "Sent";
        }else if(s==5){
            status = "Delivered";
        }else if(s==6){
            status = "Re-Trying";
        }else if(s==7){
            status = "Aborted";
        }else if(s==8){
            status = "Unknown"; //serious error such as network is down
        }else if(s==9){
            status = "Failed";
        }
    }
    public void setStatus(String s){
        status = s;
    }
    public String getStatus(){
        return status;
    }
    public int getIntStatus(){
        if(status.matches("Draft")){
            return 0;
        }else if(status.matches("Received")){
            return 1;
        }else if(status.matches("Outbox")){
            return 2;
        }else if(status.matches("Pending")){
            return 3;
        }else if(status.matches("Sent")){
            return 4;
        }else if(status.matches("Delivered")){
            return 5;
        }else if(status.matches("Re-Trying")){
            return 6;
        }else if(status.matches("Aborted")){
            return 7;
        }else if(status.matches("Unknown")){
            return 8;
        }else if(status.matches("Failed")){
            return 9;
        }else{
            return 8;
        }
    }
    
    public void setType(int t){
        if(t==2){
            type = "Incoming";
        }else if(t==3){
            type = "Outgoing";
        }
    }
    public void setType(String t){
        type = t;
    }
    public String getType(){
        return type;
    }
    public int getIntType(){
        if(type.matches("Incoming")){
            return 2;
        }else if(type.matches("Outgoing")){
            return 3;
        }else{
            return 0;
        }
    }
    
    public void setContent(String text){
        content = text;
    }
    public String getContent(){
        return content;
    }
    
    public void setAction(String act){
        action = act;
    }
    public String getAction(){
        return action;
    }
    
    public void setSubject(String sub){
        subject = sub;
    }
    public String getSubject(){
        return subject;
    }
}
