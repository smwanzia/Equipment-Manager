<%-- 
    Document   : checkout
    Created on : Dec 15, 2017, 5:30:08 PM
    Author     : xmore mmohz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <div class="mainBody" style="/*background: #eee;*/margin-top: 0px; border-top: 0px solid " id="mainBody">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12 col-sm-6">
                   <div class="col-sm-4">
                           <div class="well">
                               <div class="well">
                                    <address>
                                        <strong class="text-dark">${customer.firstname}</strong>

                                        <strong class="text-dark">${customer.lastname}</strong>

                                        <br>
                                        ${customer.homeaddress}
                                        <br>
                                        ${customer.city}, KENYA 80100
                                        <br>
                                        <abbr title="Phone">Phone:</abbr> (+254)${customer.phonenumber}

                                    </address>
                                    <address>
                                        <strong class="text-dark">E-mail:</strong>
                                        <a href="mailto:#">
                                            ${customer.emailaddress}
                                        </a>
                                    </address>
                               </div>
                            <h4>Payment Details:</h4>
                            <div class="well " style="height: 180px;">
                                <ul class="list-unstyled invoice-details padding-bottom-30 padding-top-10 text-dark">
                                    <li>
                                        <strong>V.A.T Reg #:</strong> 233243444
                                    </li>
                                    <li>
                                        <strong>Bank #:</strong> Kenya Commercial Bank
                                    </li>
                                    <li>
                                        <strong>Account Name:</strong> Sunshine Occassion Limited
                                    </li>
                                    <li>
                                        <strong>Account No:</strong> 1233F4343ABCDEW
                                    </li>
                                     <li>
                                        <strong>Mpesa paybill No:</strong> 
                                    </li>
                                    <!--<li>
                                        <strong>DATE:</strong> 01/01/2014
                                    </li>
                                    <li>
                                        <strong>DUE:</strong> 11/02/2014
                                    </li>-->
                                </ul>
                            </div>
                                    
                                   <!--  <h4>We appreciate your business.</h4>
                             <div class="well" style="height: 180px;">
                                <div class="padding-bottom-30 padding-top-10 text-dark">
                                    Thanks for being a customer.
                                    A detailed summary of your invoice is below.
                                    <br>
                                    If you have questions, we're happy to help.
                                    <br>
                                    Email support@SunshineOccassion.com or contact us through other support channels.
                                </div>
                            </div>-->
                            
                            </div>
                        </div>
                            <div class="col-md-8">
                                 <h3 style="text-align: center;text-align: center;font-size: 28px;margin-top: -5px;margin-bottom: 36px">Order Confirmation Details</h3>
                                 <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th> # </th>
                                            <th> Item </th>
                                           <!-- <th class="hidden-480"> Description </th>-->
                                            <th class="hidden-480"> Quantity </th>
                                            <th class="hidden-480"> Unit Cost </th>
                                            <th> Total </th>
                                        </tr>
                                    </thead>
                                <tbody>
                                    <c:forEach var="cartitem" items="${currentinvoice.items}">
                                        <tr>
                                            <td> # </td>
                                           <!-- <td> ${cartitem.description} </td>-->
                                            <td class="hidden-480"> ${cartitem.name} </td>
                                            <td class="hidden-480"> ${cartitem.quantity} </td>
                                            <td class="hidden-480"> ${cartitem.price} </td>
                                            <td> ${cartitem.total} </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        <div class="row">
                            <div class="col-sm-6 invoice-block">
                                <ul class="list-unstyled amounts text-small">
                                    <li>
                                        <strong>Gross-Total:</strong> ${currentinvoice.fixedAmount}
                                    </li>
                                    <li>
                                        <strong>Discount:</strong> 9.9%
                                    </li>
                                    <li>
                                        <strong>VAT:</strong> 22%
                                    </li>
                                    <li class="text-extra-large text-dark margin-top-15 pull-right">
                                        <strong style="font-size: 20px;" >Net-Total: ${currentinvoice.fixedAmount}</strong>  
                                    </li>
                                </ul>
                         </div>
                        <div class="col-sm-6 ">
                           <!-- <div class="pull-left">
                                   
                                    <a href="UserLogout" class="btn btn-lg btn-primary btn-o"> Cancel order </a>
                                
                            </div>
                            <div class="pull-right">
                                    <form action="placeOrder" method="post">
                                    <button type="submit" value="placeOrder" onclick="" class="btn btn-lg btn-primary btn-o"> place order </button>
                                </form>
                            </div>-->

                        </div>

                    </div> 
                                    <div class="row">
                                         <div class="col-sm-12 ">
                            <div class="pull-left">
                                   
                                    <a href="UserLogout" class="btn btn-lg btn-success btn-o"> Cancel order </a>
                                
                            </div>
                            <div class="pull-right">
                                    <form action="placeOrder" method="post">
                                    <button type="submit" value="placeOrder" onclick="" class="btn btn-lg btn-primary btn-o"> place order </button>
                                </form>
                            </div>

                        </div>
                                        
                                    </div>
                </div>         
            </div>
    </div>
</div>
    
</div>