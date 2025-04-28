<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vaccine.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select pname, j.jumin, case when SUBSTR(j.jumin, 8, 1) in (1, 3) then '남' else '여' end gender,"
		+ " tel, TO_CHAR(TO_DATE(resvdate), 'yyyy\"년\"mm\"월\"dd\"일\"') resvdate, resvtime, hospname, hosptel, hospaddr,"
		+ " case when vcode = 'V001' then 'A백신' when vcode = 'V002' then 'B백신' when vcode = 'V003' then 'C백신' end vname"
		+ " from tbl_jumin_201808 j, tbl_hosp_202108 h, tbl_vaccresv_202108 v"
		+ " where j.jumin = v.jumin and h.hospcode = v.hospcode and resvno = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("resvno"));
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
			<h2>백신접종예약</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="POST"
				action="insert_action.jsp">
				<table border="1">
					<%
					if (!rs.next()) {
					%>
					<h2>접종예약정보가 존재하지 않습니다!</h2>
					<%
					} else {
					%>
					<tr>
						<th>이름</th>
						<th>주민번호</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>예약일자</th>
						<th>예약시간</th>
						<th>병원명</th>
						<th>대표전화</th>
						<th>병원주소</th>
						<th>백신종류</th>
					</tr>
					<tr>
						<td><%=rs.getString("PNAME")%></td>
						<td><%=rs.getString("JUMIN")%></td>
						<td><%=rs.getString("GENDER")%></td>
						<td><%=rs.getString("TEL")%></td>
						<td><%=rs.getString("RESVDATE")%></td>
						<td><%=rs.getString("RESVTIME")%></td>
						<td><%=rs.getString("HOSPNAME")%></td>
						<td><%=rs.getString("HOSPTEL")%></td>
						<td><%=rs.getString("HOSPADDR")%></td>
						<td><%=rs.getString("VNAME")%></td>
					</tr>
					<%
					}
					%>
				</table>
				<button onclick="location.href = 'view.jsp'"></button>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<%
DBConnection.close(rs, pstmt, conn);
%>
</html>