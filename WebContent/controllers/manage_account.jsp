<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
// ambil semua parameter
String FullName = request.getParameter("FullName") != null ? request.getParameter("FullName").toString() : "";
String UserName = request.getParameter("UserName") != null ? request.getParameter("UserName").toString() : "";
String Email = request.getParameter("Email") != null ? request.getParameter("Email").toString() : "";
String Password = request.getParameter("Password") != null ? request.getParameter("Password").toString() : "";
String Phone = request.getParameter("Phone") != null ? request.getParameter("Phone").toString() : "";

// validasi FullName
if (FullName.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Full Name is required!"));
	return;
}else if (!isValidFullname(FullName)){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Full Name only contains alphabet and whitespace!"));
	return;
}else if (FullName.length() < 4 || FullName.length() > 20){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Full Name length between 4 and 20 characters!"));
	return;
}

// validasi UserName
if (UserName.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Username is required!"));
	return;
}else if (!isAlphaNumeric(UserName)){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Username must be an alphanumeric!"));
	return;
}else if (UserName.length() < 5 || UserName.length() > 15){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Username length between 5 and 15 characters!"));
	return;
}

// validasi Email
if (Email.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Email is required!"));
	return;
}else if (!Email.matches(email_regex)){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Email is not valid!"));
	return;
}

// validasi password
if (Password.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Password is required!"));
	return;
}else if (!isValidPassword(Password)){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Password must contains lowercase, uppercase, digit, and alphabets!"));
	return;
}else if ((Password.length() < 7 || Password.length() > 15)){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Password length must between 7 and 15!"));
	return;
}

// validasi no. telepon
if (Phone.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Phone number is required!"));
	return;
}else if (!isNumeric(Phone)){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Phone number only contains number!"));
	return;
}else if (Phone.length() < 11 || Phone.length() > 13){
	response.sendRedirect(ROOT_PATH+"account.jsp?err=" + GenerateURLParam("Phone number length must between 11 and 13 digits!"));
	return;
}

// insert data ke database

// ambil id terakhir
sql = "update User set userfullname='"+FullName+"', username='"+UserName+"',useremail='"+Email+"',userpassword='"+Password+"',userphone='"+Phone+"' where userid='" + seUserID + "'";


st.executeUpdate(sql);

session.setAttribute("UserName", UserName);
session.setAttribute("UserFullName", FullName);
session.setAttribute("UserEmail", Email);
session.setAttribute("UserPassword", Password);
session.setAttribute("UserPhone", Phone);

response.sendRedirect(ROOT_PATH+"account.jsp?msg=" + GenerateURLParam("Account Updated!"));
return;
%>