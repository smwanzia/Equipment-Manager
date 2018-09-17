/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import java.util.ArrayList;
import Business.Item;
import java.text.NumberFormat;
import java.util.Iterator;

/**
 *
 * @author xmore mmohz
 */
public class ShoppingCart {
    protected ArrayList<Item> items;
    
    public ShoppingCart(){
        //create an instance of the array list 
        items=new ArrayList<>();
    }
    //return items in the array
    public ArrayList<Item> getItems(){
        return items;
    }
    
    //count the number of itemss in the array
    public int getCount(){
      return  items.size();
    }
    
    public double getTotal(){
        //set total as 0 
        double total=0.00;
        //loop throught number of items in the item
        for(Iterator it = this.items.iterator(); it.hasNext(); ){
            Item item = (Item) it.next();
            total += item.getTotal();
        }
        return total;
        
    }
  
     public double getSubTotal(){
        double subtotal=0.00;
        for(Item myitem:this.items){
             subtotal=+myitem.getTotal();
          }
      return subtotal;
    }
    
   /* public double getSubTotal(){
        double subtotal=0.00;
       for(Iterator it = items.iterator(); it.hasNext();){
            Item item = new Item();
            subtotal=item.getPrice() * item.getQuantity();
        }
        return subtotal;
    }
    */
     public double getInvoiceTotals(){
        double invoicetotal=0.00;
        for(Item items : this.items){
            invoicetotal += items.getTotal();
        }
        return invoicetotal;
    }
     
     public String getFormattedTotal(){
         NumberFormat currency=NumberFormat.getCurrencyInstance();
         return currency.format(this.getInvoiceTotals());
     }
    
    public void addItem(Item newitem){
        String code=newitem.getProductCode();
        for(int i=0; i < items.size(); i++){
            Item itm =(Item) items.get(i);
            if(itm.getProductCode().equals(code)){
                int quantity=itm.getQuantity();
                int newquantity=quantity+1;
                itm.setQuantity(newquantity);
                return;
                
            }
        }
        items.add(newitem);
    }
    
    public void removeItem(Item productCode){
        items.remove(productCode);
    }
    
}
