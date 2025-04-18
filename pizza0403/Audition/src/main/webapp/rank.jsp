<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="audition.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select A.ARTIST_ID, A.ARTIST_NAME, SUM(P.POINT) SUM_POINT, TO_CHAR(ROUND(AVG(P.POINT), 2), '99.99') AVG_POINT, DENSE_RANK() OVER (ORDER BY SUM(P.POINT) DESC) RANK"
		+ " from TBL_ARTIST_201905 A, TBL_POINT_201905 P where A.ARTIST_ID = P.ARTIST_ID"
		+ " group by A.ARTIST_ID, ARTIST_NAME";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>오디션 등록</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="POST"
				action="register_action.jsp">
				<table border="1">
					<tr>
						<th>참가번호</th>
						<th>참가자명</th>
						<th>총점</th>
						<th>평균</th>
						<th>등수</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("ARTIST_ID")%></td>
						<td><%=rs.getString("ARTIST_NAME")%></td>
						<td><%=rs.getString("SUM_POINT")%></td>
						<td><%=rs.getString("AVG_POINT")%></td>
						<td><%=rs.getString("RANK")%></td>
					</tr>
					<%
					}
					%>
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