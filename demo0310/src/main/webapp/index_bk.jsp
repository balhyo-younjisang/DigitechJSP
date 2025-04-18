<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="demo0310.DBConnectionExample" %> 
<%@ page import="java.sql.*" %>
<%
	String date = DBConnectionExample.getConnection();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><%= date %></h3>
</body>
</html>