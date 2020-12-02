package stylelist.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.vo.DesignerList;
import style.model.vo.Style;
import stylelist.model.dao.StylelistDao;
import stylelist.model.vo.StyleTypeList;
import stylelist.model.vo.Stylelist;

public class StylelistService {

	public Stylelist selectOneStylelist(int no) {
		Connection conn = JDBCTemplate.getConnection();
		Stylelist stylelist = new StylelistDao().selectOneStylelist(conn, no);
		JDBCTemplate.close(conn);
		return stylelist;
	}

	public ArrayList<Stylelist> selectAllStylelistByDesingerNo(int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Stylelist> stylelist = new StylelistDao().select();
		return null;
	}
	
	public ArrayList<Style> selectAllStylelistByTypeAndDesignerNo(String type,int designerNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Style> list = new StylelistDao().selectAllStylelistByTypeAndDesignerNo(conn,type,designerNo);
		JDBCTemplate.close(conn);
		
		return list;
	}

}
