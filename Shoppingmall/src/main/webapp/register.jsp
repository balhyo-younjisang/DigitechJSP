<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Customer customer = (Customer) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
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
					<td>회원번호(자동발생)</td>
					<td><input type="text" data-name="회원번호" readonly="readonly"
						name="custno" value=<%=customer.getCustno()%>></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" data-name="회원성명" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" data-name="회원전화" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" data-name="회원주소" name="address"></td>
				</tr>
				<tr>

					<td>가입일자</td>
					<td><input type="text" data-name="가입일자" name="joindate"></td>
				</tr>
				<tr>

					<td>고객등급(A:VIP, B:일반, C:직원)</td>
					<td><input type="text" data-name="고객등급" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" data-name="도시코드"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">등록</button>
						<button type="button" onClick="window.location='GetCustomerListCtrl'">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</main>
</body>
<script>
	function checkForm() {
		let isFailed = false;
		const inputs = document.querySelectorAll("input");
		inputs.forEach(input => {
			if(input.value === "") {
				const name = input.dataset.name;
				alert(name.concat("이(가) 비어있습니다."));
				input.focus();
				isFailed = true;
			}
		})
		
		if(isFailed) return false;
		alert("회원 등록이 완료되었습니다.");
		return true;
	}
</script>
</html>