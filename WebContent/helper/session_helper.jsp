<%
// File ini bertujuan untuk menangani session pada aplikasi ini
String UserRole = session.getAttribute("UserRole") != null ? session.getAttribute("UserRole").toString() : "";
String UserName = session.getAttribute("UserName") != null ? session.getAttribute("UserName").toString() : "";
String UserFullName = session.getAttribute("UserFullName") != null ? session.getAttribute("UserFullName").toString() : "";
String UserID = session.getAttribute("UserID") != null ? session.getAttribute("UserID").toString() : "";
String UserEmail = session.getAttribute("UserEmail") != null ? session.getAttribute("UserEmail").toString() : "";


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
