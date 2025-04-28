<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "SELECT PRODUCTNO, PRODUCTNAME, TRIM(TO_CHAR(PRODUCTPRICE, '999,999,999')) PRODUCTPRICE,"
		+ "CASE WHEN PRODUCTTYPE = '1' THEN '신발' WHEN PRODUCTTYPE = '2' THEN '기능성 의류' ELSE '일반 의류' END PRODUCTTYPE, PRODUCTSTOCK FROM PRODUCT_TBL ORDER BY PRODUCTNO ASC";
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
			<h1>상품 목록</h1>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품가격</th>
					<th>상품분류</th>
					<th>상품재고수량</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td>
						<a href="product_edit.jsp?productno=<%=rs.getString("PRODUCTNO")%>"><%=rs.getString("PRODUCTNO")%></a>
					</td>
					<td><%=rs.getString("PRODUCTNAME")%></td>
					<td><%=rs.getString("PRODUCTPRICE")%></td>
					<td><%=rs.getString("PRODUCTTYPE")%></td>
					<td><%=rs.getString("PRODUCTSTOCK")%></td>

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