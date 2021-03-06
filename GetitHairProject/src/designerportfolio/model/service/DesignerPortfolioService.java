package designerportfolio.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import designerportfolio.model.dao.DesignerPortfolioDao;
import designerportfolio.model.vo.DesignerPortfolio;

public class DesignerPortfolioService {

	public int totalCount() {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = new DesignerPortfolioDao().totalCount(conn);
		JDBCTemplate.close(conn);
		return totalCount;
	}
	
	public int insertDesignerPortfolio(DesignerPortfolio dp, int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerPortfolioDao().insertDesignerPortfolio(conn,dp,designerNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<DesignerPortfolio> DesignerPortfolioMore(int start) {
		Connection conn = JDBCTemplate.getConnection();
		int count = 5;	// 한번에 가지고 올 개수
		int end = start + count - 1;
		ArrayList<DesignerPortfolio> list = new DesignerPortfolioDao().DesignerPortfolioMore(conn,start,end);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<DesignerPortfolio> selectAllPortfolio(int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<DesignerPortfolio> pflist = new DesignerPortfolioDao().selectAllPortfolio(conn, designerNo);
		JDBCTemplate.close(conn);
		return pflist;
	}
	
	public int deletePortfolio(int portfolioNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DesignerPortfolioDao().deletePortfolio(conn, portfolioNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public DesignerPortfolio selectOnePortfolio(int portfolioNo) {
		Connection conn = JDBCTemplate.getConnection();
		DesignerPortfolio dp = new DesignerPortfolioDao().selectOnePortfolio(conn,portfolioNo);
		return dp;
	}
	
}
