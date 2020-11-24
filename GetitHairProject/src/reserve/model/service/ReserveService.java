package reserve.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import reserve.model.dao.ReserveDao;
import reserve.model.vo.Reserve;

public class ReserveService {
	public int insertReserve(Reserve reserve) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new ReserveDao().insertReserve(conn, reserve);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	public Reserve selectOneReserve(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		Reserve reserve = new ReserveDao().selectOneReserve(conn, reserveNo);
		if(reserve == null) {
			reserve = new Reserve();
		}
		JDBCTemplate.close(conn);
		return reserve;
	}
	public int deleteReserve(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result= new ReserveDao().deleteReserve(conn, reserveNo);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateReserve(Reserve reserve) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReserveDao().updateReserve(conn, reserve);
		commitOrRollback(conn, result);
		JDBCTemplate.close(conn);
		return result;
	}
	private void commitOrRollback(Connection conn, int result) {
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
	}
	
}
