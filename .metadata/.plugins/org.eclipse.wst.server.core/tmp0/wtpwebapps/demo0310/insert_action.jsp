<%@page import="java.sql.ResultSet"%>
<%@page import="demo0317.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Connection conn = DBConnection.getConnection();
    	String id = request.getParameter("id");
    	String password = request.getParameter("password");
    	
    	System.out.println("id : " + id);
    	System.out.println("password : " + password);
    	
    	String sql = "insert into tmp_tb(id, pass) values (?, ?)";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	pstmt.setString(2, password);
    	int rt_val = pstmt.executeUpdate();
    	
    	System.out.println("isnert 갯수 : " + rt_val);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>insert_action.jsp 페이지입니다</h2>
</body>
</html>