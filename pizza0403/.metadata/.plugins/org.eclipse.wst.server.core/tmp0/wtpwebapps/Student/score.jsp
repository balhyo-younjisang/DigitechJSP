<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="student.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "select ltrim(substr(id, 2, 2), '0') || '반' grade,"
			+" round(avg(korean), 0) korean,"
			+" round(avg(english), 0) english,"
			+" round(avg(math), 0) math,"
			+" round(avg(history), 0) history,"
			+" trim(to_char(sum(korean + english + math + history), '999,999,999')) total"
			+" from score_tbl_03"
			+" group by ltrim(substr(id, 2, 2), '0') || '반'"
			+" order by grade";
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
			<h2>반별성적조회</h2>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>반</th>
					<th>국어평균</th>
					<th>영어평균</th>
					<th>수학평균</th>
					<th>역사평균</th>
					<th>총점</th>
				</tr>
				<%
					while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("grade") %></td>
					<td><%=rs.getString("korean") %></td>
					<td><%=rs.getString("english") %></td>
					<td><%=rs.getString("math") %></td>
					<td><%=rs.getString("history") %></td>
					<td><%=rs.getString("total") %></td>
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