<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="nailart.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "select to_char(to_date(visitdate), 'yyyy/mm/dd') visitdate, count(p.menucode1) cnt, TRIM(TO_CHAR(sum(case when p.grade = 'V' then m1.price * 0.9 when p.grade = 'S' then m1.price * 0.8 else m1.price end), 'L999,999,999')) total"
			+ " from TBL_PERFORMANCE p,"
			+ " tbl_menu m1"
			+ " where p.menucode1 = m1.menucode and p.menucode1 != 'N00'"
			+ " group by to_char(to_date(visitdate), 'yyyy/mm/dd')"
			+ " order by to_char(to_date(visitdate), 'yyyy/mm/dd')";
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
			<h2 style="text-align: center">방문일자별 네일아트(네일) 통계</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>방문일자</th>
						<th>총건수</th>
						<th>총가격</th>
					</tr>
					<%
						while(rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("visitdate") %></td>
						<td><%=rs.getString("cnt") %></td>
						<td><%=rs.getString("total") %></td>
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