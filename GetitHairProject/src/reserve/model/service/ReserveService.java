package reserve.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import reserve.model.dao.ReserveDao;
import reserve.model.vo.Reserve;

public class ReserveService {
	//custNo로 
	//sql custno로 where cust
	public ArrayList<Reserve> selectAll(int reserveNo){
		ArrayList<Reserve> list = null;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveDao().selectAll(conn);
		JDBCTemplate.close(conn);
		return list;		
	}
	public ArrayList<Reserve> selectAllByCust(int CustmoerNo){
		ArrayList<Reserve> list;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveDao().selectAllByCust(conn,CustmoerNo);
		JDBCTemplate.close(conn);
		return list;		
	}
	public ArrayList<Reserve> selectAllByDesigner(int DesignerNo){
		ArrayList<Reserve> list;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveDao().selectAllByDesigner(conn,DesignerNo);
		JDBCTemplate.close(conn);
		return list;		
	}
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
