<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="nailart.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection nail_conn = DBConnection.getConnection();
String nail_sql = "select menucode, '[' || menucode || ']' || menuname as menuname from tbl_menu where menucode like 'N%'";
PreparedStatement nail_pstmt = nail_conn.prepareStatement(nail_sql);
ResultSet nail_rs = nail_pstmt.executeQuery();

Connection p_conn = DBConnection.getConnection();
String p_sql = "select menucode, '[' || menucode || ']' || menuname as menuname from tbl_menu where menucode like 'P%'";
PreparedStatement p_pstmt = p_conn.prepareStatement(p_sql);
ResultSet p_rs = p_pstmt.executeQuery();

Connection e_conn = DBConnection.getConnection();
String e_sql = "select menucode, '[' || menucode || ']' || menuname as menuname from tbl_menu where menucode like 'E%'";
PreparedStatement e_pstmt = e_conn.prepareStatement(e_sql);
ResultSet e_rs = e_pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네일아트 관리 프로그램</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2 style="text-align: center">네일실적등록</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="post" action="register_action.jsp">
				<table border="1">
					<tr>
						<td>번호</td>
						<td><input type="number" id="p_number" name="p_number">예)1</td>
					</tr>
					<tr>
						<td>고객아이디</td>
						<td><input type="text" id="customerid" name="customerid">예)C001</td>
					</tr>
					<tr>
						<td>고객등급</td>
						<td><select name="grade">
								<option value="V">[V]우수고객</option>
								<option value="S">[S]학생고객</option>
								<option value="G">[G]일반고객</option>
						</select> 예)[V]우수고객</td>
					</tr>
					<tr>
						<td>네일코드</td>
						<td><select name="menucode1">
								<%
								while (nail_rs.next()) {
								%>
								<option value=<%=nail_rs.getString("menucode")%>><%=nail_rs.getString("menuname")%></option>
								<%
								}
								%>
						</select>예)[N01]풀코트</td>
					</tr>
					<tr>
						<td>페디코드</td>
						<td><select name="menucode2">
								<%
								while (p_rs.next()) {
								%>
								<option value=<%=p_rs.getString("menucode")%>><%=p_rs.getString("menuname")%></option>
								<%
								}
								%>
						</select>예)[P01]풀코트</td>
					</tr>
					<tr>
						<td>기타코드</td>
						<td><select name="menucode3">
								<%
								while (e_rs.next()) {
								%>
								<option value=<%=e_rs.getString("menucode")%>><%=e_rs.getString("menuname")%></option>
								<%
								}
								%>
						</select>예)[E00]해당없음</td>
					</tr>
					<tr>
						<td>방문일자</td>
						<td><input type="text" id="visitdate" name="visitdate" maxlength="6">예)230801</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="submit">등록</button>
							<button type="button" onclick="reset()">다시쓰기</button>
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
		const p_number = document.getElementById("p_number").value;
		const customerid = document.getElementById("customerid").value;
		const visitdate = document.getElementById("visitdate").value;
		
		if(!p_number) {
			alert("번호가 입력되지 않았습니다!");
			return false;
		} 
		if(!customerid) {
			alert("고객아이디가 입력되지 않았습니다!");
			return false;
		}
		if(!visitdate) {
			alert("방문일자가 입력되지 않았습니다!");
			return false;
		}
		
		alert("네일 실적 등록이 완료되었습니다!");
		return true;
	}
</script>
<%
DBConnection.close(nail_rs, nail_pstmt, nail_conn);
DBConnection.close(p_rs, p_pstmt, p_conn);
DBConnection.close(e_rs, e_pstmt, e_conn);
%>
</html>