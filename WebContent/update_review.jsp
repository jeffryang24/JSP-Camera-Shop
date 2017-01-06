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
<title>Aperture Shop .:: Capture Every Moment ::. - Update Review</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<div class="row">
		<div class="col-md-12 index-inner-shadow"
			style="background: url('<%=IMG_PATH%>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: auto; margin-bottom: 10px; padding-top: 50px; padding-bottom: 50px;">
			<div class="col-md-6 col-md-offset-3 bg-white form-outer-shadow" style="padding-top: 15px;">
				<h3 class="text-center">Update Review</h3>
				<%
				String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";
				sql = "select a.textreview, b.productname from Review a, Product b where a.productid=b.productid and a.reviewid='" + id + "'";
				ResultSet rs = st.executeQuery(sql);
				rs.next();
				%>
				<form class="form-horizontal" method="post" action="<%= CTRL_PATH %>ctl_update_review.jsp">
					<div class="form-group">
						<label for="CameraName" class="col-sm-2 control-label">Camera Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="CameraName" name="CameraName" disabled value="<%= rs.getString("productname") %>">
						</div>
					</div>
					<div class="form-group">
						<label for="TextReview" class="col-sm-2 control-label">Camera Specification</label>
						<div class="col-sm-10">
							<textarea rows="3" class="form-control" name="TextReview"><%= rs.getString("textreview") %></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="hidden" name="id" value="<%= id %>">
							<button type="submit" class="btn btn-primary">Update Review</button>
						</div>
					</div>
				</form>
				<%@ include file="/helper/error_helper.jsp" %>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>