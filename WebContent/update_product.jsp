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
<title>Aperture Shop .:: Capture Every Moment ::. - Update Product</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<%
	String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";
	sql = "select * from Product where productid='" + id + "'";
	ResultSet rs = st.executeQuery(sql);
	rs.next();
	%>
	<div class="row">
		<div class="col-md-12 index-inner-shadow"
			style="background: url('<%=IMG_PATH%>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: auto; margin-bottom: 10px; padding-top: 50px; padding-bottom: 50px;">
			<div class="col-md-6 col-md-offset-3 bg-white form-outer-shadow" style="padding-top: 15px;">
				<h3 class="text-center">Insert Product</h3>
				<form class="form-horizontal" method="post" action="<%= CTRL_PATH %>modify_product.jsp">
					<div class="form-group">
						<label for="CameraName" class="col-sm-2 control-label">Camera Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="CameraName" name="CameraName" value="<%= rs.getString("productname") %>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="CameraPrice">Camera Price</label>
						<div class="col-sm-10">
							<div class="input-group">
								<div class="input-group-addon">IDR</div>
								<input type="text" class="form-control" id="CameraPrice" name="CameraPrice" value="<%= rs.getString("productprice") %>">
								<div class="input-group-addon">.00</div>
							</div>
						</div>
				  	</div>
				  	<div class="form-group">
				    	<label class="col-sm-2 control-label" for="CameraWeight">Camera Weight</label>
					    <div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control" id="CameraWeight" name="CameraWeight" value="<%= rs.getString("productweight") %>">
								<div class="input-group-addon">Grams</div>
							</div>
						</div>
				  	</div>
					<div class="form-group">
				    	<label class="col-sm-2 control-label" for="CameraStock">Camera Stock</label>
					    <div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control" id="CameraStock" name="CameraStock" value="<%= rs.getString("productstock") %>">
								<div class="input-group-addon">Pcs</div>
							</div>
						</div>
				  	</div>
					<div class="form-group">
						<label for="CameraSpecification" class="col-sm-2 control-label">Camera Specification</label>
						<div class="col-sm-10">
							<textarea rows="3" class="form-control" name="CameraSpecification"><%= rs.getString("productspecification") %></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="CameraImage" class="col-sm-2 control-label">Camera Image</label>
						<div class="col-sm-10">
							<input type="file" id="CameraImage" name="CameraImage">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" name="productid" value="<%= rs.getString("productid") %>"> 
							<button type="submit" class="btn btn-primary">Update Product</button>
						</div>
					</div>
				</form>
				<%@ include file="/helper/error_helper.jsp" %>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>