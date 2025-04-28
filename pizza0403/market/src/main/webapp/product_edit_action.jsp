<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = DBConnection.getConnection();
String sql = "update product_tbl set productname = ?, productprice = ?, producttype = ?, productstock = ? where productno = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("productname"));
pstmt.setString(2, request.getParameter("productprice"));
pstmt.setString(3,request.getParameter("producttype"));
pstmt.setString(4,request.getParameter("productstock"));
pstmt.setString(5, request.getParameter("productno"));

if (pstmt.executeUpdate() >= 1) {
	DBConnection.close(pstmt, conn);
	response.sendRedirect("product_select.jsp");
}
%>