package shopprice.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import shopprice.model.dao.ShopPriceDao;
import shopprice.model.vo.ShopPrice;

public class ShopPriceService {

	public ShopPrice selectOneShopDetaPrice(int shopNo) {
		Connection conn = JDBCTemplate.getConnection();
		ShopPrice price = new ShopPriceDao().selectOneShopDetaPrice(shopNo, conn);
		JDBCTemplate.close(conn);
		return price;
	}

}
