package designer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import designer.model.vo.Designer;

public class DesignerDao {

	public Designer selectOneDesigner(Connection conn, String designerId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Designer loginDesigner = null;
		String query = "select * from designer where designer_Id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, designerId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginDesigner = new Designer();
				loginDesigner.setDesignerNo(rset.getInt("designer_no"));
				loginDesigner.setDesignerId(rset.getString("designer_id"));
				loginDesigner.setDesignerPw(rset.getString("designer_pw"));
				loginDesigner.setDesignerName(rset.getString("designer_name"));
				loginDesigner.setDesignerPhone(rset.getString("designer_phone"));
				loginDesigner.setDesignerYear(rset.getInt("designer_year"));
				loginDesigner.setDesignerRank(rset.getString("designer_rank"));
				loginDesigner.setDesignerIntro(rset.getString("designer_intro"));
				loginDesigner.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
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
				loginDesigner.setDesignerName(rset.getString("designer_name"));
				loginDesigner.setDesignerPhone(rset.getString("designer_phone"));
				loginDesigner.setDesignerYear(rset.getInt("designer_year"));
				loginDesigner.setDesignerRank(rset.getString("designer_rank"));
				loginDesigner.setDesignerIntro(rset.getString("designer_intro"));
				loginDesigner.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
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
				loginDesigner.setDesignerName(rset.getString("designer_name"));
				loginDesigner.setDesignerPhone(rset.getString("designer_phone"));
				loginDesigner.setDesignerYear(rset.getInt("designer_year"));
				loginDesigner.setDesignerRank(rset.getString("designer_rank"));
				loginDesigner.setDesignerIntro(rset.getString("designer_intro"));
				loginDesigner.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
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
		String quert = "insert into designer values(designer_seq.nextval,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(quert);
			pstmt.setString(1, designer.getDesignerId());
			pstmt.setString(2, designer.getDesignerPw());
			pstmt.setString(3, designer.getDesignerName());
			pstmt.setString(4, designer.getDesignerPhone());
			pstmt.setInt(5, designer.getDesignerYear());
			pstmt.setString(6, designer.getDesignerRank());
			pstmt.setString(7, designer.getDesignerIntro());
			pstmt.setString(8, designer.getDesignerEnrolldate());
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
		String query = "update designer set designer_pw=?, designer_phone=?, designer_year=?, designer_rank=?, designer_intro=? where designer_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, designer.getDesignerPw());
			pstmt.setString(2, designer.getDesignerPhone());
			pstmt.setInt(3, designer.getDesignerYear());
			pstmt.setString(4, designer.getDesignerRank());
			pstmt.setString(5, designer.getDesignerIntro());
			pstmt.setInt(6, designer.getDesignerNo());
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
				d.setDesignerName(rset.getString("designer_name"));
				d.setDesignerPhone(rset.getString("designer_phone"));
				d.setDesignerYear(rset.getInt("designer_year"));
				d.setDesignerRank(rset.getString("designer_rank"));
				d.setDesignerIntro(rset.getString("designer_intro"));
				d.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
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
	
	// 도현씨 제가 고치긴 했는데 혹시 오류 날수도 있어요...!
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
				d.setDesignerName(rset.getString("designer_name"));
				d.setDesignerPhone(rset.getString("designer_phone"));
				d.setDesignerYear(rset.getInt("designer_year"));
				d.setDesignerRank(rset.getString("designer_rank"));
				d.setDesignerIntro(rset.getString("designer_intro"));
				d.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
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

	public Object[] selectAllDesignerById(Connection conn, String keyword, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Designer> list = new ArrayList<Designer>();
		String query = "SELECT R.*,(SELECT COUNT(*) FROM (SELECT D.* FROM designer D WHERE designer_id LIKE ? ORDER BY D.DESIGNER_NO DESC) D) as cnt FROM (SELECT ROWNUM RN,D.* FROM "
				+ "(SELECT D.* FROM designer D WHERE designer_id LIKE ? ORDER BY D.DESIGNER_NO DESC) D) R "
				+ "WHERE RN BETWEEN ? AND ?";
		int cnt=0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword+"%");
			pstmt.setString(2, keyword+"%");
			pstmt.setInt(3, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(4, maxPrintSize*reqPage);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				cnt = rset.getInt("cnt");
				Designer d = new Designer();
				d.setDesignerNo(rset.getInt("designer_no"));
				d.setDesignerId(rset.getString("designer_id"));
				d.setDesignerPw(rset.getString("designer_pw"));
				d.setDesignerName(rset.getString("designer_name"));
				d.setDesignerPhone(rset.getString("designer_phone"));
				d.setDesignerYear(rset.getInt("designer_year"));
				d.setDesignerRank(rset.getString("designer_rank"));
				d.setDesignerIntro(rset.getString("designer_intro"));
				d.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return new Object[]{cnt,list};
	}

	public Object[] selectAllDesignerByName(Connection conn, String keyword, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Designer> list = new ArrayList<Designer>();
		String query = "SELECT R.*,(SELECT COUNT(*) FROM (SELECT D.* FROM designer D WHERE designer_name LIKE ? ORDER BY D.DESIGNER_NO DESC) D) as cnt FROM (SELECT ROWNUM RN,D.* FROM "
				+ "(SELECT D.* FROM designer D WHERE designer_name LIKE ? ORDER BY D.DESIGNER_NO DESC) D) R "
				+ "WHERE RN BETWEEN ? AND ?";
		int cnt=0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword+"%");
			pstmt.setString(2, keyword+"%");
			pstmt.setInt(3, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(4, maxPrintSize*reqPage);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				cnt = rset.getInt("cnt");
				Designer d = new Designer();
				d.setDesignerNo(rset.getInt("designer_no"));
				d.setDesignerId(rset.getString("designer_id"));
				d.setDesignerPw(rset.getString("designer_pw"));
				d.setDesignerName(rset.getString("designer_name"));
				d.setDesignerPhone(rset.getString("designer_phone"));
				d.setDesignerYear(rset.getInt("designer_year"));
				d.setDesignerRank(rset.getString("designer_rank"));
				d.setDesignerIntro(rset.getString("designer_intro"));
				d.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return new Object[]{cnt,list};
	}

	public Designer selectOneSerchId(Connection conn, String designerName, String designerPhone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Designer Designer = null;
		String query = "select * from designer where designer_name=? and designer_phone=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, designerName);
			pstmt.setString(2, designerPhone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				Designer = new Designer();
				Designer.setDesignerNo(rset.getInt("designer_no"));
				Designer.setDesignerId(rset.getString("designer_id"));
				Designer.setDesignerPw(rset.getString("designer_pw"));
				Designer.setDesignerName(rset.getString("designer_name"));
				Designer.setDesignerPhone(rset.getString("designer_phone"));
				Designer.setDesignerYear(rset.getInt("designer_year"));
				Designer.setDesignerRank(rset.getString("designer_rank"));
				Designer.setDesignerIntro(rset.getString("designer_intro"));
				Designer.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return Designer;
	}

	public Designer selectOneSerchPw(Connection conn, String designerId, String designerPhone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Designer Designer = null;
		String query = "select * from designer where designer_Id=? and designer_phone=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, designerId);
			pstmt.setString(2, designerPhone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				Designer = new Designer();
				Designer.setDesignerNo(rset.getInt("designer_no"));
				Designer.setDesignerId(rset.getString("designer_id"));
				Designer.setDesignerPw(rset.getString("designer_pw"));
				Designer.setDesignerName(rset.getString("designer_name"));
				Designer.setDesignerPhone(rset.getString("designer_phone"));
				Designer.setDesignerYear(rset.getInt("designer_year"));
				Designer.setDesignerRank(rset.getString("designer_rank"));
				Designer.setDesignerIntro(rset.getString("designer_intro"));
				Designer.setDesignerEnrolldate(rset.getString("designer_enrolldate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return Designer;
	}
}
