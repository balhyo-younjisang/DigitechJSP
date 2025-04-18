<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생관리 프로그램 ver 1.0</title>
<script>
	function check(e) {
		var id = document.getElementById("no");
		var name = document.getElementById("name");
		
		if(id.value === "") {
			alert("id 정보가 입력되지 않았습니다.");
			id.focus();
			return false;
		}
		if(name.value === "") {
			alert("이름 정보가 입력되지 않았습니다.");
			name.focus();
			return false;
		}
		return true;
	}
</script>
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/index.css">
<link rel="stylesheet" href="./css/register.css">
<link rel="stylesheet" href="./css/footer.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<h2>학생등록</h2>
		<form onsubmit="return check()" method="POST" action="insert_action2">
			<label>학번</label> <input type="text" name="studentno" id="no">
			<label>성명</label> <input type="text" name="studentname" id="name">
			<button>등록</button>
		</form>
	</main>
	<%@ include file="./component/footer.jsp"%>
	<script>
		/* document.querySelector("button").addEventListener("click", function(e) {
			e.preventDefault();
			const studentno = document.querySelector("#no").value;

			if (studentno.replaceAll(' ', '') !== '') {
				document.querySelector("form").submit();
			} else {
				alert("학번이 올바르지 않습니다");
				 document.querySelector("#no").focus();
			}
		}) */
	</script>
</body>
</html>