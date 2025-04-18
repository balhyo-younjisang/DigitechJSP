<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="audition.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select SERIAL_NO, A.ARTIST_ID, ARTIST_NAME, TO_CHAR(TO_DATE(ARTIST_BIRTH), 'YYYY\"년\"MM\"월\"DD\"일\"') ARTIST_BIRTH, POINT,"
			+ " case when POINT >= 90 then 'A'  when POINT >= 80 then 'B'  when POINT >= 70 then 'C' else 'D' end GRADE,"
			+ " MENTO_NAME FROM TBL_POINT_201905 P, TBL_ARTIST_201905 A, TBL_MENTO_201905 M where P.ARTIST_ID = A.ARTIST_ID and P.MENTO_ID = M.MENTO_ID"
			+ " order by SERIAL_NO asc";
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
						<th>채점번호</th>
						<th>참가번호</th>
						<th>참가자명</th>
						<th>생년월일</th>
						<th>점수</th>
						<th>평점</th>
						<th>멘토</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
					<td><%=rs.getString("SERIAL_NO") %></td>
					<td><%=rs.getString("ARTIST_ID") %></td>
					<td><%=rs.getString("ARTIST_NAME") %></td>
					<td><%=rs.getString("ARTIST_BIRTH") %></td>
					<td><%=rs.getString("POINT") %></td>
					<td><%=rs.getString("GRADE") %></td>
					<td><%=rs.getString("MENTO_NAME") %></td>
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