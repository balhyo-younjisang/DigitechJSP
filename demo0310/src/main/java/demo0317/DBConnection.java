package demo0317;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	// getConnection
	public static Connection getConnection() throws Exception {
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch(ClassNotFoundException e) {
			System.out.println("Connection Failed :: ClassNotFoundException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection Failed :: SQLException");
			e.printStackTrace();
		} catch (RuntimeException e) {
			System.out.println("Connection Failed :: RuntimeException");
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// closeConnection
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null)
				rs.close();
			
			if(pstmt != null)
				pstmt.close();
			
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// closeConnection
	public static void close(PreparedStatement pstmt, Connection conn) {
		try {

			if (pstmt != null)
				pstmt.close();

			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
