<%@page import="java.util.regex.Pattern"%>
<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String TextReview = request.getParameter("TextReview") != null ? request.getParameter("TextReview").toString() : "";
String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";

// add ke database
sql = "update Review set textreview='" + TextReview + "' where reviewid='" + id + "'";

st.executeUpdate(sql);

response.sendRedirect(ROOT_PATH+"update_review.jsp?id=" + id + "&msg=" + GenerateURLParam("Review was updated!"));
return;
%>