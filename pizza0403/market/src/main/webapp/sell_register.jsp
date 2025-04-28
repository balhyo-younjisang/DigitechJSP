<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection empConn = DBConnection.getConnection();
String empSql = "SELECT empno, empname FROM EMP_TBL ORDER BY EMPNO";
PreparedStatement empPstmt = empConn.prepareStatement(empSql);
ResultSet empRs = empPstmt.executeQuery();

Connection productConn = DBConnection.getConnection();
String productSql = "SELECT productno, CASE WHEN PRODUCTTYPE = '1' THEN '신발' WHEN PRODUCTTYPE = '2' THEN '기능성 의류' ELSE '일반 의류' END || '-' || productname productname FROM product_tbl ORDER BY productno";
PreparedStatement productPstmt = empConn.prepareStatement(productSql);
ResultSet productRs = productPstmt.executeQuery();
%>
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
			<h1>판매 등록</h1>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="sell_register_action.jsp"
				method="post">
				<table border="1">
					<tr>
						<td>직원</td>
						<td><select name="empno">
								<%
								while (empRs.next()) {
								%>
								<option value=<%=empRs.getString("empno")%>><%=empRs.getString("empname")%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>상품</td>
						<td><select name="productno">
								<%
								while (productRs.next()) {
								%>
								<option value=<%=productRs.getString("productno")%>><%=productRs.getString("productname")%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>판매일자</td>
						<td><input type="text" name="selldate"></td>
					</tr>
					<tr>
						<td>판매시각</td>
						<td><input type="text" name="selltime"></td>
					</tr>
					<tr>
						<td>판매수량</td>
						<td><input type="text" name="sellcount"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit">등록</button>
							<button type="button"
								onclick="location.href = 'sell_select.jsp'">조회</button>
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
		
		if(isSuccess) alert("판매 정보 등록이 완료되었습니다.");
		return isSuccess;
	}
</script>
</html>
<%
DBConnection.close(empRs, empPstmt, empConn);
DBConnection.close(productRs, productPstmt, productConn);
%>