<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="car.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBConnection.getConnection();
	String sql = "SELECT nvl(max(car_id), 0) + 1 car_id from TBL_CAR_202504";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	String CAR_ID = rs.getString("CAR_ID");
	sql = "insert into TBL_CAR_202504 values (?, ?, ?, ?, 'N')";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, CAR_ID);
	pstmt.setString(2, request.getParameter("CAR_NAME"));
	pstmt.setString(3, request.getParameter("BUY_PRICE"));
	pstmt.setString(4, request.getParameter("DEALER_ID"));
	
	if(pstmt.executeUpdate() >= 1) response.sendRedirect("car.jsp");
%>