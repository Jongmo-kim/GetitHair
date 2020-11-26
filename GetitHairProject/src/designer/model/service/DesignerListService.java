package designer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.dao.DesignerListDao;
import designer.model.vo.DesignerList;

public class DesignerListService {
	public ArrayList<DesignerList> selectDesignerListByShopNo(int shopNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<DesignerList> list = new DesignerListDao().selectDesignerListByShopNo(conn,shopNo);
		return list;
	}
}