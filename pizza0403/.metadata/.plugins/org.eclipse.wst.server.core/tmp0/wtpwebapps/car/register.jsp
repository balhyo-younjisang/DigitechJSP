<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="car.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "SELECT * FROM TBL_DEALER_202504 order by DEALER_ID";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>차량 등록</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="register_action.jsp"
				method="post">
				<table border="1">
					<tr>
						<td>차량명</td>
						<td><input type="text" name="CAR_NAME" id="CAR_NAME"></td>
					</tr>
					<tr>
						<td>매입가</td>
						<td><input type="number" name="BUY_PRICE" id="BUY_PRICE"></td>
					</tr>
					<tr>
						<td>딜러 선택</td>
						<td><select name="DEALER_ID" id="DEALER_ID">
								<option value="">선택</option>
								<%
								while (rs.next()) {
								%>
								<option value=<%=rs.getString("DEALER_ID")%>><%=rs.getString("DEALER_NAME")%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">등록</button>
							<button type="button" onclick="return handleReset()">다시쓰기</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<script>
	function check() {
		const car_name = document.getElementById("CAR_NAME");
		const buy_price = document.getElementById("BUY_PRICE");
		const DEALER_ID = document.getElementById("DEALER_ID");

		if (!car_name.value) {
			alert("차량명을 입력해주세요");
			car_name.focus();
			return false;
		}
		if (!buy_price.value) {
			alert("매입가를 입력해주세요");
			buy_price.focus();
			return false;
		}
		if (DEALER_ID.value === "") {
			alert("딜러를 선택해주세요");
			return false;
		}

		alert("등록되었습니다.");
		return true;
	}

	function handleReset() {

		const car_name = document.getElementById("CAR_NAME");
		const buy_price = document.getElementById("BUY_PRICE");
		const DEALER_ID = document.getElementById("DEALER_ID");

		car_name.value = "";
		buy_price.value = "";
		DEALER_ID.value = "";
		
		car_name.focus();
	}
</script>
<%
DBConnection.close(rs, pstmt, conn);
%>
</html>