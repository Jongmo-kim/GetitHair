package hairshop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import hairshop.model.dao.HairshopDao;
import hairshop.model.vo.Hairshop;

public class HairshopService {

	public Hairshop selectShop(int result) {
		Connection conn = JDBCTemplate.getConnection();
		Hairshop hs = new HairshopDao().selectShop(conn, result);
		return null;
	}

	public Hairshop selectOneHairshop(int shopNo) {
		Connection conn = JDBCTemplate.getConnection();
		Hairshop hs = new HairshopDao().selectOneHairshop(conn, shopNo);
		if(hs != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return hs;
	}
	public ArrayList<Hairshop> selectHairshopList() {
	      Connection conn = JDBCTemplate.getConnection();
	      ArrayList<Hairshop> list = new HairshopDao().selectHairshop(conn);
	      JDBCTemplate.close(conn);
	      return list;
	   }
	public ArrayList<Hairshop> searchHairshop(String searchShop) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Hairshop> list = new HairshopDao().searchHairshop(conn,searchShop);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Hairshop> hairshopMore(int start) {
		Connection conn =JDBCTemplate.getConnection();
		int count = 5;
		int end = start + count -1;
		ArrayList<Hairshop> list = new HairshopDao().hairshopMore(conn,start,end);
		JDBCTemplate.close(conn);
		return list;
	}
	public int totalCount() {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = new HairshopDao().totalCount(conn);
		JDBCTemplate.close(conn);
		return totalCount;
	}

}
