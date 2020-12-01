package stylelist.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import shopprice.model.vo.ShopPrice;
import style.model.service.StyleService;
import style.model.vo.Style;
import stylelist.model.vo.Stylelist;

public class StylelistDao {

	public Stylelist selectOneStylelist(Connection conn, int no) {
		Stylelist stylelist = new Stylelist();
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
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return stylelist;
	}

	private Stylelist getStylelistFromRset(ResultSet rset) {
		Stylelist stylelist = new Stylelist();
		try {
			//rset.getInt("style_no");
			//Style style = new StyleService().selectOneStyle(rset.getInt("style_no"));
			//rset.getInt("designer_no");
			//Designer designer = new DesignerService().selectOneDesigner(rset.getInt("designer_no"));
			ShopPrice shopprice = new ShopPriceService().selectOneShopPrice(rset.getInt("shop_price_no"));
			//stylelist.setStyle(style);
			//stylelist.setDesigner(designer);
			stylelist.setShopPrice(shopprice);
			stylelist.setDesigner(getDesignerByNo(rset.getInt("designer_no")));
			stylelist.setStyle(getStyleByNo(rset.getInt("style_no")));
			stylelist.setStylelistNo(rset.getInt("stylelist_no"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stylelist;
	}
	private Style getStyleByNo(int no) {
		Style style = new StyleService().selectOneStyle(no);
		if(style == null) {
			style = new Style();
			style.setStyleNo(-1);
	      }
		return style;
	}
	  private Designer getDesignerByNo(int no) {
	      Designer designer = new DesignerService().selectOneDesigner(no);
	      if(designer == null) {
	         designer = new Designer();
	         designer.setDesignerNo(-1);
	      }
	      return designer;
	   }

	public ArrayList<Style> selectAllStylelistByTypeAndDesignerNo(Connection conn, String type, int designerNo) {
		ArrayList<Style> list = new ArrayList<Style>();
		String sql = "select style_no,style_type,style_name from"
				+ "(select s.style_no,s.style_type,s.style_name from style_list sl,style s where sl.designer_no = ? and sl.style_no = s.style_no) r where r.style_type = ? ";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, designerNo);
			pstmt.setString(2, type);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				Style style = new Style();
				style.setStyleNo(rset.getInt(1));
				style.setStyleType(rset.getString(2));
				style.setStyleName(rset.getString(3));
				list.add(style);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
}
