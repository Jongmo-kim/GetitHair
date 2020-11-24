package style.controller;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;

public class HairshopService {
	public ArrayList<Hairshop> selectHairshopList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Hairshop> list = new HairshopDao().selectHairshop(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Hairshop selectOneHairshop(int shopNo) {
		Connection conn = JDBCTemplate.getConnection();
		Hairshop hs = new HairshopDao().selectOneHairshop(conn,shopNo);
		JDBCTemplate.close(conn);
		return hs;
	}
}
