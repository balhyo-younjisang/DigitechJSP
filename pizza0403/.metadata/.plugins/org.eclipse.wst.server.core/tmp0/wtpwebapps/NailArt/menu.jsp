<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="nailart.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "select menucode, menuname, case when menutype = 'N' then '네일' when menutype = 'P' then '패디' when menutype = 'E' then '기타' end menutype, TRIM(TO_CHAR(price, 'L999,999,999')) price from tbl_menu";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네일아트 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp" %>
	<main>
		<section class="title">
			<h2 style="text-align: center">네일메뉴조회</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>메뉴코드</th>
						<th>메뉴명</th>
						<th>메뉴타입</th>
						<th>가격</th>
					</tr>
					<%
						while(rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("menucode") %></td>
						<td><%=rs.getString("menuname") %></td>
						<td><%=rs.getString("menutype") %></td>
						<td><%=rs.getString("price") %></td>
					</tr>
					<%
					}
					%>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp" %>
</body>
<%
	DBConnection.close(rs, pstmt, conn);
%>
</html>