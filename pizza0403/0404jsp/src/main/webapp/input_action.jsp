<%@page import="java.sql.PreparedStatement"%>
<%@page import="jsp0404.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBConnection.getConnection();
	String sql = "insert into TBL_RESULT_202004 values (?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("P_NO"));
	pstmt.setString(2, request.getParameter("T_CODE"));
	pstmt.setString(3, request.getParameter("T_SDATE"));
	pstmt.setString(4, request.getParameter("T_STATUS"));
	pstmt.setString(5, request.getParameter("T_LDATE"));
	pstmt.setString(6, request.getParameter("T_RESULT"));
	
	if(pstmt.executeUpdate() >= 1) response.sendRedirect("index.jsp");
%>