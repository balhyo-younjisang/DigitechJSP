<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="vaccine.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = DBConnection.getConnection();
	String sql = "insert into tbl_vaccresv_202108 values (?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("resvno"));
	pstmt.setString(2, request.getParameter("jumin"));
	pstmt.setString(3, request.getParameter("vcode"));
	pstmt.setString(4, request.getParameter("hospcode"));
	pstmt.setString(5, request.getParameter("resvdate"));
	pstmt.setString(6, request.getParameter("resvtime"));
	
	if(pstmt.executeUpdate() >= 1) response.sendRedirect("index.jsp");
	DBConnection.close(pstmt, conn);
%>