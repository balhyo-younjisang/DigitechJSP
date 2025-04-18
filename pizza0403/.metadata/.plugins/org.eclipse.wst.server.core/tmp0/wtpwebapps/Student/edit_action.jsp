<%@page import="java.sql.PreparedStatement"%>
<%@page import="student.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBConnection.getConnection();
	String sql = "update member_tbl_03 set name = ?, gender = ? where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("gender"));
	pstmt.setString(3, request.getParameter("id"));
	
	if(pstmt.executeUpdate() >= 1) response.sendRedirect("index.jsp");
	DBConnection.close(pstmt, conn);
%>