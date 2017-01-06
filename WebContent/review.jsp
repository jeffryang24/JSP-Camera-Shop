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
<title>Aperture Shop .:: Capture Every Moment ::. - My Review</title>
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
					<h3 class="text-center">Choose Camera to Review</h3>
					<div class="col-md-10 col-md-offset-1">
						<form method="post" action="<%= ROOT_PATH %>review.jsp">
							<div class="form-group">
								<div class="col-md-10" style="padding-right: 0;">
								<%
								sql = "select * from Product order by productname";
								ResultSet rs = st.executeQuery(sql);
								%>
									<select name="item" class="form-control">
										<%
										while(rs.next()){
										%>
										<option value="<%= rs.getString("productid") %>"><%= rs.getString("productname") %></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-2" style="padding-left: 0;">
									<input type="submit" value="Set" class="btn btn-default">
								</div>
							</div>
						</form>
					</div>
				</div>
				<%
				String item = request.getParameter("item") != null ? request.getParameter("item").toString() : "";
				if (!item.equalsIgnoreCase("")){
				%>
				<div class="row">
					<h3 class="text-center">Review Form</h3>
					<div class="col-md-10 col-md-offset-1">
						<table class="table">
							<thead>
								<tr>
									<th>Product Image</th>
									<th class="col-md-3">Product Name</th>
									<th class="col-md-4">Your Review</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<%
								sql = "select * from Product where productid = '" + item + "'";
								rs = st.executeQuery(sql);
								rs.next();
								%>
									<form method="POST" action="<%= CTRL_PATH %>add_review.jsp">
										<td><img src="<%= ROOT_PATH + rs.getString("productimage") %>" alt="product_image" width="90" height="90"></td>
										<td class="text-left"><%= rs.getString("productname") %></td>
										<td>
											<textarea class="form-control text-left" rows="4" cols="3" name="review"></textarea>
										</td>
										<td>
											<input type="hidden" name="userid" value="<%= seUserID %>">
											<input type="hidden" name="productid" value="<%= rs.getString("productid") %>">
											<input type="submit" value="Review Product" class="btn btn-primary">
										</td>
									</form>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>