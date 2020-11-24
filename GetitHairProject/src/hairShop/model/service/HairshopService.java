package hairshop.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import hairShop.model.dao.HairshopDao;
import hairShop.model.vo.Hairshop;

public class HairshopService {

	public Hairshop selectShop(int result) {
		Connection conn = JDBCTemplate.getConnection();
		Hairshop hs = new HairshopDao().selectShop(conn, result);
		return null;
	}

}
