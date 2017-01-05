<%
// ini untuk yang guest
if (UserRole.equalsIgnoreCase("")){
%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<%-- Brand and toggle get grouped for better mobile display --%>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<%-- Collect the nav links, forms, and other content for toggling --%>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%= ROOT_PATH %>index.jsp">Home</a></li>
				<li><a href="<%= ROOT_PATH %>register.jsp">Register</a></li>
			</ul>
			<form class="navbar-form navbar-right" method="post" action="<%= CTRL_PATH %>auth.jsp">
				<div class="form-group">
					<label for="txtUsername">Username</label>
					<input type="text" class="form-control" placeholder="Username"
						id="txtUsername" name="txtUsername" value="<%= cookie_UserName %>">
				</div>
				<div class="form-group">
					<label for="txtPassword">Password</label>
					<input type="password" class="form-control" placeholder="Password"
						id="txtPassword" name="txtPassword" value="<%= cookie_Password %>">
				</div>
				<div class="checkbox">
			    	<label>
						  <input type="checkbox" name="chkRememberMe"><span style="vertical-align: top;"> Remember me</span>
			    	</label>
			  	</div>
				<button type="submit" class="btn btn-primary">Login</button>
			</form>
		</div>
		<%-- /.navbar-collapse --%>
	</div>
	<%-- /.container-fluid --%>
</nav>
<%
}else if (UserRole.equalsIgnoreCase("admin")){
%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<%-- Brand and toggle get grouped for better mobile display --%>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<%-- Collect the nav links, forms, and other content for toggling --%>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%= ROOT_PATH %>index.jsp">Home</a></li>
				<li><a href="<%= ROOT_PATH %>insert_product.jsp">Insert Product</a></li>
				<li><a href="<%= ROOT_PATH %>manage_product.jsp">Manage Product</a></li>
				<li><a href="<%= ROOT_PATH %>manage_transaction.jsp">Manage Transaction</a></li>
			</ul>
			<form class="navbar-form navbar-right" method="post" action="<%= CTRL_PATH %>auth_out.jsp">
				<button type="submit" class="btn btn-primary">Log Out</button>
			</form>
		</div>
		<%-- /.navbar-collapse --%>
	</div>
	<%-- /.container-fluid --%>
</nav>
<%
}else if (UserRole.equalsIgnoreCase("member")){
%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<%-- Brand and toggle get grouped for better mobile display --%>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<%-- Collect the nav links, forms, and other content for toggling --%>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%= ROOT_PATH %>index.jsp">Home</a></li>
				<li><a href="<%= ROOT_PATH %>transaction.jsp">Transaction</a></li>
				<li><a href="<%= ROOT_PATH %>cart.jsp">Cart</a></li>
				<li><a href="<%= ROOT_PATH %>review.jsp">My Review</a></li>
				<li><a href="<%= ROOT_PATH %>all_review.jsp">All Review</a></li>
				<li><a href="<%= ROOT_PATH %>account.jsp">Manage Account</a></li>
				<li><a href="<%= ROOT_PATH %>product.jsp">Product</a></li>
			</ul>
			<form class="navbar-form navbar-right" method="post" action="<%= CTRL_PATH %>auth_out.jsp">
				<button type="submit" class="btn btn-primary">Log Out</button>
			</form>
		</div>
		<%-- /.navbar-collapse --%>
	</div>
	<%-- /.container-fluid --%>
</nav>
<%
}
%>