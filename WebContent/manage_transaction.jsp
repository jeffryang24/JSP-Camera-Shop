<%-- Jalankan config utama --%>
<%@ include file="config/global.jsp"%>
<%-- Jalankan Session Helper --%>
<%@ include file="/helper/session_helper.jsp"%>
<%
	// Halaman Product untuk member
	String pageRole = "admin"; // kosong brarti guest
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
<title>Aperture Shop .:: Capture Every Moment ::. - Manage Transaction</title>
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
					<h3 class="text-center">Manage Transaction</h3>
					<div class="col-md-10 col-md-offset-1">
					<%
					sql = "select a.transactionid, a.transactionstatus, a.transactiondate, b.userfullname from TransactionHeader a, User b where a.userid=b.userid";
					ResultSet rs = st.executeQuery(sql);
					
					if (!rs.next()){
					%>
						<div class="alert alert-danger text-center" role="alert">No Transaction Available!</div>
					<%
					}else{
						rs.beforeFirst();
					%>
						<table class="table table-stripped">
							<thead>
								<tr>
									<th>Item List</th>
									<th>Total</th>
									<th>Status</th>
									<th>Date</th>
									<th>Buyer</th>
									<th>Accept</th>
								</tr>
							</thead>
							<tbody>
								<%
								while(rs.next()){
								%>
								<tr>
									<td>
									<%
									String sql2 = "select b.productname, b.productimage, a.qty, b.productprice from TransactionDetail a, Product b where a.productid=b.productid and a.transactionid='" + rs.getString("transactionid") + "'";
									Statement st2 = con.createStatement(1004, 1008);
									ResultSet rs2 = st2.executeQuery(sql2);
									int total_price = 0;
									while(rs2.next()){
										total_price += rs2.getInt("qty") * rs2.getInt("productprice");
									%>
									<div class="row">
										<img alt="product" src="<%= ROOT_PATH + rs2.getString("productimage") %>" width="90" height="90">
										<p><%= rs2.getString("productname") + " " + rs2.getString("qty") + " pcs" %></p>
									</div>
									<%
									}
									%>
									</td>
									<td>Rp. <%= total_price %></td>
									<%
										String status = "";
										if (rs.getString("transactionstatus").equalsIgnoreCase("waiting")){
											status = "Waiting for Payment";
										}else if(rs.getString("transactionstatus").equalsIgnoreCase("waitpaymentapproval")){
											status = "Waiting for Payment Approval";
										}else{
											status = "Order Completed";
										}
									%>
									<td><%= status %></td>
									<td><%= rs.getString("transactiondate") %></td>
									<td><%= rs.getString("userfullname") %></td>
									<td>
										<%
										String accept = "";
										if (rs.getString("transactionstatus").equalsIgnoreCase("waiting")){
											accept = "Waiting";
										}else if(rs.getString("transactionstatus").equalsIgnoreCase("waitpaymentapproval")){
											accept = "";
										}else{
											accept = "Accepted";
										}
										%>
										<%
										if (accept.equals("")){
										%>
										<a href="<%= CTRL_PATH %>approve_payment.jsp?id=<%= rs.getString("transactionid") %>" class="btn btn-success" role="button">Accept Payment</a>
										<%
										}else{
										%>
										<%= accept %>
										<%
										}
										%>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
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