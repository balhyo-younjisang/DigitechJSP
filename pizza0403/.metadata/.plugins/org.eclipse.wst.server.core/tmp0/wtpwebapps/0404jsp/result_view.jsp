<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jsp0404.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select p.P_NO, p.P_NAME, t.T_NAME, TO_CHAR(r.T_SDATE, 'YYYY-MM-DD') T_SDATE,"
+ " case when r.T_STATUS = '1' THEN '검사중' when  r.T_STATUS = '2' then '검사완료' END T_STATUS,"
+ " TO_CHAR(r.T_LDATE, 'YYYY-MM-DD') T_LDATE,"
+ " CASE WHEN r.T_RESULT = 'X' THEN '미입력' WHEN r.T_RESULT = 'P' THEN '양성' WHEN r.T_RESULT = 'N' THEN '음성' END T_RESULT"
+ " from TBL_RESULT_202004 r,  TBL_PATIENT_202004 p, TBL_LAB_TEST_202004 t"
+ " WHERE r.P_NO = p.P_NO and t.T_CODE = r.T_CODE order by p.P_NO";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진단검사 프로그램 ver 2020-04</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>검사결과조회</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>환자번호</th>
						<th>환자명</th>
						<th>검사명</th>
						<th>검사시작일</th>
						<th>검사상태</th>
						<th>검사완료일</th>
						<th>검사결과</th>
					</tr>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("P_NO")%>
						<td><%=rs.getString("P_NAME")%>
						<td><%=rs.getString("T_NAME")%>
						<td><%=rs.getString("T_SDATE")%>
						<td><%=rs.getString("T_STATUS")%>
						<td><%=rs.getString("T_LDATE")%>
						<td><%=rs.getString("T_RESULT")%>
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
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>
