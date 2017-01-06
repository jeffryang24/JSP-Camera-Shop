<%@page import="java.util.regex.Pattern"%>
<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";

// add ke database
sql = "delete from Review where reviewid='" + id + "'";

st.executeUpdate(sql);

response.sendRedirect(ROOT_PATH+"all_review.jsp?msg=" + GenerateURLParam("Review was deleted!"));
return;
%>