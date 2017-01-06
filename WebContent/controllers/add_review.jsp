<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String review = request.getParameter("review") != null ? request.getParameter("review").toString() : "";
String userid = request.getParameter("userid") != null ? request.getParameter("userid").toString() : "";
String productid = request.getParameter("productid") != null ? request.getParameter("productid").toString() : "";

// validasi name
if (review.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"review.jsp?err=" + GenerateURLParam("Review is required!"));
	return;
}

// add ke database
sql = "select * from Review order by reviewid";
String sqlInsert = "";
ResultSet rs = st.executeQuery(sql);

if (!rs.isBeforeFirst()){
	// jika belum ada review, maka insert review baru
	sqlInsert = "insert into Review values (1,'"+userid+"','"+productid+"','"+review+"')";
}else{
	// kalau ada tinggal update review sebelumnya
	rs.last();
	int lastID= rs.getInt("reviewid");
	sqlInsert = "insert into Review values ("+(lastID+1)+",'"+userid+"','"+productid+"','"+review+"')";
}

rs.close();

st.executeUpdate(sqlInsert);

response.sendRedirect(ROOT_PATH+"review.jsp?msg=" + GenerateURLParam("Review inserted/updated!"));
return;
%>