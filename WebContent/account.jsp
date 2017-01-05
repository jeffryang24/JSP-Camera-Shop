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
<title>Aperture Shop .:: Capture Every Moment ::. - Manage
	Account</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<div class="row">
		<div class="col-md-12 index-inner-shadow"
			style="background: url('<%=IMG_PATH%>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: auto; margin-bottom: 10px; padding-top: 50px; padding-bottom: 50px;">
			<div class="col-md-6 col-md-offset-3 bg-white form-outer-shadow" style="padding-top: 15px;">
				<h3 class="text-center">Manage Account</h3>
				<form class="form-horizontal" method="post" action="<%= CTRL_PATH %>manage_account.jsp">
					<div class="form-group">
						<label for="UserName" class="col-sm-2 control-label">Username</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="UserName" name="UserName"
								placeholder="" value="<%= seUserName %>">
						</div>
					</div>
					<div class="form-group">
						<label for="Password" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="Password" name="Password"
								placeholder="" value="<%= seUserPassword %>">
						</div>
					</div>
					<div class="form-group">
						<label for="FullName" class="col-sm-2 control-label">Full Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="FullName" name="FullName"
								placeholder="" value="<%= seUserFullName %>">
						</div>
					</div>
					<div class="form-group">
						<label for="Phone" class="col-sm-2 control-label">Phone Number</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="Phone" name="Phone"
								placeholder="" value="<%= seUserPhone %>">
						</div>
					</div>
					<div class="form-group">
						<label for="Email" class="col-sm-2 control-label">E-Mail</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="Email" name="Email"
								placeholder="" value="<%= seUserEmail %>">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</div>
				</form>
				<%@ include file="/helper/error_helper.jsp" %>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>