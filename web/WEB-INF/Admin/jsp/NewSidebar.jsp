<%-- 
    Document   : New_Header
    Created on : Feb 15, 2018, 10:35:56 PM
    Author     : xmore mmohz
--%>

    <%@page import="Business.AdminUsers"%>
<div id="sidebar" class="sidebar responsive ace-save-state sidebar-fixed sidebar-scroll" style="width: 230px !important;margin-top:47px;">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

                                  <!--  <div class="sidebar-shortcuts pull-right" id="sidebar-shortcuts">
                                            <div class="sidebar-shortcuts-large " id="sidebar-shortcuts-large">
                                                    <button class="btn btn-success">
                                                            <i class="ace-icon fa fa-signal"></i>
                                                    </button>

                                                    <button class="btn btn-info">
                                                            <i class="ace-icon fa fa-pencil"></i>
                                                    </button>

                                                    <button class="btn btn-warning">
                                                            <i class="ace-icon fa fa-users"></i>
                                                    </button>

                                                    <button class="btn btn-danger">
                                                            <i class="ace-icon fa fa-cogs"></i>
                                                    </button>
                                            </div>

                                    </div>--><!-- /.sidebar-shortcuts -->
                    <%
                        AdminUsers loggedInUser=(AdminUsers)session.getAttribute("loggedInUser");
                        String role=loggedInUser.getRolename();
                     %>
                     <ul class="nav nav-list">
					<li class="active">
                                               <a href="javascript:void()" page='LoadGeneralReports'>
									<i class="menu-icon fa fa-home"></i>
									Dashboard
                                                </a>
						<!--<a href="index.html">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>-->

						<b class="arrow"></b>
					</li>
  <% if(role.contains("Administrator")) { %>
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-product-hunt"></i>
							<span class="menu-text">
								Manage Product
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
                                                    <li class="">
                                                            <a href="javascript:void()" page='LoadProducts'>
									<i class="menu-icon fa fa-caret-right"></i>
									Inventory
								</a>

								<b class="arrow"></b>
                                                    
                                                        <li class="">
								<a href="#" class="dropdown-toggle">
									<i class="menu-icon fa fa-caret-right"></i>
									Categories
                                                                        <b class="arrow fa fa-angle-down"></b>
								</a>

                                                                <b class="arrow"></b>
                                                                        <ul class="submenu">
                                                                           <li class="">
                                                                           <a href="javascript:void()" page='LoadCategories'>
                                                                                    <i class="menu-icon fa fa-eye-slash pink"></i>
                                                                                          Categories
                                                                            </a>

                                                                                    <b class="arrow"></b>
                                                                           </li>
                                                                           <li>
                                                                                   <a href="javascript:void()" page='LoadBrand'>
                                                                                            <i class="menu-icon fa fa-eye pink"></i>
                                                                                         Sub Categories
                                                                                    </a>

                                                                                    <b class="arrow"></b>
                                                                            </li>
                                                                        </ul>
                                                        </li>
                                                        <li class="">
								<a href="javascript:void()" page='ProductDelivery'>
									<i class="menu-icon fa fa-eye-slash purple"></i>
									Delivered Products
								</a>

								<b class="arrow"></b>
							</li>
                                                        <li class="">
								<a href="javascript:void()" page='ReturnProduct'>
									<i class="menu-icon fa fa-plus purple"></i>
									Return Products
								</a>

								<b class="arrow"></b>
							</li>
                                                </ul>
					</li>
                                        <% } %>

                                        
                                        <% if(role.contains("Administrator")) { %>
                                        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-user"></i>
							<span class="menu-text"> Manage Users </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="javascript:void()" page='SelectUser'>
									<i class="menu-icon fa fa-eye pink"></i>
									 Users
								</a>

								<b class="arrow"></b>
							</li>
                                                </ul>
					</li>
                                      
                                        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-lock"></i>
							<span class="menu-text"> Manage User Roles </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="javascript:void()" page='ManageRoles'>
									<i class="menu-icon fa fa-caret-right"></i>
									View Roles
								</a>

								<b class="arrow"></b>
							</li>

						</ul>
					</li>
                                          <% } %>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-child"></i>
							<span class="menu-text"> Manage Customers </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a href="javascript:void()" page='FetchCustomers' >
									<i class="menu-icon fa fa-caret-right"></i>
									View Customers
								</a>

								<b class="arrow"></b>
							</li>
                                                </ul>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-shopping-cart"></i>
							<span class="menu-text"> Process Orders </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
                                                         <li class="">
								<a href="javascript:void()" page='SelectInvoices'>
									<i class="menu-icon fa fa-shopping-bag"></i>
									Invoices
								</a>

								<b class="arrow"></b>
							</li>
							<!--<li class="">
								<a href="javascript:void()" page='SelectOrderedProduct'>
									<i class="menu-icon fa fa-shopping-bag"></i>
								   Ordered Product Summary
								</a>

								<b class="arrow"></b>
							</li>-->
                                                </ul>
					</li>
                                        <% if(role.contains("Administrator")) { %>
                                        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-book"></i>
							<span class="menu-text">Reports</span>
                                                        <b class="arrow fa fa-angle-right"></b>
						</a>

						<b class="arrow"></b>
                                                <ul class="submenu">
							<!--<li class="">
								<a href="">
									<i class="menu-icon fa fa-eye pink"></i>
									Order Reports
								</a>

								<b class="arrow"></b>
							</li>-->
                                                        <li class="">
								<a href="javascript:void()" page="LoadSales">
									<i class="menu-icon fa fa-eye pink"></i>
									Hired Product Reports
								</a>

								<b class="arrow"></b>
							</li>
                                                       <!-- <li class="">
								<a href="javascript:void()" page="loadInvoiceSummary">
									<i class="menu-icon fa fa-eye pink"></i>
									Invoice Summary
								</a>

								<b class="arrow"></b>
							</li>-->
                                                        <li class="hidden">
								<a href="">
									<i class="menu-icon fa fa-eye pink"></i>
									Rejected Orders
								</a>

								<b class="arrow"></b>
							</li>
                                                        <li class="">
								<a href="javascript:void(0)" page="LoadApprovedOrders">
									<i class="menu-icon fa fa-eye pink"></i>
									Approved Orders
								</a>

								<b class="arrow"></b>
							</li>
                                                         <li class="">
								<a href="javascript:void(0)" page="LoadDeliveredOrders">
									<i class="menu-icon fa fa-eye pink"></i>
									Delivered Orders
								</a>

								<b class="arrow"></b>
							</li>
                                                        <li class="">
								<a href="javascript:void(0)" page="LoadCustomerReport">
									<i class="menu-icon fa fa-plus purple"></i>
									Customers Reports 
								</a>

								<b class="arrow"></b>
							</li>
                                                       
						</ul>
					</li>
                                        <% } %>
                                        <% if(role.contains("Administrator")) { %>
                                        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-inbox"></i>
							<span class="menu-text"> Messages  Center</span>
                                                    <b class="arrow fa fa-angle-down"></b>
						</a>
                                                <b class="arrow"></b>
                                                <ul class="submenu">
                                                        <li class="">
								<a href="javascript:void(0)" page="messages">
									<i class="menu-icon fa fa-caret-right"></i>
									Inbox
								</a>

								<b class="arrow"></b>
							</li>
                                                </ul>
					</li>
                                         <% } %>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-gears"></i>
							<span class="menu-text"> Settings </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
                                                    
							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Email Setting
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="javascript:void(0)" page="messages">
									<i class="menu-icon fa fa-caret-right"></i>
									SMS Setting
								</a>

								<b class="arrow"></b>
							</li>

							<!--<li class="">
								<a href="javascript:void(0)" page="LoadFeaturedEvents">
									<i class="menu-icon fa fa-caret-right"></i>
									Featured Events
								</a>

								<b class="arrow"></b>
							</li>-->
                                                        <li class="">
                                                            <a href="#">
                                                                    <i class="menu-icon fa fa-caret-right"></i>
                                                                   System Setting
                                                            </a>

                                                            <b class="arrow"></b>
                                                        </li>

                                                </ul>
					</li>

				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>