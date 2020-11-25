package review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.vo.Review;

public class ReviewDao {
	private Review getSettedReviewProperties(ResultSet rs) {
		Review rv = new Review();
		try {
			rv.setReviewNo(rs.getInt("review_no"));
			rv.setShopNo(rs.getInt("shop_no"));
			rv.setDesignerNo(rs.getInt("designer_no"));
			rv.setCustomerNo(rs.getInt("customer_no"));
			rv.setStyleNo(rs.getInt("style_no"));
			rv.setReviewContent(rs.getString("review_content"));
			rv.setReviewRate(rs.getInt("review_rate"));
			rv.setReviewLikes(rs.getInt("review_likes"));
			rv.setReviewDate(rs.getString("review_date"));
			rv.setReviewImg(rs.getString("review_img"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rv;
	}
	public ArrayList<Review> selectAllReview(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from review";
		ArrayList<Review> list = null;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(list == null) {
					list = new ArrayList<Review>();
				}
				Review rv = getSettedReviewProperties(rs);
				list.add(rv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public ArrayList<Review> selectAllReviewByCustomerNo(Connection conn, int customerNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from review where customer_no = ?";
		ArrayList<Review> list = null;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, customerNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(list == null) {
					list = new ArrayList<Review>();
				}
				Review rv = getSettedReviewProperties(rs);
				list.add(rv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public int selectCustomerNoById(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select customer_no from customer where customer_id = ?";
		int custNo=0;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				custNo = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return custNo;
	}
	public ArrayList<Review> selectAllReviewByShopNo(Connection conn, int shopNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from review where shop_no = ?";
		ArrayList<Review> list = null;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, shopNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(list == null) {
					list = new ArrayList<Review>();
				}
				Review rv = getSettedReviewProperties(rs);
				list.add(rv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public ArrayList<Review> selectAllReviewByDesignerNo(Connection conn, int designerNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from review where designer_no = ?";
		ArrayList<Review> list = null;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, designerNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(list == null) {
					list = new ArrayList<Review>();
				}
				Review rv = getSettedReviewProperties(rs);
				list.add(rv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	
}