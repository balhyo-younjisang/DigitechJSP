<%@page import="vo.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Customer> vo = (List<Customer>) request.getAttribute("vo");
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
		<h2 class="title">홈쇼핑 회원등록</h2>
		<form onsubmit="return checkForm()" action="RegisterCustomerCtrl"
			method="POST">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>회원전화</th>
					<th>회원주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>도시코드</th>
				</tr>
				<%
					for(Customer customer : vo) {
				%>
					<tr>
						<td><a href="EditCustomerCtrl?custNo=<%=customer.getCustno()%>"><%=customer.getCustno() %></a></td>
						<td><%=customer.getCustname() %></td>
						<td><%=customer.getPhone() %></td>
						<td><%=customer.getAddress() %></td>
						<td><%=customer.getJoindate() %></td>
						<td><%=customer.getGrade() %></td>
						<td><%=customer.getCity() %></td>
					</tr>
				<% } %>
			</table>
		</form>
	</main>
</body>
</html>