<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";


sql = "update TransactionHeader set transactionstatus='waitpaymentapproval' where transactionid='" + id + "'";
st.executeUpdate(sql);


response.sendRedirect(ROOT_PATH+"transaction.jsp");
return;
%>