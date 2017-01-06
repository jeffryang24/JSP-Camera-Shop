<%@page import="java.util.regex.Pattern"%>
<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String cartqty = request.getParameter("cartqty") != null ? request.getParameter("cartqty").toString() : "";
String ProductID = request.getParameter("ProductID") != null ? request.getParameter("ProductID").toString() : "";

// validasi qty
if (cartqty.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"product.jsp?err=" + GenerateURLParam("Quantity can't be empty!"));
	return;
}else if (Integer.parseInt(cartqty) <= 0){
	response.sendRedirect(ROOT_PATH+"product.jsp?err=" + GenerateURLParam("Quantity must larger than 0!"));
	return;
}

// cek stok
sql = "select productstock from Product where productid='" + ProductID + "'";
ResultSet rs = st.executeQuery(sql);
rs.next();
int stock = rs.getInt("productstock");
if (Integer.parseInt(cartqty) > stock){
	response.sendRedirect(ROOT_PATH+"product.jsp?err=" + GenerateURLParam("Quantity is bigger than available stock!"));
	return;
}

if (stock <= 0){
	response.sendRedirect(ROOT_PATH+"product.jsp?err=" + GenerateURLParam("No stock for this product!"));
	return;
}

// add ke database
sql = "select * from Cart where userid='" + seUserID + "' and productid='" + ProductID + "'";
rs = st.executeQuery(sql);

if (!rs.next()){
	// belum ada di add ke cart,
	// maka insert cart baru
	sql = "insert into Cart values('"+seUserID+"','"+ProductID+"','"+cartqty+"')";
	st.executeUpdate(sql);
	// update stock
	sql = "update Product set productstock=productstock-" + cartqty + " where productid='" + ProductID + "'";
	st.executeUpdate(sql);
}else{
	// update stock (refresh stock to first time)
	sql = "update Product a, Cart b set a.productstock=a.productstock+b.qty where a.productid=b.productid and b.productid='" + ProductID + "' and b.userid='" + seUserID + "'";
	st.executeUpdate(sql);
	// kalau sudah ada,
	// maka tinggal diupdate saja
	sql = "update Cart set qty='"+cartqty+"' where userid='" + seUserID + "' and productid='" + ProductID + "'";
	st.executeUpdate(sql);
	// update stock yang baru lagi
	sql = "update Product set productstock=productstock-" + cartqty + " where productid='" + ProductID + "'";
	st.executeUpdate(sql);
}

response.sendRedirect(ROOT_PATH+"product.jsp?msg=" + GenerateURLParam("Product was added to cart!"));
return;
%>