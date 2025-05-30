<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="student.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "select id, name, substr(id, 1, 1) grade, substr(id, 2, 2) class, substr(id, 4,2) num,"
	+ " case when gender = '1' then '남' else '여' end gender from member_tbl_03 order by id";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp" %>
	<main>
		<section class="title">
			<h2>학생조회/수정</h2>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>이름</th>
					<th>학년</th>
					<th>반</th>
					<th>번호</th>
					<th>성별</th>
				</tr>
				<%
					while(rs.next()) {
				%>
				<tr>
					<td><a href="edit.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("name") %></a></td>
					<td><%=rs.getString("grade") %></td>
					<td><%=rs.getString("class") %></td>
					<td><%=rs.getString("num") %></td>
					<td><%=rs.getString("gender") %></td>
				</tr>
				<%
					}
				%>
			</table>
		</section>
	</main>
	<%@ include file="./component/footer.jsp" %>
</body>
<%
	DBConnection.close(rs, pstmt, conn);
%>
</html>