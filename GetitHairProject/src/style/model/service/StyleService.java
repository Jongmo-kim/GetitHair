package style.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import style.model.dao.StyleDao;
import style.model.vo.Style;

public class StyleService {
	public Style selectOneStyle(int styleNo) {
		Connection conn = JDBCTemplate.getConnection();
		Style s = new StyleDao().selectOneStyle(conn,styleNo);
		JDBCTemplate.close(conn);
		return s;
	}
	public ArrayList<Style> selectAllStyle() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Style> list = new StyleDao().selectAllStyle(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int insertStyle(Style style) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new StyleDao().insertStyle(conn,style);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteStyle(int styleNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new StyleDao().deleteStyle(conn,styleNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateStyle(Style style) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new StyleDao().updateStyle(conn,style);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
