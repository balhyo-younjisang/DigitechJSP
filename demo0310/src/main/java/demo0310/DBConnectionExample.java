package demo0310;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnectionExample {
	public static String getConnection() {
		String currentDate = null;
		Connection conn = null;
		
		try {
			// 1. JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			
			// 2. 데이터베이스 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "system", "1234"); // DriverManager.getConnection(url, OracleDB 계정, OracleDB Password)
			
			// 3. PreparedStatement 생성
			String sql = "SELECT sysdate FROM DUAL";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// 4. SQL문 전송 및 5. 결과 받기
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) 
				currentDate = rs.getString(1);

			// 6-1. 연결 해제
			rs.close();
			pstmt.close();
			
			System.out.println("연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("연결 실패 : ClassNotFoundException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("연결 실패 : SQLException");
			e.printStackTrace();
		}
		

		return currentDate != null ? currentDate : "Error!";
	}
}
