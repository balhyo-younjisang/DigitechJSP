<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="audition.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select ARTIST_ID, ARTIST_NAME, TO_CHAR(TO_DATE(ARTIST_BIRTH), 'YYYY\"년\"MM\"월\"DD\"일\"') ARTIST_BIRTH,"
		+ " case when ARTIST_GENDER = 'M' then '남자' when ARTIST_GENDER = 'F' then '여자' end ARTIST_GENDER,"
		+ " case when TALENT = '1' then '보컬' when TALENT = '2' then '댄스' when TALENT = '3' then '랩' end TALENT,"
		+ " AGENCY FROM TBL_ARTIST_201905 order by ARTIST_ID asc";
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
						<th>생년월일</th>
						<th>성별</th>
						<th>특기</th>
						<th>소속사</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
					<td><%=rs.getString("ARTIST_ID") %></td>
					<td><%=rs.getString("ARTIST_NAME") %></td>
					<td><%=rs.getString("ARTIST_BIRTH") %></td>
					<td><%=rs.getString("ARTIST_GENDER") %></td>
					<td><%=rs.getString("TALENT") %></td>
					<td><%=rs.getString("AGENCY") %></td>
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