package image.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import image.model.service.ImageService;
import image.model.vo.Image;
import image.model.vo.ImageList;

public class ImageDao {

	public Image selectOneImage(Connection conn, int imageNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from image where img_no = ?";

		Image image = null;

		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setInt(1, imageNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				image = new Image();
				image.setImageNo(rs.getInt(1));
				image.setImageFileName(rs.getString(2));
				image.setImageFilePath(rs.getString(3));
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

	public ArrayList<ImageList> selectAllImageListByType(Connection conn, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from image_list where img_type = ?";

		ArrayList<ImageList> list = new ArrayList<ImageList>();

		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ImageList il = new ImageList();
				il.setImageListNo(rs.getInt("img_list_no"));
				il.setImage(new ImageService().selectOneImage(rs.getInt("img_no")));
				il.setImageType(rs.getString("img_type"));
				il.setImageTypeNo(rs.getInt("img_type"));
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

	public ArrayList<ImageList> selectAllImageListByTypeAndTypeNo(Connection conn, String type, int typeNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from image_list where img_type = ? and img_type_no = ?";

		ArrayList<ImageList> list = new ArrayList<ImageList>();

		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, type);
			pstmt.setInt(2, typeNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ImageList il = new ImageList();
				il.setImageListNo(rs.getInt("img_list_no"));
				il.setImage(new ImageService().selectOneImage(rs.getInt("img_no")));
				il.setImageType(rs.getString("img_type"));
				il.setImageTypeNo(rs.getInt("img_type"));
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

	public int insertImage(Connection conn, String filename, String filepath) {
		PreparedStatement pstmt = null;
		String qryInsert = "insert into image values(image_seq.nextval,?,?)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(qryInsert);
			pstmt.setString(1, filename);
			pstmt.setString(2, filepath);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	public int insertImageList(Connection conn, String type, int typeNo) {
		PreparedStatement pstmt = null;
		String qryInsert = "insert into image_list values(image_list_seq.nextval,image_seq.currval,?,?)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(qryInsert);
			pstmt.setString(1, type);
			pstmt.setInt(2, typeNo);
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
