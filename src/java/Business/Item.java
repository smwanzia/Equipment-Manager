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
public class Item {
    private String productCode;
    private double price;
    private String name;
    private String description;
    private int quantity;
    private String lastupdate;
    private String categoryid;
   
    
    public  Item(String aproductcode,double aprice,String adescription,String aname,int aquantity,String alastupdate,String acategoryid){
        productCode = aproductcode;
        description = adescription;
        name = aname;
        lastupdate = alastupdate;
        categoryid = acategoryid;
        price = aprice;
        quantity = aquantity;
         
    }
    public Item(){
        
    }

    // Make get/set methods so the attributes will appear
    // as bean attributes.
    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getLastupdate() {
        return lastupdate;
    }

    public void setLastupdate(String lastupdate) {
        this.lastupdate = lastupdate;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }
    public double getTotal(){
       double total=this.price*this.quantity;
       return total;
    }
    public void setTotal(double totall){
        totall=totall;   
}
}
