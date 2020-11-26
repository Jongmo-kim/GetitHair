package style.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import style.model.dao.StyleDao;
import style.model.vo.Style;
import style.model.vo.StylePageData;

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
	public ArrayList<Style> searchStyle(String searchStyle) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Style> list = new StyleDao().searchStyle(conn,searchStyle);
		JDBCTemplate.close(conn);
		return list;
	}
	public StylePageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		StyleDao dao = new StyleDao();
		int totalCount = dao.totalCount(conn);
		int numPerPage = 10;
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {//나머지가 0이면
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Style> list = dao.selectList(conn,start,end);
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/noticeList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/noticeList?reqPage="+pageNo+"'>다음</a>";
		}
		StylePageData spd = new StylePageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return spd;
	}
}
