<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jsp0404.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select P_NO, P_NAME, TO_CHAR(TO_DATE(P_BIRTH), 'YYYY\"년\"MM\"월\"DD\"일\"') P_BIRTH,"
		+ " CASE WHEN P_GENDER = 'M' THEN '남' WHEN P_GENDER = 'F' THEN '여' END P_GENDER,"
		+ " P_TEL1 || '-' ||  P_TEL2 || '-' || P_TEL3 P_TEL,"
		+ " CASE WHEN P_CITY = '10' THEN '서울' WHEN P_CITY = '20' THEN '경기' WHEN P_CITY = '30' THEN '강원' WHEN P_CITY = '40' THEN '대구' END P_CITY"
		+ " FROM TBL_PATIENT_202004";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진단검사 프로그램 ver 2020-04</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>환자 조회</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>환자번호</th>
						<th>환자성명</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>지역</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("P_NO")%>
						<td><%=rs.getString("P_NAME")%>
						<td><%=rs.getString("P_BIRTH")%>
						<td><%=rs.getString("P_GENDER")%>
						<td><%=rs.getString("P_TEL")%>
						<td><%=rs.getString("P_CITY")%>
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
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>
