package stylelist.model.dao;

import java.sql.Connection;

import common.JDBCTemplate;
import shopprice.model.dao.ShopPriceDao;
import shopprice.model.vo.ShopPrice;

public class ShopPriceService {

	public ShopPrice selectOneShopPrice(int no) {
		Connection conn = JDBCTemplate.getConnection();
		ShopPrice shopprice = new ShopPriceDao().selectOneShopPrice(conn, no);
		JDBCTemplate.close(conn);
		return shopprice;
	}

}
