<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="golf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = DBConnection.getConnection();
	String sql = "SELECT m.MEM_NO, MEM_NM, to_char(to_date(class_ym, 'yyyymm'), 'yyyy\"년\"mm\"월\"') class_ym, class_nm, class_loc," 
			+ " trim(to_char(case when substr(m.mem_no, 1, 1) = '2' then ( t.class_price / 2) else t.class_price end, 'L999,999,999')) class_price,"
	+ " case when substr(m.mem_no, 1, 1) = '2' then 'VIP' else '일반' end grade"
	+ " FROM TBL_MEMBER_202305 m, tbl_class_202305 c, tbl_teacher_202305 t"
	+ " where m.mem_no = c.mem_no and c.teacher_cd = t.teacher_cd order by class_ym desc, mem_no asc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 연습장 회원관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>회원정보조회</h2>
		</section>
		<section class="content">
			<form>
				<table border="1">
					<tr>
						<th>수강월</th>
						<th>회원번호</th>
						<th>회원명</th>
						<th>강의명</th>
						<th>강의장소</th>
						<th>수강료</th>
						<th>등급</th>
					</tr>
					<% while(rs.next()) { %>
					<tr>
						<td><%=rs.getString("class_ym") %></td>
						<td><%=rs.getString("mem_no") %></td>
						<td><%=rs.getString("mem_nm") %></td>
						<td><%=rs.getString("class_nm") %></td>
						<td><%=rs.getString("class_loc") %></td>
						<td><%=rs.getString("class_price") %></td>
						<td><%=rs.getString("grade") %></td>
					</tr>
					<% } %>
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