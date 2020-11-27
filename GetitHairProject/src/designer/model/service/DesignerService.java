package designer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.dao.DesignerDao;
import designer.model.vo.Designer;
import designer.model.vo.DesignerList;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import review.model.vo.ReviewComment;
import review.model.vo.ReviewViewData;

public class DesignerService {
	public Designer selectOneDesigner(int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		Designer result = new DesignerDao().selectOneDesigner(conn, designerNo);
		JDBCTemplate.close(conn);
		return result;
	}
	
	public Designer selectOneDesigner(String designerId, String designerPw) {
		Connection conn = JDBCTemplate.getConnection();
		Designer result = new DesignerDao().selectOneDesigner(conn, designerId, designerPw);
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int insertDesigner(Designer designer) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerDao().insertDesigner(conn,designer);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int deleteDesigner(String designerId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerDao().deleteDesigner(conn, designerId);
		JDBCTemplate.close(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int updateDesigner(Designer designer) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerDao().updateDesigner(conn,designer);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<Designer> selectAllDesigner() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Designer> list = new DesignerDao().selectAllDesigner(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	//페이징관련 기능 추가
	public int getAllDesignerMaxPageSize(int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerDao().getAllDesignerMaxPageSize(conn,maxPrintSize);
		JDBCTemplate.close(conn);
		return result;
	}
	public ArrayList<Designer> selectAllDesigner(int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Designer> list = new DesignerDao().selectAllDesigner(conn,reqPage,maxPrintSize);
		JDBCTemplate.close(conn);
		return list;
	}

}
