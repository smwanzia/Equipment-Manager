<%-- 
    Document   : cart
    Created on : Dec 13, 2017, 1:19:30 PM
    Author     : xmore mmohz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Business.ShoppingCart"%>
<!-- Header End====================================================================== -->
    <div id="mainBody">
	<div class="container">
            <div class="row">
            <!-- Sidebar ================================================== -->
                <%
                    //get the current shopping cart from user session
                    ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
                    //if shopping cart is empty create one
                   // If the user doesn't have a shopping cart yet, create one.
                    if (cart == null) {
                        cart = new ShoppingCart();
                        session.setAttribute("cart", cart);
                    }
                    //get the array item from the cart 
                    ArrayList itembought=cart.getItems();
                    
                    //get item size
                    int numitem=itembought.size();
                    session.setAttribute("numitem",numitem);
                    //get total
                    double totalamount=cart.getTotal();
                   
                    
                   
                    
                %>
                
                <div id="sidebar" class="col-md-3">
                    <div class="well well-small"><a id="myCart" href="product_summary.html"><img src="client/themes/images/ico-cart.png" alt="cart">
                    <% out.println(numitem); %> Items in your cart  <span class="badge badge-warning pull-right">ksh<%out.println(totalamount);%></span></a></div>
                    <ul id="sideManu" class="nav nav-tabs nav-stacked well ">
                        <c:forEach var="category" items="${categories}">
                             <li>
                                <a href="products?id=${category.name}">${category.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <br/>
                  <!--<div class="thumbnail">
                      <img src="client/themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
                      <div class="caption">
                        <h5>Payment Methods</h5>
                      </div>
                     </div>-->
                </div>
           
                <!-- Sidebar end=============================================== -->
                <div class="col-md-9">
                    <ul class="breadcrumb" style="padding:15px">
                        <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                        <li class="active"> SHOPPING CART</li>
                    </ul>
            <%
              //if there are no item tell the user ,there is item in the cart
                    if(numitem == 0){
                        out.println("<h3>Your shopping cart is empty.</h3><br>"
                        + "cick <a href = 'index.jsp'>here</a> to start shopping now!!");
                    } else 
                    
            %>
                    <h3>SHOPPING CART [ <small> <% out.println(numitem); %> Item(s) </small>]
                    <a href="index.jsp" class="btn btn-primary pull-right"><i class="icon-arrow-left"></i> Select More Equipment </a></h3>	
                    <hr class="soft"/>
                    <%  { %>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th> Item Name </th>
                              <!--  <th> Description </th>-->
                                <th> Quantity </th>
                                <th> Unit Cost </th>
                                <th> Total </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cartitem" items="${cart.items}">
                                <tr>
                                    <td> ${cartitem.name} </td>
                                   <!-- <td> ${cartitem.description}</td>-->
                                    <td> ${cartitem.quantity} </td>
                                    <td> ${cartitem.price} </td>
                                    <td> ${cartitem.total} </td>
                                    <td>
                                    <form  action="<c:url value='updatecart'/>" method="post">

                                            <input type="text"
                                                   name="quantity"
                                                   value="${cartitem.quantity}">
                                            <input type="hidden"
                                                   name="productCode"
                                                   value="${cartitem.productCode}">
                                            <button type="submit" class="btn btn-dark-azure">update</button>

                                    </form>
                                    </td>
                                    <td>
                                        <form  action="<c:url value='removeitem'/>" method="post">
                                           <input type="hidden"
                                                  name="productCode"
                                                  value="${cartitem.productCode}">
                                           <button type="submit" class="btn btn-dark-azure">Remove</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <a href="index.jsp" class="btn btn-large "><i class="icon-arrow-left"></i> Continue to Select More Equipment </a>
                    <a href="checkinvoice" class="btn btn-primary pull-right">Next<i class="icon-arrow-right"></i></a>
                <%
                    }
                %>
                </div>
             </div>
        </div>
    </div>
    <!-- MainBody End ============================= -->
