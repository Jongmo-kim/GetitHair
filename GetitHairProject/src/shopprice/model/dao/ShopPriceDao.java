package shopprice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import shopprice.model.vo.ShopPrice;

public class ShopPriceDao {

	public ShopPrice selectOneShopPrice(Connection conn, int no) {
		ShopPrice shopPrice = null;
		String sql = "select * from Shop_price where shop_price_no = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				shopPrice = new ShopPrice();
				shopPrice.setShopPriceNo((rset.getInt("shop_price_no")));
				Hairshop hairshop = new HairshopService().selectOneHairshop(rset.getInt("shop_no"));
				shopPrice.setHairshop(hairshop);
				shopPrice.setPrice(rset.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return shopPrice;
	}

}
