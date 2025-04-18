<%@page import="audition.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp" %>
	<main>
		<section class="title">
			<h2>오디션 등록</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="POST" action="register_action.jsp">
				<table border="1">
					<tr>
						<td>참가번호</td>
						<td>
							<input type="text" name="ARTIST_ID" data-alert="참가번호가 입력되지 않았습니다!">*참가번호는 (A000)4자리입니다
						</td>
					</tr>
					<tr>
						<td>참가자명</td>
						<td>
							<input type="text" name="ARTIST_NAME"  data-alert="참가자명이 입력되지 않았습니다!">
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<input type="text" name="ARTIST_BIRTH_YEAR" maxlength="4" data-alert="생년월일이 입력되지 않았습니다!">년
							<input type="text" name="ARTIST_BIRTH_MONTH" maxlength="2" data-alert="생년월일이 입력되지 않았습니다!">월
							<input type="text" name="ARTIST_BIRTH_DAY" maxlength="2" data-alert="생년월일이 입력되지 않았습니다!">일
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="ARTIST_GENDER" value="M" checked data-alert="성별이 입력되지 않았습니다!">남
							<input type="radio" name="ARTIST_GENDER" value="F" data-alert="성별이 입력되지 않았습니다!">여
						</td>
					</tr>
					<tr>
						<td>특기</td>
						<td>
							<select name="TALENT">
								<option value="0">특기 선택</option>
								<option value="1">보컬</option>
								<option value="2">댄스</option>
								<option value="3">랩</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>소속사</td>
						<td>
							<input type="text" name="AGENCY" data-alert="소속사를 입력되지 않았습니다!">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">오디션 등록</button>
							<button type="button" onclick="reset()">다시쓰기</button>
						</td> 
					</tr>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp" %>
</body>
<script>
	function check() {
		let isFailed = false;
		document.querySelectorAll("input").forEach(input => {
			if(!input.value && !isFailed) {
				alert(input.dataset.alert);
				isFailed = true;
			}
		})
		
		if(document.querySelector("select").value === "0" && !isFailed) {
			alert("특기를 선택하지 않았습니다!");
			isFailed = true;
		}
		
		return !isFailed;
	}
</script>
</html>