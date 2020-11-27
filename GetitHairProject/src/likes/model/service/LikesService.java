package likes.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import likes.model.dao.LikesDao;
import likes.model.vo.LikesPageData;
import likes.model.vo.Likes;


public class LikesService {
	public Likes selectOneLikes(int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		Likes likes = new LikesDao().selectOneLikes(conn,customerNo);
		JDBCTemplate.close(conn);
		return likes;
	}
	public ArrayList<Likes> selectAllLikes() {
		ArrayList<Likes> list = null;
		Connection conn = JDBCTemplate.getConnection();
		list = new LikesDao().selectAllLikes(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Likes> selectAllLikesByCustomer(int customerNo) {
		ArrayList<Likes> list = null;
		Connection conn = JDBCTemplate.getConnection();
		list = new LikesDao().selectAllLikesByCustomer(conn,customerNo);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Likes> selectAllLikesByTypeAndNo(String type,int typeNo) {
		ArrayList<Likes> list = null;
		Connection conn = JDBCTemplate.getConnection();
		list = new LikesDao().selectAllLikesByTypeAndNo(conn,type,typeNo);
		JDBCTemplate.close(conn);
		return list;
	}
	public int insertLikes(Likes likes) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new LikesDao().insertLikes(conn,likes);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteLikes(int likeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new LikesDao().deleteLikes(conn,likeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateLikes(Likes likes) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new LikesDao().updateLikes(conn,likes);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public LikesPageData LikesSelectListByCustomer(int reqPage,int customerNo){
		Connection conn = JDBCTemplate.getConnection();
		LikesDao dao = new LikesDao();
		int totalCount = dao.getTotalCount(conn,customerNo);
		int numPerPage = 10;
		int totalPage = totalCount % numPerPage == 0 ? totalCount / numPerPage : totalCount / numPerPage + 1;
		// reqPage = 1 -> start : 1, end : 10
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		ArrayList<Likes> list = dao.likeSelectListByCustomer(conn, start, end,customerNo);

		// 페이지 네비게이션 작성 시작
		int pageNaviSize = 5;
		String pageNavi = "";
		// 페이지네비 시작번호 구하기
		// reqPage : 1~5 -> 1
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		// 이전버튼 : 페이지 시작번호가 1이 아닌경우에만 이전버튼 생성
		if (pageNo != 1) {
			pageNavi += "<a href='/selectAllLikesList?customerNo="+customerNo+"&reqPage=" + (pageNo - 1) + "'>이전</a>";
		}				
		for (int i = 0; i < pageNaviSize; ++i) {
			if (reqPage == pageNo) {
				// 현재페이지
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/selectAllLikesList?customerNo="+customerNo+"&reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			++pageNo;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/selectAllLikesList?customerNo="+customerNo+"&reqPage=" + pageNo + "'>다음</a>";
		}		
		LikesPageData lpd= new LikesPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return lpd;
	}
	
}
