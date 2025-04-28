<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "SELECT EMPNAME, SUM(SELLCOUNT) cnt, TRIM(TO_CHAR(SUM(PRODUCTPRICE * SELLCOUNT), '999,999,999')) TOTAL"
			+ " FROM EMP_TBL E, PRODUCT_TBL P, SELL_TBL S WHERE E.EMPNO = S.EMPNO AND P.PRODUCTNO = S.PRODUCTNO GROUP BY EMPNAME ORDER BY cnt DESC";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h1>직원별 판매 현황</h1>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>직원이름</th>
					<th>누적판매액</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("EMPNAME")%></td>
					<td><%=rs.getString("TOTAL")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
	</main>
</body>
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>