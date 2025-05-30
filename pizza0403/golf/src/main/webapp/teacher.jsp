<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="golf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "SELECT teacher_cd, teacher_nm, class_nm, TRIM(TO_CHAR(class_price, 'L999,999,999')) class_price, TO_CHAR(TO_DATE(register_date), 'yyyy\"년\"mm\"월\"dd\"일\"') register_date  from tbl_teacher_202305 order by teacher_cd desc";
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
			<h2>강사조회</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>강사코드</th>
						<th>강사명</th>
						<th>강의명</th>
						<th>수강료</th>
						<th>강사자격취득일</th>
					</tr>
					<% while(rs.next()) { %>
					<tr>
						<td><%=rs.getString("teacher_cd") %></td>
						<td><%=rs.getString("teacher_nm") %></td>
						<td><%=rs.getString("class_nm") %></td>
						<td><%=rs.getString("class_price") %></td>
						<td><%=rs.getString("register_date") %></td>
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