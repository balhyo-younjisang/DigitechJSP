<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pizza0403.DBConnectoin"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String saleno = request.getParameter("saleno");
	String scode = request.getParameter("scode");
	String saledate = request.getParameter("saledate");
	String pcode = request.getParameter("pcode");
	String count = request.getParameter("count");
	
	Connection conn = DBConnectoin.getConnection();
	String sql = "INSERT INTO TBL_SALELIST_01 VALUES (?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, saleno);
	pstmt.setString(2, scode);
	pstmt.setString(3, saledate);
	pstmt.setString(4, pcode);
	pstmt.setString(5, count);
	
	if(pstmt.executeUpdate() >= 1) {
		response.sendRedirect("sales.jsp");
	}
%>