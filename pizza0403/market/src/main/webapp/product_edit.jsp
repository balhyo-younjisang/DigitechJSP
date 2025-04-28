<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="market.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBConnection.getConnection();
	String sql = "SELECT * FROM PRODUCT_TBL WHERE PRODUCTNO = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("productno"));
	ResultSet rs = pstmt.executeQuery();
	rs.next();
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
			<h1>상품 수정</h1>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="product_edit_action.jsp" method="post">
				<table border="1">
					<tr>
						<td>상품번호</td>
						<td><input type="text" name="productno" value=<%=rs.getString("productno") %> readonly></td>
					</tr>
					<tr>
						<td>상품이름</td>
						<td><input type="text" name="productname" value=<%=rs.getString("productname") %>></td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><input type="text" name="productprice" value=<%=rs.getString("productprice") %>></td>
					</tr>
					<tr>
						<td>상품분류</td>
						<td>
							<select name="producttype">
								<option value="1" <% if(rs.getString("producttype").equals("1")){ %> selected <% } %>>신발</option>
								<option value="2" <% if(rs.getString("producttype").equals("2")){ %> selected <% } %>>기능성 의류</option>
								<option value="3" <% if(rs.getString("producttype").equals("3")){ %> selected <% } %>>일반 의류</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품재고수량</td>
						<td><input type="text" name="productstock" value=<%=rs.getString("productstock") %>></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit">수정</button>
							<button type="button" onclick="location.href = 'product_select.jsp'">조회</button>
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
		
		if(isSuccess) alert("상품 정보가 수정되었습니다.");
		return isSuccess;
	}
</script>
</html>
<%
	 DBConnection.close(rs, pstmt, conn);
%>