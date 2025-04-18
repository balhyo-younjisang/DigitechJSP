<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pizza0403.DBConnectoin"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnectoin.getConnection();
String sql = "select s.saleno, s.scode || '-' || sh.sname as sname, TO_CHAR(s.saledate, 'YYYY-MM-DD') as saledate, p.pname, s.pcode, s.amount,TO_CHAR(s.amount * p.cost, 'L99G999G999G999') as total from tbl_salelist_01 s, TBL_PIZZA_01 p, TBL_SHOP_01 sh where s.pcode = p.pcode and s.scode = sh.scode order by s.saleno";

PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자전문점 판매관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>통합매출현황조회</h2>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>매출전표번호</th>
					<th>지점</th>
					<th>판매일자</th>
					<th>피자코드</th>
					<th>피자명</th>
					<th>판매수량</th>
					<th>매출액</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("saleno")%></td>
					<td><%=rs.getString("sname")%></td>
					<td><%=rs.getString("saledate")%></td>
					<td><%=rs.getString("pcode")%></td>
					<td><%=rs.getString("pname")%></td>
					<td><%=rs.getString("amount")%></td>
					<td><%=rs.getString("total")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<%
DBConnectoin.close(rs, pstmt, conn);
%>
</html>