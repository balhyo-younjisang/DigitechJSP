<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="pizza0403.DBConnectoin"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnectoin.getConnection();
String sql = "select pcode, pname from TBL_PIZZA_01";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자전문점 판매관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>매출전표등록</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="post" action="receipt_action.jsp">
				<table border="1">
					<tr>
						<td>매출전표번호</td>
						<td><input name="saleno" data-name="매출전표번호가"></td>
					</tr>
					<tr>
						<td>지점코드</td>
						<td><input name="scode" data-name="지점코드가"></td>
					</tr>
					<tr>
						<td>판매일자</td>
						<td><input name="saledate" data-name="판매일자가"></td>
					</tr>
					<tr>
						<td>피자코드</td>
						<td><select name="pcode" data-name="피자코드">
								<option>피자선택</option>
								<%
								while (rs.next()) {
								%>
								<option value=<%=rs.getString("pcode")%>>
									<%="[" + rs.getString("pcode") + "]" + rs.getString("pname")%>
								</option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>판매수량</td>
						<td><input name="count" data-name="판매수량이"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">전표등록</button>
							<button type="button" onclick="resetHandler()">다시쓰기</button>
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
		let brake = false;
		
		document.querySelectorAll("input").forEach(input => {
			if(!input.value && !brake) {
				alert(input.dataset.name + ' 입력되지 않았습니다');
				brake = true;
			}
		})
		
		if(document.querySelector("select").value === "피자선택" && !brake) {
			alert("피자코드가 입력되지 않았습니다");
			brake = true;
		}
		
		if(!brake) alert("매출전표가 정상적으로 등록되었습니다!")
		return !brake;
	}
	
	function resetHandler() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		location.reload()
	}
</script>
<%
DBConnectoin.close(rs, pstmt, conn);
%>
</html>