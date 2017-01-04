<%-- Jalankan config utama --%>
<%@ include file="config/global.jsp"%>
<%-- Jalankan Session Helper --%>
<%@ include file="/helper/session_helper.jsp" %>
<%
// Halaman Register hanya untuk Guest
String pageRole = "";	// kosong brarti guest
if (!UserRole.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH + "index.jsp");
	return;
}
%>
<%-- Include Header --%>
<%@ include file="views/header.jsp"%>
<%-- Include Content --%>
<title>Aperture Shop .:: Capture Every Moment ::. - Register Account</title>
</head>
<body>
	<%-- Include Main Menu --%>
	<%@ include file="views/menu.jsp"%>
	<hr>
	<div class="row">
		<div class="col-md-12 index-inner-shadow"
			style="background: url('<%=IMG_PATH%>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: 700px; margin-bottom: 10px;">
			<div class="col-md-6 col-md-offset-3 bg-white form-outer-shadow"
				style="margin-top: 30px;">
				<h3 class="text-center">Register</h3>
				<form style="margin-bottom: 15px;" method="post" action="<%= CTRL_PATH %>doRegister.jsp">
                    <div class="form-group">
						<label for="txtFullName">Full Name:</label><input
							type="text" class="form-control" id="txtFullName" name="FullName"
							placeholder="">
					</div>
                    <div class="form-group">
						<label for="txtUserName">User Name:</label><input
							type="text" class="form-control" id="txtUserName" name="UserName"
							placeholder="">
					</div>
					<div class="form-group">
						<label for="txtEmail">E-Mail:</label> <input
							type="text" class="form-control" id="txtEmail" name="Email"
							placeholder="ex. username@domain.com">
					</div>
					<div class="form-group">
						<label for="txtPass">Password:</label> <input
							type="password" class="form-control" id="txtPass" name="Password"
							placeholder="">
					</div>
                    <div class="form-group">
						<label for="txtPassConfirm">Confirm Password:</label> <input
							type="password" class="form-control" id="txtPassConfirm" name="PasswordConfirm"
							placeholder="">
					</div>
                    <div class="form-group">
						<label for="txtPhone">Phone Number:</label><input
							type="text" class="form-control" id="txtPhone" name="Phone"
							placeholder="">
					</div>   
                    <div class="form-group">
						<label for="txtBirthDate">Birthdate:</label><input
							type="text" class="form-control" id="txtBirthDate" name="BirthDate"
							placeholder="dd-mm-yyyy">
					</div>                
					<button type="submit" class="btn btn-primary">Register</button>
				</form>
                <%@ include file="/helper/error_helper.jsp" %>
			</div>
		</div>
	</div>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>