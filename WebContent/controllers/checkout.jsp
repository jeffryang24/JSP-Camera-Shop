<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String id = request.getParameter("id") != null ? request.getParameter("id").toString() : "";


// masukkan ke tabel transaksi header
sql = "select * from TransactionHeader order by transactionid";
ResultSet rs = st.executeQuery(sql);

if (!rs.next()){
	sql = "insert into TransactionHeader values(1,'"+seUserID+"', 'waiting', NOW())";
	st.executeUpdate(sql);
	sql = "insert into TransactionDetail select 1,a.productid,b.qty from Product a, Cart b where a.productid=b.productid and b.userid='" + seUserID + "'";
	st.executeUpdate(sql);
	sql = "delete from Cart where userid='" + seUserID + "'";
	st.executeUpdate(sql);
}else{
	rs.last();
	int lastID = rs.getInt("transactionid");
	sql = "insert into TransactionHeader values("+(lastID+1)+",'"+seUserID+"', 'waiting', NOW())";
	st.executeUpdate(sql);
	sql = "insert into TransactionDetail select "+(lastID+1)+",a.productid,b.qty from Product a, Cart b where a.productid=b.productid and b.userid='" + seUserID + "'";
	st.executeUpdate(sql);
	sql = "delete from Cart where userid='" + seUserID + "'";
	st.executeUpdate(sql);
}

response.sendRedirect(ROOT_PATH+"cart.jsp?msg=" + GenerateURLParam("Checkout has just been completed!"));
return;
%>