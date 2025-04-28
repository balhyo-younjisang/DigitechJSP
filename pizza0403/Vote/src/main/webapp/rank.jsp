<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vote.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select m.M_NO, m.V_NAME, P_NAME, count(*) total"
+ " from TBL_MEMBER_202005 m, TBL_VOTE_202005 v, TBL_PARTY_202005 p"
+ " where m.M_NO = v.M_NO and m.P_CODE = p.P_CODE and v.V_CONFIRM = 'Y'"
+ " GROUP BY m.M_NO, m.V_NAME, P_NAME"
+ " order by total desc";
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
			<h3>후보자등수</h3>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>후보번호</th>
					<th>후보자명</th>
					<th>당명</th>
					<th>득표수</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("M_NO")%></td>
					<td><%=rs.getString("V_NAME")%></td>
					<td><%=rs.getString("P_NAME")%></td>
					<td><%=rs.getString("TOTAL")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>