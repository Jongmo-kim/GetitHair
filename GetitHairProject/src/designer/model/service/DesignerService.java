package designer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.dao.DesignerDao;
import designer.model.vo.Designer;

public class DesignerService {
	public Designer selectOneDesigner(String designerId) {
		Connection conn = JDBCTemplate.getConnection();
		Designer result = new DesignerDao().selectOneDesigner(conn, designerId);
		JDBCTemplate.close(conn);
		return result;
	}

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

	//페이징관련 기능 추가 도현
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

	public Object[] selectAllDesignerById(String keyword, int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		Object[] list = new DesignerDao().selectAllDesignerById(conn,keyword,reqPage,maxPrintSize);
		int result = (Integer)list[0];
		result = (result / maxPrintSize) + ((result % maxPrintSize) != 0 ? 1 : 0); //maxPageSize 계산
		list[0] = result;
		JDBCTemplate.close(conn);
		return list;
	}
	public Object[] selectAllDesignerByName(String keyword, int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		Object[] list = new DesignerDao().selectAllDesignerByName(conn,keyword,reqPage,maxPrintSize);
		int result = (Integer)list[0];
		result = (result / maxPrintSize) + ((result % maxPrintSize) != 0 ? 1 : 0); //maxPageSize 계산
		list[0] = result;
		JDBCTemplate.close(conn);
		return list;
	}

}
