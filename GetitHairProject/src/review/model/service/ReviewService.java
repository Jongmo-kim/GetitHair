package review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import review.model.dao.ReviewDao;
import review.model.vo.Review;
import review.model.vo.ReviewComment;
import review.model.vo.ReviewViewData;

public class ReviewService {
	// INSERT 구문
	public int insertReview(Review rv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReview(conn, rv);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// Paging 기능관련
	// reqPage, maxSize : 표시될 최대 페이지, pageSize : 총 페이지 
	//페이지에 표시해야 할 시작번호와 끝번호를 반환 해줌.
	public int[] getPageStartEnd(int reqPage, int maxSize,int pageSize) {
	    int pageStart = 1; //표시되는 시작 페이지
	    int pageEnd = 1; // 표시되는 마지막 페이지
	    for(int i = 1;i<=pageSize/maxSize + (pageSize%maxSize != 0 ? 1 : 0);i++){
	        if(i*maxSize>=reqPage){
	            pageStart = i*maxSize - (maxSize-1);
	            pageEnd = i*maxSize < pageSize ? i*maxSize : pageSize;
	            break;
	        }
	    }
	    return new int[] {pageStart,pageEnd};
	}
	// 총 페이지 개수를 반환 해주는 메서드
	// ex) 검색된 리스트가 105개 이고 한 페이지에 출력할 리스트 개수(maxPrintSize)가 10개라면
	// 105/10 = 10 이고 나머지가 존재하므로 11로 계산하여 반환 해줌.
	public int getAllReviewMaxPageSize(int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().getMaxPageSize(conn, maxPrintSize);
		JDBCTemplate.close(conn);
		return result;
	}
	public int getAllReviewByCustomerNoMaxPageSize(int maxPrintSize,int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().getMaxPageSizeByCustomerNo(conn, maxPrintSize,customerNo);
		JDBCTemplate.close(conn);
		return result;
	}

	// 모든 리뷰의 리스트를 페이징 하여 가져옴.
	public ArrayList<Review> selectAllReview(int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReview(conn, reqPage, maxPrintSize);
		JDBCTemplate.close(conn);
		return list;
	}

	// 회원 ID에 해당하는 모든 리뷰의 리스트를 페이징 하여 가져옴.
	public ArrayList<Review> selectAllReviewById(String keyword,int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		// customer 번호를 가져오는 메서드
		int customerNo = new ReviewDao().selectCustomerNoById(conn, keyword);

		ArrayList<Review> list = new ReviewDao().selectAllReviewByCustomerNo(conn, customerNo,reqPage,maxPrintSize);
		JDBCTemplate.close(conn);
		return list;
	}

	// 회원 번호에 해당하는 모든 리뷰의 리스트를 페이징 하여 가져옴.
	public ArrayList<Review> selectAllReviewByCustomerNo(int customerNo,int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByCustomerNo(conn, customerNo,reqPage,maxPrintSize);
		JDBCTemplate.close(conn);
		return list;
	}

	// 헤어샵 번호에 해당하는 모든 리뷰의 리스트를 페이징 하여 가져옴.
	public ArrayList<Review> selectAllReviewByShopNo(int shopNo,int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByShopNo(conn, shopNo,reqPage,maxPrintSize);
		JDBCTemplate.close(conn);
		return list;
	}

	// 디자이너 번호에 해당하는 모든 리뷰의 리스트를 페이징 하여 가져옴.
	public ArrayList<Review> selectAllReviewByDesignerNo(int designerNo,int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByDesignerNo(conn, designerNo,reqPage,maxPrintSize);
		JDBCTemplate.close(conn);
		return list;
	}

	// SELECT 구문

	// 모든 리뷰의 리스트를 가져옴.
	public ArrayList<Review> selectAllReview() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReview(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	// 회원 ID에 해당하는 모든 리뷰의 리스트를 가져옴.
	public ArrayList<Review> selectAllReviewById(String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		// customer 번호를 가져오는 메서드
		int customerNo = new ReviewDao().selectCustomerNoById(conn, keyword);

		ArrayList<Review> list = new ReviewDao().selectAllReviewByCustomerNo(conn, customerNo);
		JDBCTemplate.close(conn);
		return list;
	}

	// 회원 번호에 해당하는 모든 리뷰의 리스트를 가져옴.
	public ArrayList<Review> selectAllReviewByCustomerNo(int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByCustomerNo(conn, customerNo);
		JDBCTemplate.close(conn);
		return list;
	}

	// 헤어샵 번호에 해당하는 모든 리뷰의 리스트를 가져옴.
	public ArrayList<Review> selectAllReviewByShopNo(int shopNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByShopNo(conn, shopNo);
		JDBCTemplate.close(conn);
		return list;
	}

	// 디자이너 번호에 해당하는 모든 리뷰의 리스트를 가져옴.
	public ArrayList<Review> selectAllReviewByDesignerNo(int designerNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Review> list = new ReviewDao().selectAllReviewByDesignerNo(conn, designerNo);
		JDBCTemplate.close(conn);
		return list;
	}

	// UPDATE 구문
	// 리뷰 수정을 위해 내용,평점이 수정되어있는 Review 객체를 전달받는다.
	public int updateReview(Review rv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().updateReview(conn, rv);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// DELETE 구문
	// 리뷰 번호에 해당하는 리뷰 삭제.
	public int deleteReviewByReviewNo(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().deleteReviewByReviewNo(conn, reviewNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	// 아래부터 박은영 코드
	// 리뷰 번호로 해당리뷰 조회
	public ReviewViewData selectReviewView(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		Review r = new ReviewDao().selectOneReview(conn,reviewNo);
		ArrayList<ReviewComment> list = new ReviewDao().selectReviewCommentList(conn, reviewNo);
		JDBCTemplate.close(conn);
		ReviewViewData rvd = new ReviewViewData(r, list);
		return rvd;
	}
	
	// 리뷰댓글 추가 메소드
	public int insertReviewComment(ReviewComment rc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReviewComment(conn,rc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteReviewComment(int reviewCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().deleteReviewComment(conn, reviewCommentNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateReviewComment(int reviewCommentNo, String reviewCommentContent) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().updateReviewComment(conn, reviewCommentNo, reviewCommentContent);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
