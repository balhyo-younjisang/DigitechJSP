<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="golf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "SELECT c.TEACHER_CD, TEACHER_NM, CLASS_NM, TRIM(TO_CHAR(SUM(c.CLASS_PRICE), 'L999,999,999')) CLASS_PRICE"
			+ " FROM TBL_CLASS_202305 c, TBL_TEACHER_202305 t"
			+ " WHERE c.TEACHER_CD = t.TEACHER_CD"
			+ " GROUP BY c.TEACHER_CD, TEACHER_NM, CLASS_NM"
			+ " ORDER BY c.TEACHER_CD";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 연습장 회원관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>강사매출현황</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>강사코드</th>
						<th>강의명</th>
						<th>강사명</th>
						<th>총매출</th>
					</tr>
					<% while(rs.next()) { %>
					<tr>
						<td><%=rs.getString("teacher_cd") %></td>
						<td><%=rs.getString("teacher_nm") %></td>
						<td><%=rs.getString("class_nm") %></td>
						<td><%=rs.getString("class_price") %></td>
					</tr>
					<% } %>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<%
	DBConnection.close(rs, pstmt, conn);
%>
</html>