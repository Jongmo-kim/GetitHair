package designer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.service.DesignerService;
import designer.model.vo.DesignerList;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;

public class DesignerListDao {

	public ArrayList<DesignerList> selectDesignerListByShopNo(Connection conn, int shopNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DesignerList> list = new ArrayList<DesignerList>();
		String query = "select * from designer_list where shop_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, shopNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DesignerList dl = new DesignerList();
				dl.setDesignerListNo(rs.getInt(1));
				dl.setShop(new HairshopService().selectOneHairshop(rs.getInt(2)));
				dl.setDesigner(new DesignerService().selectOneDesigner(rs.getInt(3)));
				list.add(dl);
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
