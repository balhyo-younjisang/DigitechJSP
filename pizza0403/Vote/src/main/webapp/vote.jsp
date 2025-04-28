<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vote.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select M_NO, V_NAME from TBL_MEMBER_202005";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./style/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h3>투표하기</h3>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="vote_action.jsp"
				method="POST">
				<table border="1">
					<tr>
						<td>주민번호</td>
						<td><input type="text" maxlength="13" name="V_JUMIN">예)0302083000001</td>
					</tr>
					<tr>
						<td>투표자명</td>
						<td><input type="text" name="V_NAME"></td>
					</tr>
					<tr>
						<td>후보자명</td>
						<td><select name="M_NO">
								<option selected value="">후보자선택</option>
								<%
								while (rs.next()) {
								%>
									<option value=<%=rs.getString("M_NO") %>><%=rs.getString("V_NAME") %></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>투표시간</td>
						<td><input type="text" name="V_TIME"></td>
					</tr>
					<tr>
						<td>투표장소</td>
						<td><input type="text" name="V_AREA"></td>
					</tr>
					<tr>
						<td>후보자확인</td>
						<td><input type="radio" name="V_CONFIRM" value="Y">확인
							<input type="radio" name="V_CONFIRM" value="N">미확인</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">투표하기</button>
							<button type="button" onclick="return handleReset()">다시입력</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
	<script>
		const V_JUMIN = document.getElementsByName("V_JUMIN");
		const V_NAME = document.getElementsByName("V_NAME");
		const M_NO = document.getElementsByName("M_NO");
		const V_TIME = document.getElementsByName("V_TIME");
		const V_AREA = document.getElementsByName("V_AREA");
		const V_CONFIRM = document.getElementsByName("V_CONFIRM");
	
		function check() {
			if(!V_JUMIN[0].value) {
				alert("주민번호가 입력되지 않았습니다!");
				V_JUMIN[0].focus();
				return false;
			}
			if(!V_NAME[0].value) {
				alert("성명이 입력되지 않았습니다!");
				V_NAME[0].focus();
				return false;
			}
			if(M_NO[0].value === "") {
				alert("후보번호가 선택되지 않았습니다!");
				return false;
			}
			if(!V_TIME[0].value) {
				alert("투표시간이 입력되지 않았습니다!");
				V_TIME[0].focus();
				return false;
			}
			if(!V_AREA[0].value) {
				alert("투표장소가 입력되지 않았습니다!");
				V_AREA[0].focus();
				return false;
			}
			if(!V_CONFIRM[0].checked && !V_CONFIRM[1].checked) {
				alert("유권자확인이 선택되지 않았습니다!");
				return false;
			}
			
			alert("투표하기 정보가 정상적으로 등록되었습니다!");
			return	true;
		}

		function handleReset() {
			V_JUMIN[0].value = "";
			V_NAME[0].value = "";
			M_NO[0].value = "";
			V_TIME[0].value = "";
			V_AREA[0].value = "";
			V_CONFIRM[0].checked = false;
			V_CONFIRM[1].checked = false;
			V_JUMIN[0].focus();
		}
	</script>
</body>
</html>
<%
DBConnection.close(rs, pstmt, conn);
%>