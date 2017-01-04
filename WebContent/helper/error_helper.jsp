<%
String error = request.getParameter("err") != null ? request.getParameter("err").toString() : "";
String message = request.getParameter("msg") != null ? request.getParameter("msg").toString() : "";
if (!error.equalsIgnoreCase("")){
%>
<div class="alert alert-danger" role="alert"><%= error %></div>
<%
}

if (!message.equalsIgnoreCase("")){
%>
<div class="alert alert-success" role="alert"><%= message %></div>
<%
}
%>
