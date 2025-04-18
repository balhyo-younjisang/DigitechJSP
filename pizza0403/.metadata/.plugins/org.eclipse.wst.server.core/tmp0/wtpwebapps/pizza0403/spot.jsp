<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pizza0403.DBConnectoin"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnectoin.getConnection();
String sql = "select sh.scode, sh.sname, TO_CHAR(sum(s.amount * p.cost), 'L99G999G999G999') total from TBL_SALELIST_01 s, TBL_SHOP_01 sh, TBL_PIZZA_01 p where s.scode = sh.scode and s.pcode = p.pcode group by sh.scode, sh.sname order by sh.scode";

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
					<th>지점코드</th>
					<th>지점명</th>
					<th>총매출액</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("scode")%></td>
					<td><%=rs.getString("sname")%></td>
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