<%@ include file="/config/global.jsp"%>
<%@ include file="/helper/validation_helper.jsp"%>
<%@ include file="/config/db.jsp"%>
<%
String txtUsername = request.getParameter("txtUsername") != null ? request.getParameter("txtUsername").toString() : "";
String txtPassword = request.getParameter("txtPassword") != null ? request.getParameter("txtPassword").toString() : "";
String chkRememberMe = request.getParameter("chkRememberMe") != null ? request.getParameter("chkRememberMe").toString() : "";

// validasi
if (txtUsername.equalsIgnoreCase("") || txtPassword.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Username and password is required!"));
	return;
}

sql = "select * from User where username = '" + txtUsername + "' and userpassword = '" + txtPassword + "'";
ResultSet rs = st.executeQuery(sql);

if (!rs.isBeforeFirst()){
	// user tidak eksis
	response.sendRedirect(ROOT_PATH+"index.jsp?err=" + GenerateURLParam("Your credentials doesn't match our records!"));
	return;
}else{
	rs.next();
	
	// untuk session
	session.setAttribute("UserID", rs.getString("userid"));
	session.setAttribute("UserName", rs.getString("username"));
	session.setAttribute("UserFullName", rs.getString("userfullname"));
	session.setAttribute("UserRole", rs.getString("userrole"));
	session.setAttribute("UserEmail", rs.getString("useremail"));
	session.setAttribute("UserPassword", rs.getString("userpassword"));
	session.setAttribute("UserPhone", rs.getString("userphone"));
	
	// set user online
	int user_online = 0;
	if (application.getAttribute("app_user_online") == null){
		user_online = 1;
		application.setAttribute("app_user_online", user_online);
	}else{
		user_online = (Integer)application.getAttribute("app_user_online");
		application.setAttribute("app_user_online", user_online + 1);
	}
	
	// check jika remember me dicentang
	if (chkRememberMe.equalsIgnoreCase("on")){
		Cookie cUser = new Cookie("cUser", txtUsername);
		Cookie cPass = new Cookie("cPass", txtPassword);
		
		cUser.setMaxAge(24 * 3600);	// 3600 sec = 1 hour
		cPass.setMaxAge(24 * 3600);
		cUser.setPath(ROOT_PATH);
		cPass.setPath(ROOT_PATH);
		
		response.addCookie(cUser);
		response.addCookie(cPass);	
	}
	
	response.sendRedirect(ROOT_PATH+"index.jsp");
	return;
}
%>