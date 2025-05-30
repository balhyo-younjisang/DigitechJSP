<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="car.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select DEALER_NAME, COUNT(*) || '건' total, TRIM(TO_CHAR(SUM(SELL_PRICE), '999,999,999')) || '만원' TOTAL_PRICE"
+ " FROM TBL_DEALER_202504 d, TBL_SALES_202504 s"
+ " where d.DEALER_ID = s.DEALER_ID"
+ " GROUP BY DEALER_NAME"
+ " ORDER BY DEALER_NAME asc";
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
			<h2>딜러별 총 매출</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="register_action.jsp"
				method="post">
				<table border="1">
					<tr>
						<th>딜러명</th>
						<th>건수</th>
						<th>총 판매금액</th>
					</tr>
					<%
						while(rs.next()) {
					%>
						<tr>
							<td><%=rs.getString("DEALER_NAME") %></td>
							<td><%=rs.getString("TOTAL") %></td>
							<td><%=rs.getString("TOTAL_PRICE") %></td>
						</tr>
					<%
					}%>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<%
DBConnection.close(rs, pstmt, conn);
%>
</html>