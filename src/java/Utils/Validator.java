/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author xmore mmohz
 */
public class Validator {
    // ensures that quantity input is number between 0 and 99
    // applies to quantity fields in cart page
    public boolean validateQuantity (String productId, String quantity) {

        boolean errorFlag = false;

        if (!productId.isEmpty() && !quantity.isEmpty()) {

            int i = -1;

            try {

                i = Integer.parseInt(quantity);
            } catch (NumberFormatException nfe) {

                System.out.println("User did not enter a number in the quantity field");
            }

            if (i < 0 || i > 99) {

                errorFlag = true;
            }
        }

        return errorFlag;
    }
    
    public boolean ValidateFormField(String name,
                                String email,
                                String phone,
                                String address,
                                String cityRegion,
                                String ccNumber,
                                HttpServletRequest request) {
        
        boolean errorFlag = false;
        boolean nameError;
        boolean emailError;
        boolean phoneError;
        boolean addressError;
        boolean cityRegionError;
        boolean ccNumberError;
        
        
        if(name==null || name.equals("") || name.length()>45){
            
            nameError=true;
            errorFlag=true;
            request.setAttribute("nameError",nameError);
            
        }
        if(email ==null || email.equals("") || !email.contains("@")){
            emailError=true;
            errorFlag=true;
            request.setAttribute("emailError",emailError);
        }
        if(phone == null || phone.equals("") || phone.length()<9){
            phoneError=true;
            errorFlag=true;
            request.setAttribute("phoneError", phoneError);
            
        }
         if (address == null
                || address.equals("")
                || address.length() > 45) {
            errorFlag = true;
            addressError = true;
            request.setAttribute("addressError", addressError);
        }
        if (cityRegion == null
                || cityRegion.equals("")
                || cityRegion.length() > 2) {
            errorFlag = true;
            cityRegionError = true;
            request.setAttribute("cityRegionError", cityRegionError);
        }
        if (ccNumber == null
                || ccNumber.equals("")
                || ccNumber.length() > 19) {
            errorFlag = true;
            ccNumberError = true;
            request.setAttribute("ccNumberError", ccNumberError);
        }
        
        
        return errorFlag;
        
    }
}
