package stylelist.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import shopprice.model.vo.ShopPrice;
import style.model.service.StyleService;
import style.model.vo.Style;
import stylelist.model.vo.Stylelist;

public class StylelistDao {

	public Stylelist selectOneStylelist(Connection conn, int no) {
		Stylelist stylelist = null;
		String sql = "select * from style_list where stylelist_no = ?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				stylelist = getStylelistFromRset(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);			
		}
		
		return stylelist;
	}

	private Stylelist getStylelistFromRset(ResultSet rset) {
		Stylelist stylelist = new Stylelist();
		try {
			//rset.getInt("style_no");
			Style style = new StyleService().selectOneStyle(rset.getInt("style_no"));
			//rset.getInt("designer_no");
			Designer designer = new DesignerService().selectOneDesigner(rset.getInt("designer_no"));
			ShopPrice shopprice = new ShopPriceService().selectOneShopPrice(rset.getInt("shop_price_no"));
			stylelist.setStyle(style);
			stylelist.setDesigner(designer);
			stylelist.setShopPrice(shopprice);
			stylelist.setStylelistNo(rset.getInt("stylelist_no"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stylelist;
	}

}
