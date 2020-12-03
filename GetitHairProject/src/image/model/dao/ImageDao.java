package image.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import image.model.service.ImageService;
import image.model.vo.Image;

public class ImageDao {

	public Image selectOneImage(Connection conn, int imgNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from image where img_no = ?";

		Image image = null;

		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setInt(1, imgNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				image = new Image();
				image.setImgNo(rs.getInt("img_no"));
				image.setFilepath(rs.getString("filepath"));
				image.setImgType(rs.getString("img_type"));
				image.setImgTypeNo(rs.getInt("img_type_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return image;
	}

	public ArrayList<Image> selectAllImageByType(Connection conn, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from image where img_type = ?";

		ArrayList<Image> list = new ArrayList<Image>();

		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				Image image = new Image();
				image.setImgNo(rs.getInt("img_no"));
				image.setFilepath(rs.getString("filepath"));
				image.setImgType(rs.getString("img_type"));
				image.setImgTypeNo(rs.getInt("img_type_no"));
				list.add(image);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Image> selectAllImageByTypeAndTypeNo(Connection conn, String type, int typeNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from image where img_type = ? and img_type_no = ?";

		ArrayList<Image> list = new ArrayList<Image>();

		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, type);
			pstmt.setInt(2, typeNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Image image = new Image();
				image.setImgNo(rs.getInt("img_no"));
				image.setFilepath(rs.getString("filepath"));
				image.setImgType(rs.getString("img_type"));
				image.setImgTypeNo(rs.getInt("img_type_no"));
				list.add(image);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int insertImage(Connection conn, String filepath, String type, int typeNo) {
		PreparedStatement pstmt = null;
		String qryInsert = "insert into image values(image_seq.nextval,?,?,?)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(qryInsert);
			pstmt.setString(1, filepath);
			pstmt.setString(2, type);
			pstmt.setInt(3, typeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	public String selectFilepath(Connection conn, String type, int typeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select filepath from image where img_type=? and img_no=?";
		String filepath = "";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setInt(2, typeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				filepath = rset.getString("filepath");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return filepath;
	}

	public Image selectOneImageByTypeAndTypeNo(Connection conn, String type, int typeNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from image where img_type = ? and img_type_no = ?";
		Image image = null;

		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, type);
			pstmt.setInt(2, typeNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				image = new Image();
				image.setImgNo(rs.getInt("img_no"));
				image.setFilepath(rs.getString("filepath"));
				image.setImgType(rs.getString("img_type"));
				image.setImgTypeNo(rs.getInt("img_type_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}

		return image;
	}

}
