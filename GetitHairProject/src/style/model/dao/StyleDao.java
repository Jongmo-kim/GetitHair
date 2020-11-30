package style.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import style.model.vo.Style;

public class StyleDao {

	public Style selectOneStyle(Connection conn, int styleNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from style where style_no = ?";
		Style s = new Style();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, styleNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				s.setStyleNo(rset.getInt("style_no"));
				s.setStyleType(rset.getString("style_type"));
				s.setStyleName(rset.getString("style_name"));
				//s.setStyleImg(rset.getString("style_img"));
				s.setStyleLikes(rset.getInt("style_likes"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return s;
	}

	public ArrayList<Style> selectAllStyle(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from style";
		ArrayList<Style> list = new ArrayList<Style>();
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Style s = new Style();
				s.setStyleNo(rset.getInt("style_no"));
				s.setStyleType(rset.getString("style_type"));
				s.setStyleName(rset.getString("style_name"));
				s.setStyleLikes(rset.getInt("style_likes"));
				list.add(s);
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

	public int insertStyle(Connection conn, Style style) {
		PreparedStatement pstmt = null;
		String query = "insert into style values(style_req.nextval,?,?,0)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, style.getStyleType());
			pstmt.setString(2, style.getStyleName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteStyle(Connection conn, int styleNo) {
		PreparedStatement pstmt = null;
		String query = "delete from style where style_no = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, styleNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateStyle(Connection conn, Style style) {
		PreparedStatement pstmt = null;
		String query = "update style set style_type=?, style_name=?, style_likes=? where style_no=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, style.getStyleType());
			pstmt.setString(2, style.getStyleName());
			pstmt.setInt(3, style.getStyleLikes());
			pstmt.setInt(4, style.getStyleNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Style> searchStyle(Connection conn, String searchStyle) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		String query = "select * from style where style_name like (?)";
		ArrayList<Style> list = new ArrayList<Style>();
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, '%'+searchStyle+'%');
			rset = ps.executeQuery();
			while(rset.next()) {
				Style s = new Style();
				s.setStyleNo(rset.getInt("style_no"));
				s.setStyleType(rset.getString("style_type"));
				s.setStyleName(rset.getString("style_name"));
				s.setStyleLikes(rset.getInt("style_likes"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return list;
	}

	public int totalCount(Connection conn) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from style";
		try {
			ps = conn.prepareStatement(query);
			rset = ps.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return result;
	}

	public ArrayList<Style> selectList(Connection conn, int start, int end) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		ArrayList<Style> list = new ArrayList<Style>();
		String query = "SELECT * FROM (SELECT ROWNUM AS RNUM, N.* FROM (SELECT * FROM NOTICE ORDER BY 1 DESC)N) WHERE RNUM BETWEEN ? AND ?";//최신꺼가 제일 위로 오게
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rset = ps.executeQuery();
			while(rset.next()) {
				Style s = new Style();
				s.setStyleNo(rset.getInt("style_no"));
				s.setStyleType(rset.getString("style_type"));
				s.setStyleName(rset.getString("style_name"));
				s.setStyleLikes(rset.getInt("style_likes"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return list;
	}

}
