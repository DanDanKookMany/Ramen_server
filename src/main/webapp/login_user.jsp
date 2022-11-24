<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	String dbUrl = "jdbc:mysql://localhost:3306/app3_community_db";
	String dbId = "root";
	String dbPw = "6591";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	
	String sql = "select user_idx from user_table " +
	"where user_id = ? and user_pw = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	pstmt.setString(2, userPw);
	
	ResultSet rs = pstmt.executeQuery();
	boolean chk = rs.next();
	
	if (chk == false) {
		out.write("FAIL");
	} else {
		int user_idx = rs.getInt("user_idx");
		out.write(user_idx + "");
	}
	
	conn.close();
%>