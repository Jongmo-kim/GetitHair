package hairinfo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import hairinfo.model.dao.HairinfoDao;
import hairinfo.model.vo.Hairinfo;

public class HairinfoService {
	public Hairinfo selectOneHairinfo(int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		Hairinfo loginHairinfo = new HairinfoDao().selectOneHairinfo(conn,customerNo);
		JDBCTemplate.close(conn);
		return loginHairinfo;
	}
	public ArrayList<Hairinfo> selectAllHairinfo(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Hairinfo> list = new HairinfoDao().selectAllHairinfo(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int updateHairinfo(Hairinfo hairinfo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new HairinfoDao().updateHairinfo(conn,hairinfo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteHairinfo(int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new HairinfoDao().deleteHairinfo(conn,customerNo);
		JDBCTemplate.close(conn);
		return result;
	}
	public int insertHairinfo(Hairinfo hairinfo) {
		Connection conn =  JDBCTemplate.getConnection();
		int result = 0;
		result = new HairinfoDao().insertHairinfo(conn,hairinfo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}


}
