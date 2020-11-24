package review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.dao.ReviewDao;
import review.model.vo.Review;

public class ReviewService {
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
}
