<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vaccine.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select h.hospcode,  hospname, count(h.hospcode) cnt" + " from"
		+ " tbl_hosp_202108 h, tbl_vaccresv_202108 v" + " where h.hospcode = v.hospcode"
		+ " group by ROLLUP((h.hospcode,  hospname))" + " order by h.hospcode";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신접종예약 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>병원별 접종 건수 통계</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>병원코드</th>
						<th>병원명</th>
						<th>접종건수</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("HOSPCODE") == null ? "" : rs.getString("HOSPCODE")%></td>
						<td><%=rs.getString("HOSPNAME") == null ? "총누계" : rs.getString("HOSPNAME")%></td>
						<td><%=rs.getString("CNT")%></td>
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