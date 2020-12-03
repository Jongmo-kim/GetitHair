package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	//데이터베이스 코드 중 중복부분 처리
	//1. Driver등록, Connection객체 생성1	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","getithair","1234");//1.220.236.74:15215 태민수정 내가이상한건지 확인용
			conn.setAutoCommit(false);//자동으로 커밋되는 설정을 해제
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	//2. Connection Close
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {				
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement pstmt) {
		try {
			if(pstmt != null && !pstmt.isClosed()) {				
				pstmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {				
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
	//3. commit, rollback
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {				
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {				
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
