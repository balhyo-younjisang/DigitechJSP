<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="demo0327.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = DBConnection.getConnection();
String sql = "select TO_CHAR(MAX(no) + 1, '00000') as no, sysdate as today from TBL_EMP_202304";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

String no = "", today = "";
if (rs.next()) {
	no = rs.getString("no");
	today = rs.getString("today");
}

sql = "select * from TBL_DEPT_202304";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시멘틱 웹 페이지 | 다양한 Input 연습</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<h2> 등록2 </h2>
		<form onsubmit="return handleSubmit()" action="index_action.jsp" method="post">
			<table border="1">
				<tr>
					<td>사번</td>
					<td>
						<input readonly="readonly" value=<%=no %> name="no"> 자동채번
					</td>
				</tr>
				
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" maxlength="50" name="id"> 예) s1234
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" maxlength="50" name="pass"> 예) ****
					</td>
				</tr>
				<tr>
					<td>사원명</td>
					<td>
						<input type="text" maxlength="50" name="name"> 예) 홍길동
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" value=<%=today %> name="birth">
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" checked="checked" value=0> <span>남</span>
						<input type="radio" name="gender" value=1> <span>여</span>
					</td>
				</tr>
				
				<tr>
					<td>소속</td>
					<td>
						<select name="dept">
							<%
								while(rs.next()) {
							%>
								<option value=<%=rs.getString("d_code") %>><%=rs.getString("d_name") %></option>
							<% } %>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>장애여부</td>
					<td>
						<input type="checkbox" name="d_fg" checked="checked"> 해당없음 체크
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">등록</button>
						<button type="button" onclick="reset())">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<script>
	function handleSubmit() {
		const no = document.getElementsByName("no")[0].value;
		const id = document.getElementsByName("id")[0].value;
		const pass = document.getElementsByName("pass")[0].value;
		const name = document.getElementsByName("name")[0].value;
		const birth = document.getElementsByName("birth")[0].value;
		const gender = document.getElementsByName("gender")[0].value;
		const dept = document.getElementsByName("dept")[0].value;
		
		
		if(!no) {
			alert("사번은 입력되어야 합니다.");
			return false;
		} else if (!id) {
			alert("아이디를 입력해주세요.");
			return false;
		}else if (!pass) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if (!name) {
			alert("이름을 입력해주세요.");
			return false;
		}else if (!birth) {
			alert("생년월일을 입력해주세요.");
			return false;
		}else if (!gender) {
			alert("성별을 입력해주세요.");
			return false;
		}else if (!dept) {
			alert("소속을 입력해주세요.");
			return false;
		}
		
		return true;
	}
</script>
</html>