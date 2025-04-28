<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vote.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select M_NO, V_NAME, P_NAME, V_AREA," 
	+ " case when V_TIME = '1' then '고졸'"
	+ " when V_TIME = '2' then '학사'" 
	+ " when V_TIME = '3' then '석사'" 
	+ " when V_TIME = '4' then '박사' end V_TIME,"
	+ " V_CONFIRM," + " P_TEL1 || '-' || P_TEL2 || '-' || P_TEL3 P_TEL" + " from TBL_MEMBER_202005 m, TBL_PARTY_202005 p"
	+ " where m.P_CODE = p.P_CODE" + " order by M_NO";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./style/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h3>후보조회</h3>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역구</th>
					<th>대표전화</th>
				</tr>
				<%
				while(rs.next()) {
				%>
					<tr>
					<td><%=rs.getString("M_NO") %></td>
					<td><%=rs.getString("V_NAME") %></td>
					<td><%=rs.getString("P_NAME") %></td>
					<td><%=rs.getString("V_TIME") %></td>
					<td><%=rs.getString("V_AREA") %></td>
					<td><%=rs.getString("V_CONFIRM") %></td>
					<td><%=rs.getString("P_TEL") %></td>
				</tr>
				<%} %>
			</table>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>