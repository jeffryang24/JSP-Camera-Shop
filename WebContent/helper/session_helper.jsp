<%
// File ini bertujuan untuk menangani session pada aplikasi ini
String seUserRole = session.getAttribute("UserRole") != null ? session.getAttribute("UserRole").toString() : "";
String seUserName = session.getAttribute("UserName") != null ? session.getAttribute("UserName").toString() : "";
String seUserFullName = session.getAttribute("UserFullName") != null ? session.getAttribute("UserFullName").toString() : "";
String seUserID = session.getAttribute("UserID") != null ? session.getAttribute("UserID").toString() : "";
String seUserEmail = session.getAttribute("UserEmail") != null ? session.getAttribute("UserEmail").toString() : "";
String seUserPassword = session.getAttribute("UserPassword") != null ? session.getAttribute("UserPassword").toString() : "";
String seUserPhone = session.getAttribute("UserPhone") != null ? session.getAttribute("UserPhone").toString() : "";


// Numpang Cookie
String cookie_UserName = "", cookie_Password = "";
for(Cookie c : request.getCookies()){
	if (c.getName().equalsIgnoreCase("cUser")){
		cookie_UserName = c.getValue();
	}else if (c.getName().equalsIgnoreCase("cPass")){
		cookie_Password = c.getValue();
	}
}
%>
