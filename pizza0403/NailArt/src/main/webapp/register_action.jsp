<%@page import="java.sql.PreparedStatement"%>
<%@page import="nailart.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBConnection.getConnection();
	String sql = "INSERT INTO tbl_performance values (?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("p_number"));
	pstmt.setString(2, request.getParameter("customerid"));
	pstmt.setString(3, request.getParameter("grade"));
	pstmt.setString(4, request.getParameter("menucode1"));
	pstmt.setString(5, request.getParameter("menucode2"));
	pstmt.setString(6, request.getParameter("menucode3"));
	pstmt.setString(7, request.getParameter("visitdate"));
	
	if(pstmt.executeUpdate() >= 1) response.sendRedirect("price.jsp");
%>