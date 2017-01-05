<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
// ambil semua parameter
String FullName = request.getParameter("FullName") != null ? request.getParameter("FullName").toString() : "";
String UserName = request.getParameter("UserName") != null ? request.getParameter("UserName").toString() : "";
String Email = request.getParameter("Email") != null ? request.getParameter("Email").toString() : "";
String Password = request.getParameter("Password") != null ? request.getParameter("Password").toString() : "";
String PasswordConfirm = request.getParameter("PasswordConfirm") != null ? request.getParameter("PasswordConfirm").toString() : "";
String Phone = request.getParameter("Phone") != null ? request.getParameter("Phone").toString() : "";
String BirthDate = request.getParameter("BirthDate") != null ? request.getParameter("BirthDate").toString() : "";

// validasi FullName
if (FullName.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Full Name is required!"));
	return;
}else if (!isValidFullname(FullName)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Full Name only contains alphabet and whitespace!"));
	return;
}else if (FullName.length() < 4 || FullName.length() > 20){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Full Name length between 4 and 20 characters!"));
	return;
}

// validasi UserName
if (UserName.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Username is required!"));
	return;
}else if (!isAlphaNumeric(UserName)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Username must be an alphanumeric!"));
	return;
}else if (UserName.length() < 5 || UserName.length() > 15){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Username length between 5 and 15 characters!"));
	return;
}

// validasi Email
if (Email.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Email is required!"));
	return;
}else if (!Email.matches(email_regex)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Email is not valid!"));
	return;
}

// validasi password
if (Password.equalsIgnoreCase("") || PasswordConfirm.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Password is required!"));
	return;
}else if (!isValidPassword(Password) || !isValidPassword(PasswordConfirm)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Password must contains lowercase, uppercase, digit, and alphabets!"));
	return;
}else if ((Password.length() < 7 || Password.length() > 15) || (PasswordConfirm.length() < 7 && PasswordConfirm.length() > 15)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Password length must between 7 and 15!"));
	return;
}else if (Password.length() != PasswordConfirm.length()){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Password and Password Confirmation length is not same!"));
	return;
}else if (!Password.equals(PasswordConfirm)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Password and Password Confirmation must same!"));
	return;
}

// validasi no. telepon
if (Phone.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Phone number is required!"));
	return;
}else if (!isNumeric(Phone)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Phone number only contains number!"));
	return;
}else if (Phone.length() < 11 || Phone.length() > 13){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Phone number length must between 11 and 13 digits!"));
	return;
}

// validasi tanggal ulang tahun
if (BirthDate.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Birth Date is required!"));
	return;
}else if (!isValidBirthDate(BirthDate)){
	response.sendRedirect(ROOT_PATH+"register.jsp?err=" + GenerateURLParam("Birth Date is not valid!"));
	return;
}

// insert data ke database

// ambil id terakhir
sql = "select * from User order by userid";
String sqlInsert = "";
ResultSet rs = st.executeQuery(sql);

if (!rs.isBeforeFirst()){
	// jika tidak ada data, maka insert default id = 1
	// default role = member
	sqlInsert = "insert into User values (1,'"+FullName+"','"+UserName+"','"+Email+"','"+Password+"','"+Phone+"','"+BirthDate+"','member')";
}else{
	rs.last();
	int lastID = rs.getInt("userid");
	sqlInsert = "insert into User values ("+ (lastID+1) + ",'"+FullName+"','"+UserName+"','"+Email+"','"+Password+"','"+Phone+"','"+BirthDate+"','member')";
}

rs.close();

st.executeUpdate(sqlInsert);

response.sendRedirect(ROOT_PATH+"register.jsp?msg=" + GenerateURLParam("Registration Successful!"));
return;
%>