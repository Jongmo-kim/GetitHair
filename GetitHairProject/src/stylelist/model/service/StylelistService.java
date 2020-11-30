package stylelist.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import stylelist.model.dao.StylelistDao;
import stylelist.model.vo.Stylelist;

public class StylelistService {

	public Stylelist selectOneStylelist(int no) {
		Connection conn = JDBCTemplate.getConnection();
		Stylelist stylelist = new StylelistDao().selectOneStylelist(conn, no);
		JDBCTemplate.close(conn);
		return stylelist;
	}

}
