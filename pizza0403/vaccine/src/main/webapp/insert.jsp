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
			<h2>백신접종예약</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="POST"
				action="insert_action.jsp">
				<table border="1">
					<tr>
						<td>접종예약번호</td>
						<td><input type="number" name="resvno" id="resvno">예)20210001</td>
					</tr>

					<tr>
						<td>주민번호</td>
						<td><input type="text" name="jumin" id="jumin">예)710101-1000001</td>
					</tr>


					<tr>
						<td>백신코드</td>
						<td><input type="text" name="vcode" id="vcode">예)V001
							~ V003</td>
					</tr>

					<tr>
						<td>병원코드</td>
						<td><input type="text" name="hospcode" id="hospcode">예)H001</td>
					</tr>

					<tr>
						<td>예약일자</td>
						<td><input type="number" name="resvdate" id="resvdate">예)20211231</td>
					</tr>

					<tr>
						<td>예약시간</td>
						<td><input type="text" name="resvtime" id="resvtime">예)1230</td>
					</tr>

					<tr>
						<td colspan="2"><button type="submit">등록</button>
							<button type="button" onclick="handleReset()">다시쓰기</button></td>
					</tr>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<script>	
	const resvno = document.getElementById("resvno");
	const jumin = document.getElementById("jumin");
	const vcode = document.getElementById("vcode");
	const hospcode = document.getElementById("hospcode");
	const resvdate = document.getElementById("resvdate");
	const resvtime = document.getElementById("resvtime");

	function check() {
		if(!resvno.value) {
			alert("접종예약번호가 입력되지 않았습니다");
			resvno.focus();
			return false;
		}

		if(!jumin.value) {
			alert("주민번호가 입력되지 않았습니다");
			jumin.focus();
			return false;
		}

		if(!vcode.value) {
			alert("백신코드가 입력되지 않았습니다");
			vcode.focus();
			return false;
		}

		if(!hospcode.value) {
			alert("병원코드가 입력되지 않았습니다");
			hospcode.focus();
			return false;
		}

		if(!resvdate.value) {
			alert("예약일자가 입력되지 않았습니다");
			resvdate.focus();
			return false;
		}

		if(!resvtime.value) {
			alert("예약시간이 입력되지 않았습니다");
			resvtime.focus();
			return false;
		}
		
		alert("접종예약정보가 등록되었습니다!");
		return true;
	}
	
	function handleReset() {
		alert("정보를  지우고 처음부터 다시 입력합니다!");
		document.querySelectorAll("input").forEach(input => {
			input.value = "";
		})
	}
</script>
</html>