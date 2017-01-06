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
<title>Aperture Shop .:: Capture Every Moment ::. - Transaction</title>
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
					<h3 class="text-center">Transaction</h3>
					<div class="col-md-10 col-md-offset-1">
					<%
					sql = "select * from TransactionHeader where userid='" + seUserID + "'";
					ResultSet rs = st.executeQuery(sql);
					if (!rs.next()){
					%>
					<div class="alert alert-danger text-center" role="alert">No Transaction Available!</div>
					<%
					}else{
						rs.beforeFirst();
						while(rs.next()){
					%>
						<div class="row">
							<p class="text-left pull-left" style="font-weight: bold;">Transaction No: <%= rs.getString("transactionid") %></p>
							<p class="text-center" style="font-weight: bold;"><%= rs.getString("transactiondate") %></p>
							<%
							if (rs.getString("transactionstatus").equalsIgnoreCase("waiting")){
							%>
							<p class="text-right pull-right">
								<a href="<%= CTRL_PATH %>confirm_payment.jsp?id=<%= rs.getString("transactionid")%>" class="btn btn-primary" role="button">Confirm Payment</a>
							</p>
							<%
							}
							%>
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Product Image</th>
									<th class="col-md-3">Product Name</th>
									<th class="col-md-1">Quantity</th>
									<th class="col-md-3">Subtotal</th>
								</tr>
							</thead>
							<tbody>
							<%
							String sql2 = "select b.productimage, b.productname, b.productprice, a.qty from TransactionDetail a, Product b where a.productid=b.productid and a.transactionid='" + rs.getString("transactionid") + "'";
							Statement st2 = con.createStatement(1004,1008);
							ResultSet rs2 = st2.executeQuery(sql2);
							int total_harga = 0;
							while(rs2.next()){
							%>
								<tr>
									<td><img src="<%= ROOT_PATH + rs2.getString("productimage") %>" alt="product" width="100" height="100"></td>
									<td><%= rs2.getString("productname") %></td>
									<td class="text-center"><%= rs2.getString("qty") %></td>
									<%
									int subtotal = rs2.getInt("qty") * rs2.getInt("productprice");
									total_harga += subtotal;
									%>
									<td>Rp. <%= subtotal %></td>
								</tr>
							<%
							}
							%>
								<tr>
									<td></td>
									<td></td>
									<td>Total</td>
									<td>Rp. <%= total_harga %></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4" class="text-center">
										<%
										String status = "";
										if (rs.getString("transactionstatus").equalsIgnoreCase("waiting")){
											status = "Waiting for Payment";
										}else if (rs.getString("transactionstatus").equalsIgnoreCase("waitpaymentapproval")){
											status = "Waiting for Payment Approval";
										}else{
											status = "Completed";
										}
										%>
										<span class="label label-success">Status Order: <%= status %></span>
									</td>
								</tr>
							</tfoot>
						</table>
					<%
						}
					%>
					
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