package hairshop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import hairshop.model.dao.HairshopDao;
import hairshop.model.vo.Hairshop;

public class HairshopService {

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
	public ArrayList<Hairshop> selectHairshop() {
	      Connection conn = JDBCTemplate.getConnection();
	      ArrayList<Hairshop> list = new HairshopDao().selectHairshop(conn);
	      JDBCTemplate.close(conn);
	      return list;
	   }
	public ArrayList<Hairshop> searchHairshop(String searchShop) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Hairshop> list1 = new HairshopDao().searchHairshop(conn,searchShop);
		ArrayList<Hairshop> list2 = new HairshopDao().searchPlace(conn,searchShop);
		JDBCTemplate.close(conn);
		if(list1.size() < list2.size()) {
			return list2;
		}
		return list1;
	}
	public ArrayList<Hairshop> hairshopMore(int start) {
		Connection conn =JDBCTemplate.getConnection();
		int count = 10;
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

	public Hairshop selectOneHairshop(String inputId, String inputPw) {
		Connection conn = JDBCTemplate.getConnection();
		Hairshop result = new HairshopDao().selectOneHairshop(conn, inputId,inputPw);
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteShop(int shopNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new HairshopDao().deleteShop(conn,shopNo);
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateShop(Hairshop shop) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new HairshopDao().updateShop(conn,shop);
		JDBCTemplate.close(conn);
		return result;
	}
	
}
