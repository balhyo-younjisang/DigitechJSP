<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="nailart.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select p_number, c.customerid, name, address, case when grade = 'V' then '우수고객' when grade = 'S' then '학생고객' when grade = 'G' then '일반고객' end grade,"
		+ " m1.menuname n, m2.menuname p, m3.menuname e, to_char(to_date(visitdate), 'yyyy/mm/dd') visitdate" + " from"
		+ " TBL_CUSTOMER c," + " tbl_performance p," + " tbl_menu m1," + " tbl_menu m2," + " tbl_menu m3" + " where"
		+ " c.customerid = p.customerid" + " and m1.menucode = p.menucode1" + " and m2.menucode = p.menucode2"
		+ " and m3.menucode = p.menucode3" + " order by p_number, visitdate";
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
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2 style="text-align: center">네일실적조회</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>번호</th>
						<th>고객아이디</th>
						<th>성명</th>
						<th>주소</th>
						<th>고객등급</th>
						<th>네일</th>
						<th>페디</th>
						<th>기타</th>
						<th>방문일자</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("p_number")%></td>
						<td><%=rs.getString("customerid")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("address")%></td>
						<td><%=rs.getString("grade")%></td>
						<td><%=rs.getString("n")%></td>
						<td><%=rs.getString("p")%></td>
						<td><%=rs.getString("e")%></td>
						<td><%=rs.getString("visitdate")%></td>
					</tr>
					<%
					}
					%>
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