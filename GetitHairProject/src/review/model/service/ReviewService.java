package review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.dao.ReviewDao;
import review.model.vo.Review;

public class ReviewService {
	//INSERT 구문
	public int insertReview(Review rv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReview(conn,rv);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
	
	
	
	//SELECT 구문
	public ArrayList<Review> selectAllReview(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReview(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Review> selectAllReviewById(String keyword){
		Connection conn = JDBCTemplate.getConnection();
		int customerNo = new ReviewDao().selectCustomerNoById(conn,keyword);
		ArrayList<Review> list = new ReviewDao().selectAllReviewByCustomerNo(conn,customerNo);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Review> selectAllReviewByShopNo(int shopNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByShopNo(conn,shopNo);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Review> selectAllReviewByDesignerNo(int designerNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByDesignerNo(conn,designerNo);
		JDBCTemplate.close(conn);
		return list;
	}
	
	//UPDATE 구문
	
	//리뷰 수정을 위해  내용,평점이 수정되어있는 Review 객체를 전달받는다.
	public int updateReview(Review rv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().updateReview(conn,rv);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
	
	//DELETE 구문
}
