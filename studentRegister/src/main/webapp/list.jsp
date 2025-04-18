<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "SELECT * FROM student_tmp_tb ORDER BY STD_NO";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/list.css">
<link rel="stylesheet" href="./css/footer.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<h2>학생현황</h2>
		<section>
		<p>학번 | 이름 </p>
	<%
		while(rs.next()) {
	%>
		<div class="table">	
			<p><%=rs.getString(1) %></p>
			<p><%=rs.getString(2) %></p>
		</div>
	<%
		}
	%>
	</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<%
	DBConnection.close(rs, pstmt, conn);
%>
</html>