package style.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;

public class HairshopDao {

	public ArrayList<Hairshop> selectHairshop(Connection conn) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		String query = "select shop_no,shop_name,shop_addr,shop_time,shop_rate,shop_img,shop_likes from hairshop";
		ArrayList<Hairshop> list = new ArrayList<Hairshop>();
		try {
			ps = conn.prepareStatement(query);
			rset = ps.executeQuery();
			while(rset.next()) {
				Hairshop h = new Hairshop();
				h.setShopNo(rset.getInt("shop_no"));
				h.setShopName(rset.getString("shop_name"));
				h.setShopAddr(rset.getString("shop_addr"));
				list.add(h);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return list;
	}

}
