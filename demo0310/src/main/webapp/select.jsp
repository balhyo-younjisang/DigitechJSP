<%@page import="demo0317.staticSample"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="demo0317.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	String password = null;
	String name = null;
	String birth = null;

	Connection conn = DBConnection.getConnection();
	String sql = "SELECT id, pass, name, birth from tmp_tb";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	out.println("outprint 사용하여 출력<br>");
	out.println("<table border=1>");
	while(rs.next()) {
		out.println("<tr><td>");
		out.println(rs.getString("id"));
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getString("name"));
		out.println("</td>");
		out.println("</tr>");
	}
	out.println("</table>");

	rs.close();
	pstmt.close();
	conn.close();
	
/* 	staticSample s1 = new staticSample();
	staticSample s2 = new staticSample();
	
	System.out.println("s1.a : "+s1.a_ability);
	System.out.println("s1.b : "+s1.b_ability);
	
	s1.a_ability = s1.a_ability+1;
	s1.b_ability = s1.b_ability+1;

	System.out.println("s2.a : "+s2.a_ability);
	System.out.println("s2.b : "+s2.b_ability); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>