<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "SELECT TO_CHAR(selldate, 'YYYY-MM-DD') SELLDATE, selltime, e.empname, p.productname, sellcount, TRIM(TO_CHAR(sellcount * p.productprice, '999,999,999')) sellprice"
			+ " FROM sell_tbl s, product_tbl p, emp_tbl e where s.empno = e.empno and p.productno = s.productno order by selldate desc, selltime desc";
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
			<h1>판매 내역 조회</h1>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>판매일자</th>
					<th>판매시각</th>
					<th>직원이름</th>
					<th>상품이름</th>
					<th>판매수량</th>
					<th>판매금액</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("SELLDATE")%></td>
					<td><%=rs.getString("SELLTIME")%></td>
					<td><%=rs.getString("EMPNAME")%></td>
					<td><%=rs.getString("productname")%></td>
					<td><%=rs.getString("sellcount")%></td>
					<td><%=rs.getString("sellprice")%></td>
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