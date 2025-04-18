<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* Connection conn = DBConnection.getConnection();
	String no = request.getParameter("studentno");
	String name = request.getParameter("studentname");
	
	String sql = "INSERT INTO student_tmp_tb VALUES (?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, no);
	pstmt.setString(2,name);
	
	int result = pstmt.executeUpdate();
	DBConnection.close(pstmt, conn); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(result == 1) { %>
<script>alert("학생 등록이 완료되었습니다.")</script>
<script>location.href = "list.jsp"</script>
<% 
}
%>
</body>
</html>