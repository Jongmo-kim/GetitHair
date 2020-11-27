package likes.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import likes.model.vo.Likes;
import likes.model.vo.LikesType;
import reserve.model.vo.Reserve;


public class LikesDao {

	public Likes selectOneLikes(Connection conn, int customerNo) {
		PreparedStatement pstmt  = null;
		ResultSet rset = null;
		String query = "select * from likes where customer_no=?";
		Likes likes = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, customerNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				likes = getLikesFromRset(rset);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return likes;
	}

	private Likes getLikesFromRset(ResultSet rset) {
		Likes likes = new Likes();
		try {
			likes.setLikesNo(rset.getInt("like_no"));
			likes.setCustomer(getCustomerByNo(rset.getInt("customer_no")));			
			char likesType = rset.getString("like_type").charAt(0);
			int likeTypeNo = rset.getInt("like_type_no");
			LikesType type = new LikesType(likeTypeNo,likesType);
			likes.setLikesType(type);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return likes;
	}	

	private Customer getCustomerByNo(int no) {
		Customer customer = new CustomerService().selectOneCustomer(no);
		if(customer == null) {
			customer = new Customer();
			customer.setCustomerNo(-1);
		}
		return customer;
	}

	public ArrayList<Likes> selectAllLikes(Connection conn) {
		ArrayList<Likes> list = new ArrayList<Likes>();
		String query = "select * from likes";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Likes likes  = getLikesFromRset(rset);
				list.add(likes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Likes> selectAllLikesByCustomer(Connection conn, int customerNo) {
		ArrayList<Likes> list = new ArrayList<Likes>();
		String query = "select * from likes where customer_no=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, customerNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Likes likes  = getLikesFromRset(rset);
				list.add(likes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<Likes> selectAllLikesByTypeAndNo(Connection conn, String type, int typeNo) {
		ArrayList<Likes> list = new ArrayList<Likes>();
		String query = "select * from likes where like_type=? and like_type_no=?";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setInt(2, typeNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Likes likes  = getLikesFromRset(rset);
				list.add(likes);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int insertLikes(Connection conn, Likes likes) {
		PreparedStatement pstmt = null;
		String query = "insert into likes values(likes_seq.nextval,?,?,?)";
		int result =0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, likes.getCustomer().getCustomerNo());
			pstmt.setString(2, Character.toString(likes.getLikesType().getLikesType()));
			pstmt.setInt(3, likes.getLikesType().getLikesTypeNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteLikes(Connection conn, int likeNo) {
		PreparedStatement pstmt = null;
		String query = "delete from likes where like_no=?";
		int result =0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, likes.getCustomer().getCustomerNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	

	
	
}
