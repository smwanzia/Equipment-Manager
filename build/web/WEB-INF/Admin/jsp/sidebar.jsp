<%-- 
    Document   : sidebar
    Created on : Oct 28, 2017, 11:41:13 PM
    Author     : xmore mmohz
--%>

  <%@page import="Business.AdminUsers"%>
<aside class="main-sidebar" style="position: fixed;
    margin-top:  8px;" >
    <!-- sidebar: style can be found in sidebar.less -->
    <%
    AdminUsers loggedInUser=(AdminUsers)session.getAttribute("loggedInUser");
    String role=loggedInUser.getRolename();
    %>
    <section class="sidebar">
               <ul class="sidebar-menu">
                          <li class="header">MAIN NAVIGATION</li>
                          <li class="active treeview">
                              <a href="#">
                              <i class="fa "> </i> <span>Home</span>
                                     <span class="pull-right-container">
                                        <i class="left pull-right"></i>
                                     </span>
                              </a>
                          </li>
                         
                          <li class="treeview">
                             <a href="#">
                                 <i class="fa "></i> <span>Products</span>
                                 <span class="pull-right-container">
                                    <i class="fa  pull-right"></i>
                                 </span>
                             </a>
                              <ul class="treeview-menu">
                                      <li><a href="javascript:void()" page='LoadProducts'><i class="fa "></i>All Products</a></li>
                                      <li><a href="javascript:void()" page='LoadCategories'><i class="fa "></i> Categories</a></li>
                                       <li><a href="javascript:void()" page='LoadBrand'><i class="fa "></i> Brands/Type</a></li>
                                    </ul>
                           </li>
                           <% if(role.contains("Administrator")) { %>
                          <li class="treeview">
                               <a href="#">
                                     <i class="fa "></i> <span>Users</span>
                                     <span class="pull-right-container">
                                         <i class="fa  pull-right"></i>
                                     </span>
                               </a>
                                    <ul class="treeview-menu">
                                      <li><a href="javascript:void()" page='SelectUser'><i class="fa "></i>All Users</a></li>
                                      <li><a href="javascript:void()" page='ManageRoles'><i class="fa "></i>Roles</a></li>
                                    </ul>
                          </li>
                          <% } %>
                          <li class="treeview">
                                 <a href="#">
                                         <i class="fa "></i> <span>Process Payments</span>
                                         <span class="pull-right-container">
                                           <i class="fa pull-right"></i>
                                         </span>
                                 </a>
                         </li>
                         <li class="treeview">
                             <a href="#">
                               <i class="fa "></i> <span>Customer</span>
                               <span class="pull-right-container">
                                 <i class="fa  pull-right"></i>
                               </span>
                              </a>
                                     <ul class="treeview-menu">
                                       <li><a href="javascript:void()" page='FetchCustomers' ><i class="fa "></i>All customers</a></li>
                                       <li><a href="javascript:void()" page='LoadOrders'><i class="fa "></i>Orders</a></li>
                                     </ul>
                         </li>
                         <li class="treeview">
                              <a href="#">
                                   <i class="fa "></i> <span>Reports</span>
                                   <span class="pull-right-container">
                                     <i class="fa  pull-right"></i>
                                   </span>
                              </a>
                                     <ul class="treeview-menu">
                                       <li><a href="javascript:void()" page='loadOrderSummary'><i class="fa "></i>Order Reports</a></li>
                                       <li><a href="javascript:void()" page='CustomerReport'><i class="fa "></i> Customer Reports</a></li>
                                       <% if(role.contains("Administrator")){ %>
                                        <li><a href="javascript:void()" page='PaymentReport'><i class="fa "></i>Payment Reports</a></li>
                                        <% } %>
                                     </ul>
                             
                         </li>
                         
                         <% if(role.contains("Administrator")) { %>
                          <li class="treeview">
                              <a href="#">
                                   <i class="fa "></i> <span>Settings</span>
                                   <span class="pull-right-container">
                                     <i class="fa  pull-right"></i>
                                   </span>
                              </a>
                                    <ul class="treeview-menu">
                                       <li><a href="javascript:void()" page='Setting'><i class="fa "></i>System Setting</a></li>
                                       <li><a href="javascript:void()" page='Emails'><i class="fa "></i> Emails</a></li>
                                       <li><a href="javascript:void()" page='SMS'><i class="fa "></i>SMS</a></li>
                                    </ul>
                              
                         </li>
                         <% } %>
                   
    </section>
    <!-- /.sidebar -->
  </aside>
