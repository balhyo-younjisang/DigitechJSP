package ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;
import vo.CustomerMoney;

/**
 * Servlet implementation class GetSalesDataCtrl
 */
@WebServlet("/GetSalesDataCtrl")
public class GetSalesDataCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetSalesDataCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT M.custno, C.custname, CASE   WHEN C.grade = 'A' THEN 'VIP' WHEN C.grade = 'B' THEN '일반' WHEN C.grade = 'C' THEN '직원' END AS grade, SUM(M.price) as sales FROM MONEY_TBL_02 M JOIN Member_tbl_02 C ON M.custno = C.custno GROUP BY M.custno, C.custname, C.grade ORDER BY sales desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			List<CustomerMoney> vo = new ArrayList<CustomerMoney>();
			while(rs.next()) {
				CustomerMoney customerMoney = new CustomerMoney();
				customerMoney.setCustno(rs.getString("custno"));
				customerMoney.setCustname(rs.getString("custname"));
				customerMoney.setGrade(rs.getString("grade"));
				customerMoney.setSales(rs.getInt("sales"));
				vo.add(customerMoney);
			}
			
			request.setAttribute("vo", vo);
			request.getRequestDispatcher("sale.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, conn);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
