<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="car.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select DEALER_NAME, TO_NUMBER(TRIM(TO_CHAR(SUM(SELL_PRICE)* 0.05, '999,999,999'))) INSENTIVE,"
+ " rank() over(order by SUM(SELL_PRICE) * 0.05 desc) rank_insentive"
+ " FROM TBL_DEALER_202504 d, TBL_SALES_202504 s"
+ " where d.DEALER_ID = s.DEALER_ID"
+ " GROUP BY DEALER_NAME"
+ " order by INSENTIVE desc";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>딜러 실적 순위 (인센티브 기준)</h2>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>순위</th>
					<th>딜러명</th>
					<th>인센티브(5%)</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("RANK_INSENTIVE")%></td>
					<td><%=rs.getString("DEALER_NAME")%></td>
					<td><%=rs.getString("INSENTIVE")%>만원</td>
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
DBConnection.close(rs, pstmt, conn);
%>
</html>