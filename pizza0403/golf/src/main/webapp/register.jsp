<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="golf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection member_conn = DBConnection.getConnection();

String member_sql = "SELECT MEM_NO, MEM_NM FROM tbl_member_202305";
PreparedStatement member_pstmt = member_conn.prepareStatement(member_sql);
ResultSet member_rs = member_pstmt.executeQuery();

Connection class_conn = DBConnection.getConnection();
String class_sql = "SELECT class_nm, class_price, teacher_cd from tbl_teacher_202305";
PreparedStatement class_pstmt = class_conn.prepareStatement(class_sql);
ResultSet class_rs = class_pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 연습장 회원관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp"%>
	<main>
		<section class="title">
			<h2>수강신청</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="register_action.jsp" method="post">
				<table border="1">
					<tr>
						<td>수강월</td>
						<td><input id="class_ym" type="text" maxlength="6" name="class_ym">2022년03월
							예)202203</td>
					</tr>
					<tr>
						<td>회원명</td>
						<td><select id="mem_nm">
								<option value="회원명">회원명</option>
								<%
								while (member_rs.next()) {
								%>
								<option value=<%=member_rs.getString("mem_no")%>><%=member_rs.getString("mem_nm")%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>회원번호</td>
						<td><input type="text" name="mem_no" id="mem_no" readonly></td>
					</tr>
					<tr>
						<td>강의장소</td>
						<td><select name="class_loc" id="class_loc">
								<option value="강의장소">강의장소</option>
								<option value="서울본원">서울본원</option>
								<option value="성남분원">성남분원</option>
								<option value="대전분원">대전분원</option>
								<option value="부산분원">부산분원</option>
								<option value="대구분원">대구분원</option>
						</select></td>
					</tr>
					<tr>
						<td>강의명</td>
						<td><select id="class_nm" name="class_nm">
								<option value="강의명">강의명</option>
								<%
								while (class_rs.next()) {
								%>
								<option value=<%=class_rs.getString("teacher_cd")%>
									id=<%=class_rs.getString("class_nm")%>
									data-price=<%=class_rs.getString("class_price")%>><%=class_rs.getString("class_nm")%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>수강료</td>
						<td><input type="text" id="class_price" name="class_price"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">수강신청</button>
							<button type="button" onclick="return resetHandler()">다시쓰기</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp"%>
</body>
<script>
	document.getElementById("mem_nm").addEventListener("change", (e) => {
		document.getElementById("mem_no").value = e.target.value;
	})
	
	document.getElementById("class_nm").addEventListener("change", (e) => {
		const children = document.getElementById("class_nm");
		let price = 0;
		for(let item of children.children) {
			if(item.value === e.target.value) price = item.dataset.price;
		}
		
		const id = document.getElementById("mem_nm").value;
		if(id[0] === '2') price /= 2;
		
		document.getElementById("class_price").value = price;
	})
	
	function check() {
		if(!document.querySelector("#class_ym").value) {
			alert("수강월을 입력하지 않았습니다.");
			document.querySelector("#class_ym").focus();
			return false;
		}
		if(document.querySelector("#mem_nm").value === '회원명') {
			alert("회원명을 선택하지 않았습니다.");
			document.querySelector("#mem_nm").focus();
			return false;
		}
		if(document.querySelector("#class_loc").value === '강의장소') {
			alert("수강장소를 선택하지 않았습니다.");
			document.querySelector("#class_loc").focus();
			return false;
		}
		if(document.querySelector("#class_nm").value === '강의명') {
			alert("강의명을 입력하지 않았습니다.");
			document.querySelector("#class_nm").focus();
			return false;
		}
		
		alert("수강신청이 완료되었습니다.");
		return true;
	}
	
	function resetHandler() {
		alert("입력정보를 초기화합니다.");
		location.reload();
	}
</script>
<%
DBConnection.close(member_rs, member_pstmt, member_conn);
DBConnection.close(class_rs, class_pstmt, class_conn);
%>
</html>