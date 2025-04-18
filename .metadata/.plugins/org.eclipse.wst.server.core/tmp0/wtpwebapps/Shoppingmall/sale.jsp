<%@page import="java.util.List"%>
<%@page import="vo.CustomerMoney"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<CustomerMoney> vo = (List<CustomerMoney>) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/register.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<h2 class="title">회원매출조회</h2>

		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
			for (CustomerMoney customerMoney : vo) {
			%>
			<tr>
				<td><%=customerMoney.getCustno() %></td>
				<td><%=customerMoney.getCustname() %></td>
				<td><%=customerMoney.getGrade() %></td>
				<td><%=customerMoney.getSales() %></td>
			</tr>
			<%
			}
			%>
		</table>
	</main>
</body>
</html>