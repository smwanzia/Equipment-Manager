 
/* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import Paypal.*;
/**
 *
 * @author DE_XMORE
 */
@Controller
@RequestMapping(value="paypal")
public class PayPalController {
    
    @RequestMapping(method=RequestMethod.GET)
    public String index(){
        return "index";
    }
    @RequestMapping(value="/success",method=RequestMethod.GET)
    public String success(ModelMap modelMap,HttpServletRequest request){
        PayPalSuccess payPalsuccess=new PayPalSuccess();
        modelMap.put("result",payPalsuccess.getPayPal(request));
        
        return "success";
    }
}