<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="golf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Connection conn = DBConnection.getConnection();
String sql = "insert into tbl_class_202305 values (?, ?, ?, ?, ?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("class_ym"));
pstmt.setString(2, request.getParameter("mem_no"));
pstmt.setString(3, request.getParameter("class_loc"));
pstmt.setString(4, request.getParameter("class_price"));
pstmt.setString(5, request.getParameter("class_nm"));

if(pstmt.executeUpdate()>= 1) response.sendRedirect("select.jsp");
%>
