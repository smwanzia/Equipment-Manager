
<style>
    .main-product h3{
        font-size: 30px;
        margin-top: -2px;
    } 
</style>
<!-- Header End====================================================================== -->
    <div id="mainBody">
        <div class="container">
            <div class="row">
                 <div class="col-md-12" >
                  <!--  <ul class="breadcrumb" style="margin-left: 29px;margin-top: -18px;padding: 14px 15px;">
                       <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                       <li><a href="products">Products</a> <span class="divider">/</span></li>
                       <li class="active">product Details</li>
                    </ul>-->	
                    <div class="row">	
                    <c:forEach var="selectedProduct" items="${productlist}">
                       <c:if test="${pageContext.request.queryString == selectedProduct.id}">
                        <div id="gallery" class="col-md-4">
                            <div class="p-right" style="margin-left: 34px;">
                                
                                <a href="${initParam.productImagePath}/${selectedProduct.image}" title="${selectedproduct.name}">
                                    <img src="${initParam.productImagePath}/${selectedProduct.image}" style="width:304;height: 246" alt=""/>
                                </a>
                                
                                <div class="btn-toolbar">
                                   <div class="btn-group">
                                         <span class="btn"><i class="icon-envelope"></i></span>
                                         <span class="btn" ><i class="icon-print"></i></span>
                                         <span class="btn" ><i class="icon-zoom-in"></i></span>
                                         <span class="btn" ><i class="icon-star"></i></span>
                                         <span class="btn" ><i class=" icon-thumbs-up"></i></span>
                                         <span class="btn" ><i class="icon-thumbs-down"></i></span>
                                   </div>
                                </div>
                                <p1> * Prices are subject to change.</p1> <br>

                                <p1>*Please call us for any questions on our ,${prod.name}
                                    .</p1>
                                    <br/>
                                    <br/>
                                    <h3>Supplier Contact Info</h3>
                                <p1 style="font-weight:bold"> Supplier :  ${prod.firstname} ${prod.lastname}</p1> <br>
                                <p1 style="font-weight:bold"> Location   :${prod.location} </p1><br>
                                <p1 style="font-weight:bold"> Email Address :${prod.emailaddress} </p1><br>
                                <p1 style="font-weight:bold"> Phone Number   :${prod.phonenumber} </p1><br>
                            </div>
                                
			</div>
			
			<div class="col-md-8">
                            <div class="main-product" style="">
                             
                                <h3>${selectedProduct.name} </h3>
				<small></small>
				<hr class="soft"/>
                                <form class="form-horizontal qtyFrm" action="<c:url value='addtocart'/>" method='post'>
                                    <div class="control-group">
                                          <label class="control-label" style="font-size: 21px;">Rental Prices: <span></span></label>
                                          <div class="controls">
                                                 <label class="control-label" style="font-size: 15px;">/Monthly: KSH ${selectedProduct.price}<span></span></label><br/>
                                                 <label class="control-label" style="font-size: 15px;">/Weekly:  KSH ${selectedProduct.weeklyprice}<span></span></label><br/>
                                                  <label class="control-label" style="font-size: 15px;">/Day:    KSH ${selectedProduct.dailyprice}<span></span></label>
                                          </div>
                                          <div class="controls">
                                            <input type="hidden" name='productid' value='${selectedProduct.id}' class="span1" placeholder="Qty."/>
                                             <input type="hidden" name='categoryid' value='${selectedProduct.categoryid}' class="span1"/>
                                            <button type="submit" class="btn btn-large btn-primary pull-right"> Hire ${selectedProduct.name}  <i class="icon-shopping-cart"></i></button>
                                          </div>
                                    </div>
				</form>
                                <h3 style="margin-top: 65px;font-size: 21px;">Product Description</h3>
				<p style="margin:11px ;color:#000">
                                    ${selectedProduct.description}
				</p>
                      
				<a class="btn btn-small pull-right" href="#detail">More Details</a>
                                <a class="btn btn-small pull-left" href="#index.jsp">Go Back</a>
				<br class="clr"/>
                                <a href="#" name="detail"></a>
                                <hr class="soft"/>
                            </div>
			</div>
			</div>
                     </c:if>
                    </c:forEach>
			<div class="row">
                            <div class="section1" style="background: #ddd">
                                <div class="container">
                                    <h4>Related Products <small class="pull-right">200+ featured products</small></h4>
                                    <div class="row-fluid">
                                        <div id="featured" class="carousel slide">
                                            <div class="carousel-inner">
                                                 <div class="item active">
                                                    <ul class="thumbnails">
                                                      <c:forEach var="similarproduct" items="${relatedproduct}">
                                                            <li class="span3">
                                                               <div class="thumbnail">
                                                                    <i class=""></i>
                                                                     <!-- <a href="productdetails?$//{similarproduct.id}"><img src="$//{initParam.productImagePath}/$//{similarproduct.image}" alt="" style='width:210px;height: 120px'</a> -->
                                                                    <a  href="productdetails?${similarproduct.id}"><img src="${initParam.productImagePath}/${similarproduct.image}" style="height:110px;width:247px" height="40px" alt=""></a>
                                                                    <div class="caption">
                                                                      <h5>${similarproduct.name}</h5>
                                                                      <h4><a class="btn" href="productdetails?${similarproduct.id}">VIEW</a> <span class="pull-right">${similarproduct.price}</span></h4>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                       
                                                    </ul>
                                                </div>
                                               <!-- <div class="item">
                                                    <ul class="thumbnails">
                                                           <li class="span3">
                                                             <div class="thumbnail">
                                                             <i class=""></i>
                                                                   <a href="product_details.html"><img src="themes/images/products/wedding/w1.jpg" height="100px" alt=""></a>
                                                                   <div class="caption">
                                                                     <h5>Product name</h5>
                                                                     <h4><a class="btn" href="product_details.html">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                                   </div>
                                                             </div>
                                                            </li>
                                                            <li class="span3">
                                                              <div class="thumbnail">
                                                              <i class=""></i>
                                                                    <a href="product_details.html"><img src="themes/images/products/wedding/w1.jpg" height="100px" alt=""></a>
                                                                    <div class="caption">
                                                                      <h5>Product name</h5>
                                                                      <h4><a class="btn" href="product_details.html">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                                    </div>
                                                              </div>
                                                            </li>
                                                            <li class="span3">
                                                              <div class="thumbnail">
                                                              <i class=""></i>
                                                                    <a href="product_details.html"><img src="themes/images/products/wedding/w1.jpg" alt=""></a>
                                                                    <div class="caption">
                                                                      <h5>Product name</h5>
                                                                       <h4><a class="btn" href="product_details.html">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                                    </div>
                                                              </div>
                                                            </li>
                                                            <li class="span3">
                                                              <div class="thumbnail">
                                                              <i class=""></i>
                                                                    <a href="product_details.html"><img src="themes/images/products/wedding/w1.jpg" alt="100px"></a>
                                                                    <div class="caption">
                                                                      <h5>Product name</h5>
                                                                       <h4><a class="btn" href="product_details.html">VIEW</a> <span class="pull-right">$222.00</span></h4>
                                                                    </div>
                                                              </div>
                                                            </li>
                                                        </ul>
                                                    </div>-->
                                              
                                              </div>
                                            <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                                            <a class="right carousel-control" href="#featured" data-slide="next">›</a>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                        </div>
			
	<!--<div class="row">
			
			<div class="col-md-12">
            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
              <li><a href="#profile" data-toggle="tab">Related Products</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade active in" id="home">
			  <h4>Product Information</h4>
                <table class="table table-bordered">
				<tbody>
				<tr class="techSpecRow"><th colspan="2">Product Details</th></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Brand: </td><td class="techSpecTD2">Fujifilm</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Model:</td><td class="techSpecTD2">FinePix S2950HD</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Released on:</td><td class="techSpecTD2"> 2011-01-28</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Dimensions:</td><td class="techSpecTD2"> 5.50" h x 5.50" w x 2.00" l, .75 pounds</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Display size:</td><td class="techSpecTD2">3</td></tr>
				</tbody>
				</table>
				
				<h5>Features</h5>
				<p>
				14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode. Face Detection technology with Blink detection and Smile and shoot mode. 4 x AA batteries not included. WxDxH 110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and memory card). Weight 0.437kg (including battery and memory card).<br/>
				OND363338
				</p>

				<h4>Editorial Reviews</h4>
				<h5>Manufacturer's Description </h5>
				<p>
				With a generous 18x Fujinon optical zoom lens, the S2950 really packs a punch, especially when matched with its 14 megapixel sensor, large 3.0" LCD screen and 720p HD (30fps) movie capture.
				</p>

				<h5>Electric powered Fujinon 18x zoom lens</h5>
				<p>
				The S2950 sports an impressive 28mm – 504mm* high precision Fujinon optical zoom lens. Simple to operate with an electric powered zoom lever, the huge zoom range means that you can capture all the detail, even when you're at a considerable distance away. You can even operate the zoom during video shooting. Unlike a bulky D-SLR, bridge cameras allow you great versatility of zoom, without the hassle of carrying a bag of lenses.
				</p>
				<h5>Impressive panoramas</h5>
				<p>
				With its easy to use Panoramic shooting mode you can get creative on the S2950, however basic your skills, and rest assured that you will not risk shooting uneven landscapes or shaky horizons. The camera enables you to take three successive shots with a helpful tool which automatically releases the shutter once the images are fully aligned to seamlessly stitch the shots together in-camera. It's so easy and the results are impressive.
				</p>

				<h5>Sharp, clear shots</h5>
				<p>
				Even at the longest zoom settings or in the most challenging of lighting conditions, the S2950 is able to produce crisp, clean results. With its mechanically stabilised 1/2 3", 14 megapixel CCD sensor, and high ISO sensitivity settings, Fujifilm's Dual Image Stabilisation technology combines to reduce the blurring effects of both hand-shake and subject movement to provide superb pictures.
				</p>
              </div>
		<div class="tab-pane fade" id="profile">
		<div id="myTab" class="pull-right">
		 <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
		 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
		</div>
		<br class="clr"/>
		<hr class="soft"/>
		<div class="tab-content">
			<div class="tab-pane" id="listView">
				<div class="row">	  
					<div class="span2">
						<img src="themes/images/products/4.jpg" alt=""/>
					</div>
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
						<a class="btn btn-small pull-right" href="product_details.html">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $222.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br/>
					<div class="btn-group">
					  <a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
					  <a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
					 </div>
						</form>
					</div>
			</div>
			<hr class="soft"/>
			<div class="row">	  
					<div class="span2">
						<img src="themes/images/products/5.jpg" alt=""/>
					</div>
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
						<a class="btn btn-small pull-right" href="product_details.html">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
					<form class="form-horizontal qtyFrm">
						<h3> $222.00</h3>
						<label class="checkbox">
						<input type="checkbox">  Adds product to compair
						</label><br/>
						<div class="btn-group">
						<a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
						<a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
						</div>
					</form>
					</div>
			</div>
			<hr class="soft"/>
			<div class="row">	  
					<div class="span2">
					<img src="themes/images/products/6.jpg" alt=""/>
					</div>
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
						<a class="btn btn-small pull-right" href="product_details.html">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $222.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br/>
				<div class="btn-group">
				  <a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
				  <a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				 </div>
						</form>
					</div>
			</div>
			<hr class="soft"/>
			<div class="row">	  
					<div class="span2">
					<img src="themes/images/products/7.jpg" alt=""/>
					</div>
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
						<a class="btn btn-small pull-right" href="product_details.html">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
						<form class="form-horizontal qtyFrm">
						<h3> $222.00</h3>
						<label class="checkbox">
						<input type="checkbox">  Adds product to compair
						</label><br/>
						<div class="btn-group">
						<a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
						<a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
						</div>
						</form>
					</div>
			</div>
			
			<hr class="soft"/>
			<div class="row">	  
					<div class="span2">
					<img src="themes/images/products/8.jpg" alt=""/>
					</div>
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
						<a class="btn btn-small pull-right" href="product_details.html">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
						<form class="form-horizontal qtyFrm">
						<h3> $222.00</h3>
						<label class="checkbox">
						<input type="checkbox">  Adds product to compair
						</label><br/>
						<div class="btn-group">
						<a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
						<a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
						</div>
						</form>
					</div>
			</div>
			<hr class="soft"/>
				<div class="row">	  
					<div class="span2">
					<img src="themes/images/products/9.jpg" alt=""/>
					</div>
					<div class="span4">
						<h3>New | Available</h3>				
						<hr class="soft"/>
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
						<a class="btn btn-small pull-right" href="product_details.html">View Details</a>
						<br class="clr"/>
					</div>
					<div class="span3 alignR">
						<form class="form-horizontal qtyFrm">
						<h3> $222.00</h3>
						<label class="checkbox">
						<input type="checkbox">  Adds product to compair
						</label><br/>
						<div class="btn-group">
						<a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
						<a href="product_details.html" class="btn btn-large"><i class="icon-zoom-in"></i></a>
						</div>
						</form>
					</div>
			</div>
			<hr class="soft"/>
		</div>
			<div class="tab-pane active" id="blockView">
				<ul class="thumbnails">
					<li class="span3">
					  <div class="thumbnail">
						<a href="product_details.html"><img src="themes/images/products/10.jpg" alt=""/></a>
						<div class="caption">
						  <h5>Manicure &amp; Pedicure</h5>
						  <p> 
							Lorem Ipsum is simply dummy text. 
						  </p>
						  <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
						</div>
					  </div>
					</li>
					<li class="span3">
					  <div class="thumbnail">
						<a href="product_details.html"><img src="themes/images/products/11.jpg" alt=""/></a>
						<div class="caption">
						  <h5>Manicure &amp; Pedicure</h5>
						  <p> 
							Lorem Ipsum is simply dummy text. 
						  </p>
						  <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
						</div>
					  </div>
					</li>
					<li class="span3">
					  <div class="thumbnail">
						<a href="product_details.html"><img src="themes/images/products/12.jpg" alt=""/></a>
						<div class="caption">
						  <h5>Manicure &amp; Pedicure</h5>
						  <p> 
							Lorem Ipsum is simply dummy text. 
						  </p>
						   <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
						</div>
					  </div>
					</li>
					<li class="span3">
					  <div class="thumbnail">
						<a href="product_details.html"><img src="themes/images/products/13.jpg" alt=""/></a>
						<div class="caption">
						  <h5>Manicure &amp; Pedicure</h5>
						  <p> 
							Lorem Ipsum is simply dummy text. 
						  </p>
						   <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
						</div>
					  </div>
					</li>
					<li class="span3">
					  <div class="thumbnail">
						<a href="product_details.html"><img src="themes/images/products/1.jpg" alt=""/></a>
						<div class="caption">
						  <h5>Manicure &amp; Pedicure</h5>
						  <p> 
							Lorem Ipsum is simply dummy text. 
						  </p>
						   <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
						</div>
					  </div>
					</li>
					<li class="span3">
					  <div class="thumbnail">
						<a href="product_details.html"><img src="themes/images/products/2.jpg" alt=""/></a>
						<div class="caption">
						  <h5>Manicure &amp; Pedicure</h5>
						  <p> 
							Lorem Ipsum is simply dummy text. 
						  </p>
						   <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">&euro;222.00</a></h4>
						</div>
					  </div>
					</li>
				  </ul>
			<hr class="soft"/>
			</div>
		</div>
				<br class="clr">
					 </div>
		</div>
          </div>

	</div>-->
           </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
		
