<%-- Jalankan config utama --%>
<%@ include file="config/global.jsp"%>
<%-- Jalankan Session Helper --%>
<%@ include file="/helper/session_helper.jsp"%>
<%
	// Halaman Product untuk member
	String pageRole = "member"; // kosong brarti guest
	if (!seUserRole.equalsIgnoreCase(pageRole)) {
		response.sendRedirect(ROOT_PATH + "index.jsp");
		return;
	}
%>
<%-- Include Header --%>
<%@ include file="views/header.jsp"%>
<%-- Include Content --%>
<title>Aperture Shop .:: Capture Every Moment ::. - Product</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<div class="row">
		<form method="POST" action="<%= CTRL_PATH %>search_product.jsp">
			<div class="form-group">
				<div class="col-sm-9" style="padding-right: 0;">
					<input type="text" class="form-control" id="search" name="product" placeholder="Input your search here...">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2" style="padding-left: 0; padding-right: 0;">
					<select name="search_type" class="form-control">
						<option value="name" selected>Search by product name</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-1" style="padding-left: 0; padding-right: 0;">
					<button type="submit" class="btn btn-primary btn-block">Search</button>	
				</div>
			</div>
		</form>
	</div>
	<div class="row">
		<div class="col-md-12 index-inner-shadow"
			style="background: url('<%=IMG_PATH%>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: auto; margin-bottom: 10px; padding-top: 50px; padding-bottom: 50px;">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail product-thumbnail">
					<img src="<%= IMG_PATH %>C1.jpeg" alt="canon_1">
					<div class="caption">
						<h3>Canon EOS</h3>
						<p>Price: IDR 3500000</p>
						<p>Weight: 2300 grams</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu commodo sapien. Morbi convallis erat non consectetur tempus. Maecenas feugiat ornare velit, mattis tincidunt erat viverra eu. Maecenas nec dolor at ligula sollicitudin consequat a at dui. Sed sit amet rhoncus enim.</p>
						<form>
							<div class="form-group">
								<input type="text" name="cartqty" placeholder="Quantity" class="form-control"> 
							</div>
							<button class="btn btn-block btn-primary" type="submit">Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail product-thumbnail">
					<img src="<%= IMG_PATH %>C1.jpeg" alt="canon_1">
					<div class="caption">
						<h3>Canon EOS</h3>
						<p>Price: IDR 3500000</p>
						<p>Weight: 2300 grams</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu commodo sapien. Morbi convallis erat non consectetur tempus. Maecenas feugiat ornare velit, mattis tincidunt erat viverra eu. Maecenas nec dolor at ligula sollicitudin consequat a at dui. Sed sit amet rhoncus enim.</p>
						<form>
							<div class="form-group">
								<input type="text" name="cartqty" placeholder="Quantity" class="form-control"> 
							</div>
							<button class="btn btn-block btn-primary" type="submit">Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail product-thumbnail">
					<img src="<%= IMG_PATH %>C1.jpeg" alt="canon_1">
					<div class="caption">
						<h3>Canon EOS</h3>
						<p>Price: IDR 3500000</p>
						<p>Weight: 2300 grams</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu commodo sapien. Morbi convallis erat non consectetur tempus. Maecenas feugiat ornare velit, mattis tincidunt erat viverra eu. Maecenas nec dolor at ligula sollicitudin consequat a at dui. Sed sit amet rhoncus enim.</p>
						<form>
							<div class="form-group">
								<input type="text" name="cartqty" placeholder="Quantity" class="form-control"> 
							</div>
							<button class="btn btn-block btn-primary" type="submit">Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail product-thumbnail">
					<img src="<%= IMG_PATH %>C1.jpeg" alt="canon_1">
					<div class="caption">
						<h3>Canon EOS</h3>
						<p>Price: IDR 3500000</p>
						<p>Weight: 2300 grams</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu commodo sapien. Morbi convallis erat non consectetur tempus. Maecenas feugiat ornare velit, mattis tincidunt erat viverra eu. Maecenas nec dolor at ligula sollicitudin consequat a at dui. Sed sit amet rhoncus enim.</p>
						<form>
							<div class="form-group">
								<input type="text" name="cartqty" placeholder="Quantity" class="form-control"> 
							</div>
							<button class="btn btn-block btn-primary" type="submit">Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail product-thumbnail">
					<img src="<%= IMG_PATH %>C1.jpeg" alt="canon_1">
					<div class="caption">
						<h3>Canon EOS</h3>
						<p>Price: IDR 3500000</p>
						<p>Weight: 2300 grams</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu commodo sapien. Morbi convallis erat non consectetur tempus. Maecenas feugiat ornare velit, mattis tincidunt erat viverra eu. Maecenas nec dolor at ligula sollicitudin consequat a at dui. Sed sit amet rhoncus enim.</p>
						<form>
							<div class="form-group">
								<input type="text" name="cartqty" placeholder="Quantity" class="form-control"> 
							</div>
							<button class="btn btn-block btn-primary" type="submit">Add to Cart</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>