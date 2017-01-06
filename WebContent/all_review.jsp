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
<title>Aperture Shop .:: Capture Every Moment ::. - All Review</title>
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
					<h3 class="text-center">All Review</h3>
					<div class="col-md-10 col-md-offset-1">
					<%
					sql = "select * from Product";
					ResultSet rs = st.executeQuery(sql);
					%>
						<table class="table" style="width: 100%;">
							<thead>
								<tr>
									<th>Camera Image</th>
									<th>Camera Name</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%
								while(rs.next()){
								%>
								<tr>
									<td><img src="<%= ROOT_PATH + rs.getString("productimage") %>" alt="product" width="100" height="100"></td>
									<td><%= rs.getString("productname") %></td>
									<td><button class="btn btn-primary" id="btnshow<%= rs.getString("productid") %>" type="button" onclick="script_show('tr<%= rs.getString("productid") %>',this)">Show Review</button></td>
								</tr>
								<tr id="tr<%= rs.getString("productid")%>" class="hilang-row">
									<%
										String sql2 = "select a.textreview, b.userfullname, a.userid, a.reviewid from Review a, User b where a.userid=b.userid and productid='" + rs.getString("productid") + "'";
										Statement st2 = con.createStatement(1004, 1008);
										ResultSet rs2 = st2.executeQuery(sql2);
										
										if (!rs2.next()){
									%>
										<td colspan="3">
											<div class="alert alert-danger text-center" role="alert">No Review Available!</div>
										</td>
									<%
										}else{
											rs2.beforeFirst();
									%>
										<td colspan="3">
											<table class="table">
												<thead>
													<tr>
														<th>Reviewed by</th>
														<th>Review</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
													while(rs2.next()){
													%>
													<tr>
														<td><%= rs2.getString("userfullname") %></td>
														<td><%= rs2.getString("textreview") %></td>
														<td>
															<%
															if (seUserID.equalsIgnoreCase(rs2.getString("userid"))){
															%>
															<a class="btn btn-success" role="button" href="<%= ROOT_PATH %>update_review.jsp?id=<%= rs2.getString("reviewid") %>">Update Review</a>
															<a class="btn btn-danger" role="button" href="<%= CTRL_PATH %>delete_review.jsp?id=<%= rs2.getString("reviewid") %>">Delete Review</a>
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
										</td>
									<%
										}
									%>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function script_show(e,e2){
			var el = document.querySelector("#" + e);
			if (el != null && el.className == "hilang-row"){
				el.classList.remove("hilang-row");
				e2.innerHTML = "Hide Review";
			}else if(el != null && el.className == ""){
				el.classList.add("hilang-row");
				e2.innerHTML = "Show Review";
			}
		}
	</script>
	<%-- Include Footer --%>
	<%@ include file="views/footer.jsp"%>