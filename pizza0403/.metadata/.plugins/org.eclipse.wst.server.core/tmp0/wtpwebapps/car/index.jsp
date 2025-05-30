<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp" %>
	<main>
		<section class="title">
			<h2>중고차 관리 프로그램</h2>
		</section>
		<section class="content">
			<p>안녕하세요! <b>중고차 판매 및 딜러 관리 시스템</b> 에 오신 것을 환영합니다.</p>
			<br>
			<p>이 시스템은 차량 등록, 판매 내역 조회, 딜러별 매출 및 실적을 확인할 수 있도록 구성되어 있습니다.</p>
			<p>상단의 메뉴를 통해 각 기능을 확인해보세요!</p>
		</section>
	</main>
	<%@ include file="./component/footer.jsp" %>
</body>
</html>