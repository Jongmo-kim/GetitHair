package designer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		String query = "select * from designer where designer_id=?, designer_pw=?";
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

}
