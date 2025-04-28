<%@page import="java.sql.PreparedStatement"%>
<%@page import="vote.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBConnection.getConnection();
	String sql = "insert into TBL_VOTE_202005 values (?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("V_JUMIN"));
	pstmt.setString(2, request.getParameter("V_NAME"));
	pstmt.setString(3, request.getParameter("M_NO"));
	pstmt.setString(4, request.getParameter("V_TIME"));
	pstmt.setString(5, request.getParameter("V_AREA"));
	pstmt.setString(6, request.getParameter("V_CONFIRM"));

	if(pstmt.executeUpdate() >= 1) response.sendRedirect("index.jsp");
%>	
