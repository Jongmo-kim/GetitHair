package designer.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import designer.model.dao.DesignerDao;
import designer.model.vo.Designer;

public class DesignerService {
	public Designer selectOneDesigner(int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		Designer result = new DesignerDao().selectOneDesigner(conn, designerNo);
		JDBCTemplate.close(conn);
		return result;
	}
}
