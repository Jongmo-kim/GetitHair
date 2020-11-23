package style.controller;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;

public class HairService {

	public ArrayList<Hairshop> selectHairshopList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Hairshop> list = new HairshopDao().selectHairshop(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
