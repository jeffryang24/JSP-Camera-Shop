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
<title>Aperture Shop .:: Capture Every Moment ::. - Manage Product</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<div class="row">
		<div class="col-md-12 index-inner-shadow"
			style="background: url('<%=IMG_PATH%>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: auto; margin-bottom: 10px; padding-top: 50px; padding-bottom: 50px;">
			<div class="col-md-8 col-md-offset-2 bg-white form-outer-shadow" style="padding-top: 15px;">
				<h3 class="text-center">Manage Product</h3>
				<%
				sql = "select * from Product";
				ResultSet rs = st.executeQuery(sql);
				
				if (!rs.next()){
				%>
				<div class="row">
					<div class="alert alert-danger text-center" role="alert">No Product Available!</div>
				</div>
				<%
				}else{
					rs.beforeFirst();
				%>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Image</th>
							<th>Name</th>
							<th>Stock</th>
							<th>Manage</th>
						</tr>
					</thead>
					<tbody>
						<%
						while(rs.next()){
						%>
						<tr>
							<td><img src="<%= ROOT_PATH + rs.getString("productimage") %>" width="150" height="90"></td>
							<td><%= rs.getString("productname") %></td>
							<td><%= rs.getString("productstock") %></td>
							<td>
								<a href="<%= ROOT_PATH%>update_product.jsp?id=<%= rs.getString("productid") %>" class="btn btn-success" role="button">Update</a>
								<a href="<%= ROOT_PATH%>delete_product.jsp?id=<%= rs.getString("productid") %>" class="btn btn-danger" role="button">Delete</a>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
					<tbody>
						
					</tbody>
				</table>
				<%
				}
				%>
				<%@ include file="/helper/error_helper.jsp" %>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>