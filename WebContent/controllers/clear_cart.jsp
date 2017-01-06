<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";


// akumulasi stock ke kondisi awal dan hapus cart
sql = "update Product a, Cart b set a.productstock=a.productstock+b.qty where a.productid=b.productid and b.userid='"+seUserID+"'";
st.executeUpdate(sql);
// hapus cart
sql = "delete from Cart where userid='" + seUserID + "'";
st.executeUpdate(sql);


response.sendRedirect(ROOT_PATH+"cart.jsp?msg=" + GenerateURLParam("Cart was cleaned!"));
return;
%>