<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jsp0404.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "SELECT T_CODE, T_NAME FROM TBL_LAB_TEST_202004";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진단검사 프로그램 ver 2020-04</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>검사결과입력</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" method="post" action="input_action.jsp">
				<table border="1">
					<tr>
						<td>환자번호</td>
						<td><input name="P_NO" data-alert="환자번호가 입력되지 않았습니다">예)1001</td>
					</tr>
					<tr>
						<td>검사코드</td>
						<td><select name="T_CODE">
								<option>검사명</option>
								<%
								while (rs.next()) {
								%>
								<option value=<%=rs.getString("T_CODE")%>><%=rs.getString("T_NAME")%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>검사시작일자</td>
						<td><input name="T_SDATE" data-alert="검사시작일자가 입력되지 않았습니다">예)20200101</td>
					</tr>
					<tr>
						<td>검사상태</td>
						<td><input name="T_STATUS" value="1" type="radio" checked data-alert="검사상태가 선택되지 않았습니다">검사중
							<input name="T_STATUS" value="2" type="radio" data-alert="검사상태가 선택되지 않았습니다">검사완료</td>
					</tr>
					<tr>
						<td>검사완료일자</td>
						<td><input name="T_LDATE" data-alert="검사완료일자가 입력되지 않았습니다">예)20200101</td>
					</tr>
					<tr>
						<td>검사결과</td>
						<td><input name="T_RESULT" data-alert="검사결과가 선택되지 않았습니다" value="X" type="radio" checked>미입력
							<input name="T_RESULT" data-alert="검사결과가 선택되지 않았습니다" value="P" type="radio">양성 <input
							name="T_RESULT" data-alert="검사결과가 선택되지 않았습니다" value="N" type="radio">음성</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">검사결과등록</button>
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
		let flag = false;
		
		document.querySelectorAll("input").forEach(input => {
			if(!input.value && !flag) {
				flag = true;
				alert(input.dataset.alert);
				input.focus();
				return
			} 
		})
		
		if(document.querySelector("select").value === "검사명" && !flag) {
			alert("검사코드가 선택되지 않았습니다")
			return false;
		}
		
		if(flag) return false;
		
		alert("검사결과가 정상적으로 등록되었습니다!");
		return true;
	}
	
	function resetHandler() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		location.reload();
	}
</script>
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>
