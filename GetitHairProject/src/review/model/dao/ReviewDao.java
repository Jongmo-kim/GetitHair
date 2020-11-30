package review.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.dao.CustomerDao;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import designer.model.vo.Designer;
import designer.model.dao.DesignerDao;
import designer.model.service.DesignerService;
import hairshop.model.dao.HairshopDao;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import review.model.vo.Review;
import review.model.vo.ReviewComment;
import style.model.service.StyleService;
import style.model.vo.Style;

public class ReviewDao {
	private Review getSettedReviewProperties(ResultSet rs) {
		Review rv = new Review();
		try {
			rv.setReviewNo(rs.getInt("review_no"));
			rv.setShop(new HairshopService().selectOneHairshop(rs.getInt("shop_no")));
			rv.setDesigner(new DesignerService().selectOneDesigner(rs.getInt("designer_no")));
			rv.setCustomer(new CustomerService().selectOneCustomer(rs.getInt("customer_no")));
			rv.setStyle(new StyleService().selectOneStyle(rs.getInt("style_no")));
			rv.setReviewContent(rs.getString("review_content"));
			rv.setReviewRate(rs.getInt("review_rate"));
			rv.setReviewLikes(rs.getInt("review_likes"));
			rv.setReviewDate(rs.getDate("review_date"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rv;
	}
	public ArrayList<Review> selectAllReview(Connection conn, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT * FROM (SELECT ROWNUM RN,RV.* FROM "
				+ "(SELECT * FROM review ORDER BY REVIEW_NO DESC) RV) "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(2, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public ArrayList<Review> selectAllReview(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from review";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(qrySelect);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public int selectAllReviewCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select count(*) from review";
		int count = 0;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
	public ArrayList<Review> selectAllReviewByCustomerNo(Connection conn, int customerNo, int reqPage,
			int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT * FROM (SELECT ROWNUM RN,RV.* FROM "
				+ "(SELECT RV.* FROM review RV where customer_no = ? ORDER BY RV.REVIEW_NO DESC) RV) "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Review> list = new ArrayList<Review>();;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, customerNo);
			pstmt.setInt(2, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(3, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
		ArrayList<Review> list = new ArrayList<Review>();;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, customerNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public ArrayList<Review> selectAllReviewByShopNo(Connection conn, int shopNo, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT * FROM (SELECT ROWNUM RN,RV.* FROM "
				+ "(SELECT RV.* FROM review RV where shop_no = ? ORDER BY RV.REVIEW_NO DESC) RV) "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Review> list = new ArrayList<Review>();;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, shopNo);
			pstmt.setInt(2, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(3, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public ArrayList<Review> selectAllReviewByShopNo(Connection conn, int shopNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from review where shop_no = ?";
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, shopNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public ArrayList<Review> selectAllReviewByDesignerNo(Connection conn, int designerNo, int reqPage,
			int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT * FROM (SELECT ROWNUM RN,RV.* FROM "
				+ "(SELECT RV.* FROM review RV where designer_no = ? ORDER BY RV.REVIEW_NO DESC) RV) "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Review> list = new ArrayList<Review>();;
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, designerNo);
			pstmt.setInt(2, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(3, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
		ArrayList<Review> list = new ArrayList<Review>();
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, designerNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public int insertReview(Connection conn, Review rv) {
		PreparedStatement pstmt = null;
		String qryInsert = "insert into review values(review_seq.nextval,?,?,?,?,?,?,?,sysdate)";//태민쿼리수정
		int result = 0;
		try {
			pstmt=conn.prepareStatement(qryInsert);
			pstmt.setInt(1, rv.getShop().getShopNo());
			pstmt.setInt(2, rv.getDesigner().getDesignerNo());
			pstmt.setInt(3, rv.getCustomer().getCustomerNo());
			pstmt.setInt(4, rv.getStyle().getStyleNo());
			pstmt.setString(5, rv.getReviewContent());
			pstmt.setInt(6, rv.getReviewRate());
			pstmt.setInt(7, rv.getReviewLikes());
			//pstmt.setString(8, rv.getReviewDate()); //태민쿼리수정
			
			result = pstmt.executeUpdate();
			System.out.println("dao result = "+result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int updateReview(Connection conn, Review rv) {
		PreparedStatement pstmt = null;
		String qryUpdate = "update review set review_content = ?, review_rate = ? where review_no = ?";
		int result = 0;
		try {
			pstmt=conn.prepareStatement(qryUpdate);
			pstmt.setString(1, rv.getReviewContent());
			pstmt.setInt(2, rv.getReviewRate());
			pstmt.setInt(3, rv.getReviewNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int deleteReviewByReviewNo(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		String qryUpdate = "delete from review where review_no = ?";
		int result = 0;
		try {
			pstmt=conn.prepareStatement(qryUpdate);
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int getMaxPageSize(Connection conn, int maxPrintSize) {
		PreparedStatement pstmt = null;
		String qrySelect = "select count(*) cnt from review";
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
		System.out.println(result);
		return result;
	}
	public int getMaxPageSizeByCustomerNo(Connection conn, int maxPrintSize, int customerNo) {
		PreparedStatement pstmt = null;
		String qrySelect = "select count(*) cnt from review where customer_no = ?";
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setInt(1, customerNo);
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
	public int getMaxPageSizeByShopNo(Connection conn, int maxPrintSize, int shopNo) {
		PreparedStatement pstmt = null;
		String qrySelect = "select count(*) cnt from review where shop_no = ?";
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setInt(1, shopNo);
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
		System.out.println(result);
		return result;
	}
	
	// 리뷰 넘버로 해당리뷰 조회
	public Review selectOneReview(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		Review r = null;
		String query = "select * from review where review_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = getSettedReviewProperties(rset);
//				r.setReviewImg(rset.getString("review_img"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return r;
	}
	
	// 리뷰 댓글 조회
	public ArrayList<ReviewComment> selectReviewCommentList(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from review_comment where review_ref=? order by 1";
		ArrayList<ReviewComment> list = new ArrayList<ReviewComment>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewComment rc = new ReviewComment();
				rc.setReviewCommentNo(rset.getInt("review_comment_no"));
				rc.setReviewCommentWriter(rset.getString("review_comment_writer"));
				rc.setReviewCommentContent(rset.getString("review_comment_content"));
				rc.setReviewRef(rset.getInt("review_ref"));
				rc.setReviewCommentDate(rset.getString("review_comment_date"));
				list.add(rc);
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
	
	// 리뷰 댓글 추가
	public int insertReviewComment(Connection conn, ReviewComment rc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into review_comment values (review_comment_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'))";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rc.getReviewCommentWriter());
			pstmt.setString(2, rc.getReviewCommentContent());
			pstmt.setInt(3, rc.getReviewRef());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int deleteReviewComment(Connection conn, int reviewCommentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from review_comment where review_comment_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int updateReviewComment(Connection conn, int reviewCommentNo, String reviewCommentContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update review_comment set review_comment_content=? where review_comment_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewCommentContent);
			pstmt.setInt(2, reviewCommentNo);
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
