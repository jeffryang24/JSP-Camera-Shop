<%
// File ini bertujuan untuk menangani session pada aplikasi ini
String UserRole = session.getAttribute("UserRole") != null ? session.getAttribute("UserRole").toString() : "";
String UserName = session.getAttribute("UserName") != null ? session.getAttribute("UserName").toString() : "";
String UserFullName = session.getAttribute("UserFullName") != null ? session.getAttribute("UserFullName").toString() : "";
String UserID = session.getAttribute("UserID") != null ? session.getAttribute("UserID").toString() : "";
%>
