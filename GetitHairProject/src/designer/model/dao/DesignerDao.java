package designer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.vo.Designer;

public class DesignerDao {

	public Designer selectOneDesigner(Connection conn, int designerNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Designer loginDesigner = null;
		String query = "select * from designer where designer_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, designerNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginDesigner = new Designer();
				loginDesigner.setDesignerNo(rset.getInt("designer_no"));
				loginDesigner.setDesignerId(rset.getString("designer_id"));
				loginDesigner.setDesignerPw(rset.getString("designer_pw"));
				loginDesigner.setDesignerGen(rset.getString("designer_gen"));
				loginDesigner.setDesignerName(rset.getString("designer_name"));
				loginDesigner.setDesignerEmail(rset.getString("designer_email"));
				loginDesigner.setDesignerPhone(rset.getString("designer_phone"));
				loginDesigner.setDesignerYear(rset.getInt("designer_year"));
				loginDesigner.setDesignerRank(rset.getString("designer_rank"));
				loginDesigner.setDesignerIntro(rset.getString("designer_intro"));
				loginDesigner.setDesignerKeyword(rset.getString("designer_keyword"));
				loginDesigner.setDesignerImg(rset.getString("designer_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return loginDesigner;
	}
	
	public Designer selectOneDesigner(Connection conn, String designerId, String designerPw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Designer loginDesigner = null;
		String query = "select * from designer where designer_id=? and designer_pw=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, designerId);
			pstmt.setString(2, designerPw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginDesigner = new Designer();
				loginDesigner.setDesignerNo(rset.getInt("designer_no"));
				loginDesigner.setDesignerId(rset.getString("designer_id"));
				loginDesigner.setDesignerPw(rset.getString("designer_pw"));
				loginDesigner.setDesignerGen(rset.getString("designer_gen"));
				loginDesigner.setDesignerName(rset.getString("designer_name"));
				loginDesigner.setDesignerEmail(rset.getString("designer_email"));
				loginDesigner.setDesignerPhone(rset.getString("designer_phone"));
				loginDesigner.setDesignerYear(rset.getInt("designer_year"));
				loginDesigner.setDesignerRank(rset.getString("designer_rank"));
				loginDesigner.setDesignerIntro(rset.getString("designer_intro"));
				loginDesigner.setDesignerKeyword(rset.getString("designer_keyword"));
				loginDesigner.setDesignerImg(rset.getString("designer_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return loginDesigner;
	}
	
	public int insertDesigner(Connection conn, Designer designer) {
		PreparedStatement pstmt = null;
		int result = 0;
		String quert = "insert into designer values(designer_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(quert);
			pstmt.setString(1, designer.getDesignerId());
			pstmt.setString(2, designer.getDesignerPw());
			pstmt.setString(3, designer.getDesignerGen());
			pstmt.setString(4, designer.getDesignerName());
			pstmt.setString(5, designer.getDesignerEmail());
			pstmt.setString(6, designer.getDesignerPhone());
			pstmt.setInt(7, designer.getDesignerYear());
			pstmt.setString(8, designer.getDesignerRank());
			pstmt.setString(9, designer.getDesignerIntro());
			pstmt.setString(10, designer.getDesignerKeyword());
			pstmt.setString(11, designer.getDesignerImg());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteDesigner(Connection conn, String designerId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from designer where designer_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, designerId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateDesigner(Connection conn, Designer designer) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update designer set designer_pw=?, designer_email=?, designer_phone=?, designer_year=?, designer_rank=?, designer_intro=?, designer_keyword=?, designer_img=? where designer_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, designer.getDesignerPw());
			pstmt.setString(2, designer.getDesignerEmail());
			pstmt.setString(3, designer.getDesignerPhone());
			pstmt.setInt(4, designer.getDesignerYear());
			pstmt.setString(5, designer.getDesignerRank());
			pstmt.setString(6, designer.getDesignerIntro());
			pstmt.setString(7, designer.getDesignerKeyword());
			pstmt.setString(8, designer.getDesignerImg());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Designer> selectAllDesigner(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Designer> list = new ArrayList<Designer>();
		String query = "select * from designer";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Designer d = new Designer();
				d.setDesignerNo(rset.getInt("designer_no"));
				d.setDesignerId(rset.getString("designer_id"));
				d.setDesignerPw(rset.getString("designer_pw"));
				d.setDesignerGen(rset.getString("designer_gen"));
				d.setDesignerName(rset.getString("designer_name"));
				d.setDesignerEmail(rset.getString("designer_email"));
				d.setDesignerPhone(rset.getString("designer_phone"));
				d.setDesignerYear(rset.getInt("designer_year"));
				d.setDesignerRank(rset.getString("designer_rank"));
				d.setDesignerIntro(rset.getString("designer_intro"));
				d.setDesignerKeyword(rset.getString("designer_keyword"));
				d.setDesignerImg(rset.getString("designer_img"));
				list.add(d);
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

	public ArrayList<Designer> selectAllDesigner(Connection conn, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Designer> list = new ArrayList<Designer>();
		String query = "SELECT * FROM (SELECT ROWNUM RN,D.* FROM "
				+ "(SELECT D.* FROM designer D ORDER BY D.DESIGNER_NO DESC) D) "
				+ "WHERE RN BETWEEN ? AND ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(2, maxPrintSize*reqPage);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Designer d = new Designer();
				d.setDesignerNo(rset.getInt("designer_no"));
				d.setDesignerId(rset.getString("designer_id"));
				d.setDesignerPw(rset.getString("designer_pw"));
				d.setDesignerGen(rset.getString("designer_gen"));
				d.setDesignerName(rset.getString("designer_name"));
				d.setDesignerEmail(rset.getString("designer_email"));
				d.setDesignerPhone(rset.getString("designer_phone"));
				d.setDesignerYear(rset.getInt("designer_year"));
				d.setDesignerRank(rset.getString("designer_rank"));
				d.setDesignerIntro(rset.getString("designer_intro"));
				d.setDesignerKeyword(rset.getString("designer_keyword"));
				d.setDesignerImg(rset.getString("designer_img"));
				list.add(d);
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

	public int getAllDesignerMaxPageSize(Connection conn, int maxPrintSize) {
		PreparedStatement pstmt = null;
		String qrySelect = "select count(*) cnt from designer";
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(qrySelect);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
				if(result != 0) {
					result = (result / maxPrintSize) + ((result % maxPrintSize) != 0 ? 1 : 0);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
