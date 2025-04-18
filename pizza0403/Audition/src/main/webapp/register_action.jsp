<%@page import="java.sql.PreparedStatement"%>
<%@page import="audition.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

Connection conn = DBConnection.getConnection();
String sql = "INSERT INTO TBL_ARTIST_201905 VALUES (?, ?, ?, ?, ?, ?)";
PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, request.getParameter("ARTIST_ID"));
pstmt.setString(2, request.getParameter("ARTIST_NAME"));
pstmt.setString(3, request.getParameter("ARTIST_BIRTH_YEAR") + request.getParameter("ARTIST_BIRTH_MONTH") + request.getParameter("ARTIST_BIRTH_DAY"));
pstmt.setString(4, request.getParameter("ARTIST_GENDER"));
pstmt.setString(5, request.getParameter("TALENT"));
pstmt.setString(6, request.getParameter("AGENCY"));

if(pstmt.executeUpdate() >= 1) {
	response.sendRedirect("list.jsp");
}

DBConnection.close(pstmt, conn);
%>