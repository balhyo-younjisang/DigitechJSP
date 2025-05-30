<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp" %>
	<main>
		<section class="title">
			<h2>학생 등록</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="register_action.jsp" method="post">
				<div>
					<label>학번</label>
					<input type="text" name="id" id="id">
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="name" id="name">
				</div>
				<div>
					<label>성별</label>
					<select name="gender" id="gender">
						<option value="1">남자</option>
						<option value="2">여자</option>
					</select>
				</div>
				<button type="submit">등록</button>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp" %>
</body>
<script>
	function check() {
		const id = document.getElementById("id");
		const name = document.getElementById("name");
		
		if(!id.value) {
			alert("학번을 입력해주세요.");
			id.focus();
			return false;
		}
		if(!name.value) {
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
		}
		
		return true;
	}
</script>
</html>