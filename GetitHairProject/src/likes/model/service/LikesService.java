package likes.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import likes.model.dao.LikesDao;
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
}
