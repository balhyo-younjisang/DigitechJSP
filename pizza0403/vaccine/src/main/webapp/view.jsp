<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신접종예약 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>접종예약조회</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="POST"
				action="view_resvno.jsp">
				<table border="1">
					<tr>
						<td>예약번호를 입력하시오.</td>
						<td><input type="number" name="resvno" id="resvno"></td>
					</tr>

					<tr>
						<td colspan="2"><button type="submit">예약조회</button>
							<button type="button" onclick="location.href = 'index.jsp'">홈으로</button></td>
					</tr>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<script>
	const resvno = document.getElementById("resvno");
	function check() {
		if (!resvno.value) {
			alert("예약번호가 입력되지 않았습니다");
			resvno.focus();
			return false;
		}

		return true;
	}
</script>
</html>