/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.73
 * Generated at: 2025-04-16 00:10:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import student.DBConnection;
import java.sql.Connection;

public final class edit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/./component/header.jsp", Long.valueOf(1744760430443L));
    _jspx_dependants.put("/./component/footer.jsp", Long.valueOf(1744760607654L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("student.DBConnection");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String id = request.getParameter("id");
	Connection conn = DBConnection.getConnection();
	String sql = "select id, name, gender from member_tbl_03 where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>학생 성적 관리 프로그램 ver 1.0</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"./css/style.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("<header>\r\n");
      out.write("	<div>\r\n");
      out.write("		<h1>학생 성적 관리 프로그램 ver 1.0</h1>\r\n");
      out.write("	</div>\r\n");
      out.write("	<nav>\r\n");
      out.write("		<ul class=\"gnb\">\r\n");
      out.write("			<li><a href=\"register.jsp\">학생 등록</a></li>\r\n");
      out.write("			<li><a href=\"select.jsp\">학생조회/수정</a></li>\r\n");
      out.write("			<li><a href=\"score.jsp\">반별성적조회</a></li>\r\n");
      out.write("			<li><a href=\"good.jsp\">성적우수자조회</a></li>\r\n");
      out.write("			<li><a href=\"index.jsp\">홈으로</a></li>\r\n");
      out.write("		</ul>\r\n");
      out.write("	</nav>\r\n");
      out.write("</header>");
      out.write("\r\n");
      out.write("	<main>\r\n");
      out.write("		<section class=\"title\">\r\n");
      out.write("			<h2>학생수정</h2>\r\n");
      out.write("		</section>\r\n");
      out.write("		<section class=\"content\">\r\n");
      out.write("			<form onsubmit=\"return check()\" action=\"edit_action.jsp\" method=\"post\">\r\n");
      out.write("				<div>\r\n");
      out.write("					<label>학번</label>\r\n");
      out.write("					<input type=\"text\" name=\"id\" id=\"id\" value=");
      out.print(rs.getString("id") );
      out.write(" readonly>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div>\r\n");
      out.write("					<label>이름</label>\r\n");
      out.write("					<input type=\"text\" name=\"name\" id=\"name\" value=");
      out.print(rs.getString("name") );
      out.write(">\r\n");
      out.write("				</div>\r\n");
      out.write("				<div>\r\n");
      out.write("					<label>성별</label>\r\n");
      out.write("					<select name=\"gender\" id=\"gender\">\r\n");
      out.write("						<option value=\"1\" ");
if(rs.getString("gender").equals("1")) {
      out.write(" selected ");
 } 
      out.write(">남자</option>\r\n");
      out.write("						<option value=\"2\" ");
if(rs.getString("gender").equals("2")) {
      out.write(" selected ");
 } 
      out.write(">여자</option>\r\n");
      out.write("					</select>\r\n");
      out.write("				</div>\r\n");
      out.write("				<button type=\"submit\">수정</button>\r\n");
      out.write("			</form>\r\n");
      out.write("		</section>\r\n");
      out.write("	</main>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("<footer>\r\n");
      out.write("	<h3>Copyright &copy; 2021 All rights reserved High School</h3>\r\n");
      out.write("</footer>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("	function check() {\r\n");
      out.write("		const id = document.getElementById(\"id\");\r\n");
      out.write("		const name = document.getElementById(\"name\");\r\n");
      out.write("		\r\n");
      out.write("		if(!id.value) {\r\n");
      out.write("			alert(\"학번을 입력해주세요.\");\r\n");
      out.write("			id.focus();\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		if(!name.value) {\r\n");
      out.write("			alert(\"이름을 입력해주세요.\");\r\n");
      out.write("			name.focus();\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		return true;\r\n");
      out.write("	}\r\n");
      out.write("</script>\r\n");

	DBConnection.close(rs, pstmt, conn);

      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
