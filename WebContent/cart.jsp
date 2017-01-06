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
<title>Aperture Shop .:: Capture Every Moment ::. - Cart</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<div class="row">
		<%@ include file="/helper/error_helper.jsp" %>
	</div>
	<div class="row">
		<div class="col-md-12 index-inner-shadow"
			style="background: url('<%=IMG_PATH%>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: auto; margin-bottom: 10px; padding-top: 50px; padding-bottom: 50px;">
			<div class="col-md-10 col-md-offset-1 bg-white form-outer-shadow" style="padding-top: 15px; padding-bottom: 15px;">
				<div class="row">
					<h3 class="text-center">Cart</h3>
					<div class="col-md-10 col-md-offset-1">
					<%
					sql = "select a.qty, b.productimage, b.productname, b.productprice from Cart a, Product b where a.productid=b.productid and a.userid='" + seUserID + "'";
					ResultSet rs = st.executeQuery(sql);
					
					if (!rs.next()){
					%>
					<div class="row">
						<div class="alert alert-danger text-center" role="alert">No Cart Available!</div>
					</div>
					<%
					}else{
						rs.beforeFirst();
					%>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Product Image</th>
									<th class="col-md-4">Product Name</th>
									<th class="col-md-2">Product Quantity</th>
									<th class="col-md-4">@</th>
									<th>Sub Price</th>
								</tr>
							</thead>
							<tbody>
								<%
								int total_price = 0, total_qty = 0;
								while(rs.next()){
								%>
								<tr>
									<td><img src="<%= ROOT_PATH + rs.getString("productimage") %>" alt="product" width="100" height="100"></td>
									<td><%= rs.getString("productname") %></td>
									<td class="text-center"><%= rs.getString("qty") %></td>
									<td>Rp. <%= rs.getString("productprice") %></td>
									<%
									int subtotal = rs.getInt("qty") * rs.getInt("productprice");
									total_qty += rs.getInt("qty");
									total_price += subtotal;
									%>
									<td>Rp. <%= subtotal %></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td colspan="2" class="text-right">
										<a style="margin-right: 0; width: 150px;" href="<%= CTRL_PATH %>clear_cart.jsp?id=<%= seUserID %>" class="btn btn-danger" role="button">Clear Cart</a>
										<a style="margin-left: 0; width: 150px;" href="<%= CTRL_PATH %>checkout.jsp?id=<%= seUserID %>" class="btn btn-success" role="button">Checkout</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td colspan="2" class="text-right">
										<span class="label label-success" style="margin-right: 0;">Total Quantity: <%= total_qty %> pcs</span>
										<span class="label label-primary" style="margin-left: 0;">Total Payment: Rp. <%= total_price %></span>
									</td>
								</tr>
							</tfoot>
						</table>
					<%
					}
					%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>