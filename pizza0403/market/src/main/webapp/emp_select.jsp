<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "SELECT EMPNO, EMPNAME, EMPPHONE, TO_CHAR(EMPDATE, 'YYYY-MM-DD') EMPDATE"
		+ " FROM EMP_TBL ORDER BY EMPDATE DESC";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h1>직원 목록</h1>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>직원번호</th>
					<th>직원이름</th>
					<th>전화번호</th>
					<th>입사일자</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("empno")%></td>
					<td><%=rs.getString("empname")%></td>
					<td><%=rs.getString("empphone")%></td>
					
						<td><%=rs.getString("empdate")%></td>
				
					</tr>
					<%
					}
					%>
				</table>
		</section>
	</main>
</body>
</html>
<%
	DBConnection.close(rs, pstmt, conn);
%>