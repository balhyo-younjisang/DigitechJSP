<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jsp0404.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select p.P_CITY P_CITY_CODE,"
+ " CASE WHEN p.P_CITY = '10' THEN '서울' WHEN p.P_CITY = '20' THEN '경기' WHEN p.P_CITY = '30' THEN '강원' WHEN p.P_CITY = '40' THEN '대구' END P_CITY,"
+ " count(*) count"
+ " from TBL_PATIENT_202004 p, TBL_RESULT_202004 r"
+ " where p.P_NO = r.P_NO group by P_CITY ORDER BY P_CITY_CODE";
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
			<h2>(지역별)검사건수통계</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>지역코드</th>
						<th>지역명</th>
						<th>검사건수</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("P_CITY_CODE")%>
						<td><%=rs.getString("P_CITY")%>
						<td><%=rs.getString("COUNT")%>
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
