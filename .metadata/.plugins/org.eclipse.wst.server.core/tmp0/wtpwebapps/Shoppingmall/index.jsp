<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원관리 ver 1.0</title>
<link rel="stylesheet" href="./assets/css/index.css">
</head>
<body>
	<%@ include file="./component/header.jsp" %>
	<main>
		<h2 class="title">쇼핑몰회원관리프로그램</h2>
		<p class="subtitle">쇼핑몰 회원매출정보 데이터베이스를 구축하고 회원관리프로그램을 작성하는 프로그램이다.<br>프로그램 작성 순서</p>
		<ul>
			<li>1.회원정보 테이블을 생성한다.</li>
			<li>2.매출정보 테이블을 생성한다.</li>
			<li>3.회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>4.회원정보 입력 화면 프로그램을 작성한다.</li>
			<li>5.회원정보 조회 화면 프로그램을 작성한다.</li>
			<li>6.회원매출정보 조회 화면 프로그램을 작성한다.</li>
		</ul>
	</main>
	<%@ include file="./component/footer.jsp" %>
</body>
</html>