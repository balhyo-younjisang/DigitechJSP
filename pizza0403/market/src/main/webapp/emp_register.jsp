<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h1>직원 등록</h1>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="emp_register_action.jsp" method="post">
				<table border="1">
					<tr>
						<td>직원번호</td>
						<td><input type="text" name="empno"></td>
					</tr>
					<tr>
						<td>직원이름</td>
						<td><input type="text" name="empname"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="tel" name="empphone"></td>
					</tr>
					<tr>
						<td>입사일자</td>
						<td><input type="text" name="empdate"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit">등록</button>
							<button type="button" onclick="location.href = 'emp_select.jsp'">조회</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</main>
</body>
<script>
	function check() {
		let isSuccess = true;
		document.querySelectorAll("input").forEach(input => {
			if(!input.value && isSuccess) {
				alert("모든 항목을 입력하세요");
				isSuccess = false;
				input.focus();
			}
		})
		
		if(isSuccess) alert("직원 등록이 완료되었습니다.");
		return isSuccess;
	}
</script>
</html>