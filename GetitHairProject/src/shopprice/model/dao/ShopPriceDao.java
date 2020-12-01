package shopprice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import org.apache.jasper.tagplugins.jstl.core.Set;

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

	public ArrayList<ShopPrice> selectOneShopDetaPrice(int shopNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ShopPrice> list = new ArrayList<ShopPrice>();
		String query = "select * from shop_price where shop_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, shopNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ShopPrice price = new ShopPrice();
				Hairshop shopNo1 = new HairshopService().selectOneHairshop(shopNo);
				price.setHairshop(shopNo1);
				price.setPrice(rs.getInt("price"));
				price.setShopPriceNo(rs.getInt("shop_price_no"));
				list.add(price);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
