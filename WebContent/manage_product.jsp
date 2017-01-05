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
			<div class="col-md-6 col-md-offset-3 bg-white form-outer-shadow" style="padding-top: 15px;">
				<h3 class="text-center">Manage Product</h3>
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
						
					</tbody>
				</table>
				<%@ include file="/helper/error_helper.jsp" %>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>