<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="car.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select CAR_ID, CAR_NAME, TRIM(TO_CHAR(BUY_PRICE, '999,999,999')) || '만원' BUY_PRICE,"
+ " TRIM(TO_CHAR(BUY_PRICE * 1.2, '999,999,999')) || '만원' SELL_PRICE,"
+ " DEALER_NAME"
+ " FROM TBL_CAR_202504 c, TBL_DEALER_202504 d"
+ " where c.dealer_id = d.dealer_id and IS_SOLD = 'N'";
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
			<h2>판매차량 조회</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="register_action.jsp"
				method="post">
				<table border="1">
					<tr>
						<th>차량번호</th>
						<th>차량명</th>
						<th>매입가</th>
						<th>판매가</th>
						<th>딜러명</th>
					</tr>
					<%
						while(rs.next()) {
					%>
						<tr>
							<td><%=rs.getString("CAR_ID") %></td>
							<td><%=rs.getString("CAR_NAME") %></td>
							<td><%=rs.getString("BUY_PRICE") %></td>
							<td><%=rs.getString("SELL_PRICE") %></td>
							<td><%=rs.getString("DEALER_NAME") %></td>
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