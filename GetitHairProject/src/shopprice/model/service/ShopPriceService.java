package shopprice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import shopprice.model.dao.ShopPriceDao;
import shopprice.model.vo.ShopPrice;

public class ShopPriceService {

	public ArrayList<ShopPrice> selectOneShopDetaPrice(int shopNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<ShopPrice> list = new ShopPriceDao().selectOneShopDetaPrice(shopNo, conn);
		JDBCTemplate.close(conn);
		return list;
	}


}
