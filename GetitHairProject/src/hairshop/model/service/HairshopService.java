package hairshop.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import hairshop.model.dao.HairshopDao;
import hairshop.model.vo.Hairshop;

public class HairshopService {
//temp
	public Hairshop selectShop(int result) {
		Connection conn = JDBCTemplate.getConnection();
		Hairshop hs = new HairshopDao().selectShop(conn, result);
		return null;
	}

}
