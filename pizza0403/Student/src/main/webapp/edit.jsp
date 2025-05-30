<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="student.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	Connection conn = DBConnection.getConnection();
	String sql = "select id, name, gender from member_tbl_03 where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 관리 프로그램 ver 1.0</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%@ include file="./component/header.jsp" %>
	<main>
		<section class="title">
			<h2>학생수정</h2>
		</section>
		<section class="content">
			<form onsubmit="return check()" action="edit_action.jsp" method="post">
				<div>
					<label>학번</label>
					<input type="text" name="id" id="id" value=<%=rs.getString("id") %> readonly>
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="name" id="name" value=<%=rs.getString("name") %>>
				</div>
				<div>
					<label>성별</label>
					<select name="gender" id="gender">
						<option value="1" <%if(rs.getString("gender").equals("1")) {%> selected <% } %>>남자</option>
						<option value="2" <%if(rs.getString("gender").equals("2")) {%> selected <% } %>>여자</option>
					</select>
				</div>
				<button type="submit">수정</button>
			</form>
		</section>
	</main>
	<%@ include file="./component/footer.jsp" %>
</body>
<script>
	function check() {
		const id = document.getElementById("id");
		const name = document.getElementById("name");
		
		if(!id.value) {
			alert("학번을 입력해주세요.");
			id.focus();
			return false;
		}
		if(!name.value) {
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
		}
		
		return true;
	}
</script>
<%
	DBConnection.close(rs, pstmt, conn);
%>
</html>