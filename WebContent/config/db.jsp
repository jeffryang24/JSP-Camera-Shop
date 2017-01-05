<%@ page import="java.sql.*,java.math.*" %>
<%!
/*
Konfigurasi Database
*/
String DB_HOST = "localhost";
String DB_PORT = "3306";
String DB_USERNAME = "jeffryangtoni";
String DB_PASSWORD = "jeffryangtoni";
String DB_NAME = "CameraShopDB";

String CON_STRING = "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME;
%>
<%
Connection con = null;
Statement st = null;
String sql = "";
try{
	// Register Driver
	Class.forName("com.mysql.jdbc.Driver");
	// Coba koneksi ke database
	con = DriverManager.getConnection(CON_STRING, DB_USERNAME, DB_PASSWORD);
	st = con.createStatement(1004,1008);
}catch(Exception ex){
	out.println("Error: " + ex.getMessage());
}
%>