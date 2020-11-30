package hairshop.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import hairshop.model.vo.Hairshop;

public class HairshopDao {

	public ArrayList<Hairshop> selectHairshop(Connection conn) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		String query = "select shop_no,shop_name,shop_addr,shop_open,shop_close,shop_rate,shop_likes from hairshop";
		ArrayList<Hairshop> list = new ArrayList<Hairshop>();
		try {
			ps = conn.prepareStatement(query);
			rset = ps.executeQuery();
			while(rset.next()) {
				Hairshop h = new Hairshop();
				h.setShopNo(rset.getInt("shop_no"));
				h.setShopName(rset.getString("shop_name"));
				h.setShopAddr(rset.getString("shop_addr"));
				h.setShopOpen(rset.getString("shop_open"));
				h.setShopClose(rset.getString("shop_close"));
				h.setShopRate(rset.getInt("shop_rate"));
				h.setShopLikes(rset.getInt("shop_likes"));
				list.add(h);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return list;
	}

	public Hairshop selectOneHairshop(Connection conn,int shopNo) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		String query = "select * from hairshop where shop_no=?";
		Hairshop hs = null;
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, shopNo);
			rset = ps.executeQuery();
			if(rset.next()) {
				hs = new Hairshop();
				hs.setShopNo(rset.getInt("shop_no"));
				hs.setShopId(rset.getString("shop_id"));
				hs.setShopPw(rset.getString("shop_pw"));
				hs.setShopCompNo(rset.getString("shop_comp_no"));
				hs.setShopName(rset.getString("shop_name"));
				hs.setShopAddr(rset.getString("shop_addr"));
				hs.setShopPhone(rset.getString("shop_phone"));
				hs.setShopOpen(rset.getString("shop_open"));
				hs.setShopClose(rset.getString("shop_close"));
				hs.setShopHoliday(rset.getString("shop_holiday"));
				hs.setShopRate(rset.getInt("shop_rate"));
				hs.setShopLikes(rset.getInt("shop_likes"));
				hs.setAddrDetail(rset.getString("addr_detail"));
				hs.setAddrPostcode(rset.getString("addr_postcode"));
				hs.setEnrollDate(rset.getDate("shop_enrolldate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return hs;
	}

	public Hairshop selectShop(Connection conn, int result) {//진현
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Hairshop> searchHairshop(Connection conn, String searchShop) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		String query = "select shop_no,shop_name,shop_addr,shop_open,shop_close,shop_rate,shop_likes from hairshop where shop_name like (?)";
		ArrayList<Hairshop> list = new ArrayList<Hairshop>();
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, '%'+searchShop+'%');
			rset = ps.executeQuery();
			while(rset.next()) {
				Hairshop h = new Hairshop();
				h.setShopNo(rset.getInt("shop_no"));
				h.setShopCompNo(rset.getString("shop_comp_no"));
				h.setShopName(rset.getString("shop_name"));
				h.setShopAddr(rset.getString("shop_addr"));
				h.setShopOpen(rset.getString("shop_open"));
				h.setShopClose(rset.getString("shop_close"));
				h.setShopRate(rset.getInt("shop_rate"));
				h.setShopLikes(rset.getInt("shop_likes"));
				list.add(h);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return list;
	}
	public ArrayList<Hairshop> searchPlace(Connection conn, String searchShop) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		String query = "select shop_no,shop_name,shop_addr,shop_open,shop_close,shop_rate,shop_likes from hairshop where shop_addr like (?)";
		ArrayList<Hairshop> list = new ArrayList<Hairshop>();
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, '%'+searchShop+'%');
			rset = ps.executeQuery();
			while(rset.next()) {
				Hairshop h = new Hairshop();
				h.setShopNo(rset.getInt("shop_no"));
				h.setShopName(rset.getString("shop_name"));
				h.setShopAddr(rset.getString("shop_addr"));
				h.setShopOpen(rset.getString("shop_open"));
				h.setShopClose(rset.getString("shop_close"));
				h.setShopRate(rset.getInt("shop_rate"));
				h.setShopLikes(rset.getInt("shop_likes"));
				list.add(h);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return list;
	}

	public ArrayList<Hairshop> hairshopMore(Connection conn, int start, int end) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		ArrayList<Hairshop> list = new ArrayList<Hairshop>();
		String query = "select * from (select rownum as rnum,h.* from (select shop_no,shop_name,shop_addr,shop_open,shop_close,shop_rate,shop_likes from hairshop order by 1)h) where rnum between ? and ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rset = ps.executeQuery();
			while(rset.next()) {
				Hairshop h = new Hairshop();
				h.setShopNo(rset.getInt("shop_no"));
				h.setShopName(rset.getString("shop_name"));
				h.setShopAddr(rset.getString("shop_addr"));
				h.setShopOpen(rset.getString("shop_open"));
				h.setShopClose(rset.getString("shop_close"));
				h.setShopRate(rset.getInt("shop_rate"));
				h.setShopLikes(rset.getInt("shop_likes"));
				list.add(h);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return list;
	}

	public int totalCount(Connection conn) {
		PreparedStatement ps = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) cnt from hairshop";
		try {
			ps = conn.prepareStatement(query);
			rset = ps.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(ps);
		}
		return totalCount;
	}

	public Hairshop selectOneHairshop(Connection conn, String inputId, String inputPw) {
		PreparedStatement pstmt = null;
		String sql = "select shop_no,shop_name,shop_addr,shop_open,shop_close,shop_rate,shop_likes from hairshop where inputId = ? and inputPw = ?";
		Hairshop h = new Hairshop();
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputPw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				h.setShopNo(rset.getInt("shop_no"));
				h.setShopName(rset.getString("shop_name"));
				h.setShopAddr(rset.getString("shop_addr"));
				h.setShopOpen(rset.getString("shop_open"));
				h.setShopClose(rset.getString("shop_close"));
				h.setShopRate(rset.getInt("shop_rate"));
				h.setShopLikes(rset.getInt("shop_likes"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return h;
	}

}
