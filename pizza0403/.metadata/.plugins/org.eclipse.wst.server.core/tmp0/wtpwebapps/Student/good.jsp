<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="student.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "select * from (select m.id, name, korean, english, math, history, korean + english + math + history total,"
			+ " rank() over (order by korean + english + math + history desc) as rank_total"
			+ " from score_tbl_03 s, member_tbl_03 m"
			+ " where s.id = m.id) where rownum <= 3";
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
			<h2>성적우수자</h2>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>역사</th>
					<th>총계</th>
					<th>등수</th>
				</tr>
				<%
					while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("id") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("korean") %></td>
					<td><%=rs.getString("english") %></td>
					<td><%=rs.getString("math") %></td>
					<td><%=rs.getString("history") %></td>
					<td><%=rs.getString("total") %></td>
					<td><%=rs.getString("rank_total") %></td>
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