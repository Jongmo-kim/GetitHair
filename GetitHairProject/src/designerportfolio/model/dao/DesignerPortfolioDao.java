package designerportfolio.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import designerportfolio.model.vo.DesignerPortfolio;

public class DesignerPortfolioDao {

	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String qurey = "select count(*) cnt from designer_portfolio";
		try {
			pstmt = conn.prepareStatement(qurey);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}


	public int insertDesignerPortfolio(Connection conn, DesignerPortfolio dp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into designer_portfolio values(designer_portfolio_seq.nextval,?,?,?,?,to_char(sysdate,'yyyy-mm-dd'))";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dp.getPortfolioWriter());
			pstmt.setString(2, dp.getStyleName());
			pstmt.setString(3, dp.getPortfolioContent());
			pstmt.setString(4, dp.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	public ArrayList<DesignerPortfolio> DesignerPortfolioMore(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DesignerPortfolio> list = new ArrayList<DesignerPortfolio>();
		String query = "select * from (select rownum as rnum,p.* from (select * from designer_portfolio order by 1 desc)p) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				DesignerPortfolio dp = new DesignerPortfolio();
				dp.setPortfolioNo(rset.getInt("designer_portfolio_no"));
				dp.setStyleName(rset.getString("designer_portfolio_style_name"));
				dp.setPortfolioWriter(rset.getString("designer_no"));
				dp.setPortfolioContent(rset.getString("designer_portfolio_content"));
				dp.setFilepath(rset.getString("filepath"));
				dp.setPortfolioDate(rset.getString("designer_portfolio_date"));
				list.add(dp);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}
