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
import vo.Customer;

/**
 * Servlet implementation class GetCustomerListCtrl
 */
@WebServlet("/GetCustomerListCtrl")
public class GetCustomerListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCustomerListCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		 try {
			 conn = DBConnection.getConnection();
			 String sql = "SELECT custno, custname, phone, address, TO_CHAR(joindate,'YYYY-MM-DD') as joindate, case when grade = 'A' then 'VIP' when grade = 'B' then '일반' when grade = 'C' then '직원' END as grade, city FROM member_tbl_02";
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
			 List<Customer> vo = new ArrayList<Customer>();
			 
			 while(rs.next()) {
				 Customer customer = new Customer();
				 customer.setCustno(rs.getInt("custno"));
				 customer.setCustname(rs.getString("custname"));
				 customer.setPhone(rs.getString("phone"));
				 customer.setAddress(rs.getString("address"));
				 customer.setJoindate(rs.getDate("joindate"));
				 customer.setGrade(rs.getString("grade"));
				 customer.setCity(rs.getString("city"));
				 
				 vo.add(customer);
			 }
			 
			 request.setAttribute("vo", vo);
			 request.getRequestDispatcher("list.jsp").forward(request, response);
		 } catch (Exception e) {
			 e.printStackTrace();
		 } finally {
			 DBConnection.close(rs, pstmt, conn);
		 }
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
