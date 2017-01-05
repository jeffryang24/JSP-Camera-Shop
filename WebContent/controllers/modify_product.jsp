<%@page import="java.util.regex.Pattern"%>
<%@ include file="/config/global.jsp" %>
<%@ include file="/helper/session_helper.jsp" %>
<%@ include file="/helper/validation_helper.jsp" %>
<%@ include file="/config/db.jsp" %>
<%
String CameraName = request.getParameter("CameraName") != null ? request.getParameter("CameraName").toString() : "";
String CameraPrice = request.getParameter("CameraPrice") != null ? request.getParameter("CameraPrice").toString() : "";
String CameraWeight = request.getParameter("CameraWeight") != null ? request.getParameter("CameraWeight").toString() : "";
String CameraStock = request.getParameter("CameraStock") != null ? request.getParameter("CameraStock").toString() : "";
String CameraSpecification = request.getParameter("CameraSpecification") != null ? request.getParameter("CameraSpecification").toString() : "";
String CameraImage = request.getParameter("CameraImage") != null ? request.getParameter("CameraImage").toString() : "";
String ProductID = request.getParameter("productid") != null ? request.getParameter("productid").toString() : "";

// validasi name
if (CameraName.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera name is required!"));
	return;
}

// validasi price
if (CameraPrice.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera price is required!"));
	return;
}else if (!isNumeric(CameraPrice)){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera price must be a number!"));
	return;
}else if (Integer.parseInt(CameraPrice) < 1000000 || Integer.parseInt(CameraPrice) > 50000000){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera price between 1000000 and 50000000!"));
	return;
}

// validasi weight
if (CameraWeight.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera weight is required!"));
	return;
}else if (!isNumeric(CameraWeight)){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera weight must be a number!"));
	return;
}

// validasi stock
if (CameraStock.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera stock is required!"));
	return;
}else if (!isNumeric(CameraStock)){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera stock must be a number!"));
	return;
}else if (Integer.parseInt(CameraStock) <= 0){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera stock must larger than 0!"));
	return;
}

// validasi spesifikasi
if (CameraSpecification.trim().equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera specification is required!"));
	return;
}

// validasi image
if (CameraImage.equalsIgnoreCase("")){
	response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera image file is required!"));
	return;
}else{
	String[] splitImg = CameraImage.split(Pattern.quote("."));
	if (splitImg.length < 2){
		response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera image file is required!"));
		return;
	}
	if (!splitImg[splitImg.length-1].equalsIgnoreCase("jpg") && !splitImg[splitImg.length-1].equalsIgnoreCase("jpeg") && !splitImg[splitImg.length-1].equalsIgnoreCase("png")){
		response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&err=" + GenerateURLParam("Camera image file extension is not supported!"));
		return;
	}
}


// add ke database
sql = "update Product set productname='" + CameraName + "', productprice='" + CameraPrice + "', productweight='"+CameraWeight+"', productstock='"+CameraStock+"', productspecification='"+CameraSpecification+"', productimage='assets/images/" + CameraImage + "' where productid = '" + ProductID + "'";

st.executeUpdate(sql);

response.sendRedirect(ROOT_PATH+"update_product.jsp?id="+ProductID+"&msg=" + GenerateURLParam("Product updated!"));
return;
%>