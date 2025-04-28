<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = DBConnection.getConnection();
String sql = "insert into emp_tbl values (?, ?, ?, ?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("empno"));
pstmt.setString(2, request.getParameter("empname"));
pstmt.setString(3, request.getParameter("empphone").replaceAll("-", ""));
pstmt.setString(4,request.getParameter("empdate"));

if (pstmt.executeUpdate() >= 1) {
	DBConnection.close(pstmt, conn);
	response.sendRedirect("emp_register.jsp");
}
%>