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
<%-- Include DB Connection --%>
<%@ include file="/config/db.jsp" %>
<%-- Include Header --%>
<%@ include file="views/header.jsp"%>
<%-- Include Content --%>
<title>Aperture Shop .:: Capture Every Moment ::. - Product</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<%
	// set halaman utama ke hal. 1 jika tidak ada pagination
	int hal = request.getParameter("pg") != null ? Integer.parseInt(request.getParameter("pg").toString()) : 1;
	// set query pencarian ke kosong, berarti ambil semua produk
	String search_type = request.getParameter("search_type") != null ? request.getParameter("search_type").toString() : "name";
	String query = request.getParameter("product") != null ? request.getParameter("product").toString() : "";
	
	// konfigurasi jumlah item per halaman
	int item_per_page = 6;
	
	// lakukan pencarian berdasarkan query
	if (query.equalsIgnoreCase("")){
		sql = "select * from Product";
	}else{
		// pencarian berdasarkan nama
		if (search_type.equalsIgnoreCase("name")){
			sql = "select * from Product where productname like '%" + query + "%'";
		}
	}
	
	ResultSet rs = st.executeQuery(sql);
	%>
	<div class="row">
		<form method="get" action="<%= ROOT_PATH %>product.jsp">
			<div class="form-group">
				<div class="col-sm-9" style="padding-right: 0;">
					<input type="text" class="form-control" id="search" name="product" placeholder="Input your search here..." value="<%= query %>">
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
			<%
			if (!rs.next()){
			%>
			<div class="row">
				<div class="alert alert-danger text-center" role="alert">No Product Available!</div>
			</div>
			<%
			}else{
			%>
			<div class="row">
			<%
				// ambil jumlah data
				rs.last();
				int total_data = rs.getRow();
				rs.beforeFirst();
				int total_pagination = total_data % item_per_page == 0 ? total_data / item_per_page : (total_data / item_per_page) + 1;

				// set rs ke item yang sesuai dengan pagination
				for(int x=0;x<(hal-1)*item_per_page;x++){
					rs.next();
				}
				
				for(int i=0;i<item_per_page;i++){
					if (!rs.next()) break;
			%>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail product-thumbnail">
						<img src="<%= ROOT_PATH + rs.getString("productimage") %>" alt="product_image_<%= i+1 %>">
						<div class="caption">
							<h3><%= rs.getString("productname") %></h3>
							<p>Price: Rp. <%= rs.getString("productprice") %></p>
							<p>Weight: <%= rs.getString("productweight") %> grams</p>
							<p><%= rs.getString("productspecification") %></p>
							<form method="post" action="<%= CTRL_PATH %>add_to_cart.jsp">
								<div class="form-group">
									<input type="text" name="cartqty" placeholder="Quantity" class="form-control">
									<input type="hidden" name="ProductID" value="<%= rs.getString("productid") %>"> 
								</div>
								<button class="btn btn-block btn-primary" type="submit">Add to Cart</button>
							</form>
						</div>
					</div>
				</div>
			<%
				}
			%>
			</div>
			<%-- Ini untuk pagination --%>
			<div class="row text-center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<%
						for(int j=1;j<=total_pagination;j++){
						%>
						<li><a href="<%= ROOT_PATH %>product.jsp?search_type=<%= search_type %>&pg=<%= j %>&product=<%= query %>"><%= j %></a></li>
						<%
						}
						%>
					</ul>
				</nav>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>