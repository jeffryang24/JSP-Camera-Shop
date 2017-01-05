<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";

sql = "delete from Product where productid = '" + id + "'";

st.executeUpdate(sql);

response.sendRedirect(ROOT_PATH+"manage_product.jsp");
return;
%>