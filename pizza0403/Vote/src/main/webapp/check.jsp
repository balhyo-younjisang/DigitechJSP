<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vote.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select v.V_NAME," + " DECODE(SUBSTR(V_JUMIN, 7, 1), '1', '19', '2', '19', '20') || TO_CHAR(TO_DATE(SUBSTR(V_JUMIN, 0, 6)), 'yy\"년\"mm\"월\"dd\"일생\"') V_DATE,"
		+ " '만 ' || case when SUBSTR(V_JUMIN, 7, 1) <= 2 then TO_CHAR(SYSDATE,'YYYY') - CONCAT('19', TO_CHAR(TO_DATE(SUBSTR(V_JUMIN, 0, 6)), 'yy'))"
		+ " else TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(TO_DATE(SUBSTR(V_JUMIN, 0, 6)), 'yyyy')" + " end || '세' V_AGE,"
		+ " case when SUBSTR(V_JUMIN, 7, 1) in (1, 3) then '남'"
		+ " when SUBSTR(V_JUMIN, 7, 1) in (2, 4) then '여' end V_GENDER,"
		+ " SUBSTR(v.V_TIME, 0, 2) || ':' || SUBSTR(v.V_TIME, 3, 2) V_TIME," + " v.V_AREA," + "m.V_NAME MV_NAME,"
		+ " case when v.V_CONFIRM = 'Y' then '확인'" + " when v.V_CONFIRM = 'N' then '미확인' end V_CONFIRM"
		+ " FROM TBL_VOTE_202005 v, TBL_MEMBER_202005 m" + " where v.M_NO = m.M_NO and v.V_AREA = '제1투표장'";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./style/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h3>투표검수조회</h3>
		</section>
		<section class="content">
			<table border="1">
				<tr>
					<th>투표자명</th>
					<th>생년월일</th>
					<th>나이</th>
					<th>성별</th>
					<th>투표한 후보자</th>
					<th>투표 시간</th>
					<th>투표 장소</th>
					<th>유권자 확인</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("V_NAME")%></td>
					<td><%=rs.getString("V_DATE")%></td>
					<td><%=rs.getString("V_AGE")%></td>
					<td><%=rs.getString("V_GENDER")%></td>
					<td><%=rs.getString("MV_NAME")%></td>
					<td><%=rs.getString("V_TIME")%></td>
					<td><%=rs.getString("V_AREA")%></td>
					<td><%=rs.getString("V_CONFIRM")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>