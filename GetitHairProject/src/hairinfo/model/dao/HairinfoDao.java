package hairinfo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import hairinfo.model.vo.Hairinfo;

public class HairinfoDao {
	
	public Hairinfo selectOneHairinfo(Connection conn, int customerNo) {
		PreparedStatement pstmt =null ;
		ResultSet rset =null;
		Hairinfo loginHairinfo = null;
		String query = "select * from hair_info where customer_no=?";		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, customerNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginHairinfo = new Hairinfo();
				loginHairinfo.setCustomerNo(rset.getInt("customer_no"));
				loginHairinfo.setMyhairBold(rset.getString("myhair_bold"));
				loginHairinfo.setMyhairCurly(rset.getString("myhair_bold"));
				loginHairinfo.setMyhairOld(rset.getString("myhair_old"));
				loginHairinfo.setMyhairRich(rset.getString("myhair_rich"));
				loginHairinfo.setMyhairScalp(rset.getString("myhair_scalp"));
				loginHairinfo.setMyhairStatus(rset.getString("myhair_status"));
				loginHairinfo.setMyhairVol(rset.getString("myhair_vol"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return loginHairinfo;
		
	}
	public ArrayList<Hairinfo> selectAllHairinfo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Hairinfo> list = new ArrayList<Hairinfo>();
		String query = "select * from hair_info";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Hairinfo hair = new Hairinfo();
				hair.setCustomerNo(rset.getInt("customer_no"));
				hair.setMyhairBold(rset.getString("myhair_bold"));
				hair.setMyhairCurly(rset.getString("myhair_curly"));
				hair.setMyhairOld(rset.getString("myhair_old"));
				hair.setMyhairRich(rset.getString("myhair_rich"));
				hair.setMyhairScalp(rset.getString("myhair_scalp"));
				hair.setMyhairStatus(rset.getString("myhair_status"));
				hair.setMyhairVol(rset.getString("myhair_vol"));				
				list.add(hair);				
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
	
	public int updateHairinfo(Connection conn, Hairinfo hairinfo) {
		PreparedStatement pstmt =  null;
		int result = 0;
		String query = "update hair_info set myhair_scalp=?,myhair_curly=?,myhair_rich=?,myhair_bold=?,myhair_vol=?,myhair_status=?,myhair_old=? where customer_no=?";		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hairinfo.getMyhairScalp());
			pstmt.setString(2, hairinfo.getMyhairCurly());
			pstmt.setString(3, hairinfo.getMyhairRich());
			pstmt.setString(4, hairinfo.getMyhairBold());
			pstmt.setString(5, hairinfo.getMyhairVol());
			pstmt.setString(6, hairinfo.getMyhairStatus());
			pstmt.setString(7, hairinfo.getMyhairOld());
			pstmt.setInt(8, hairinfo.getCustomerNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}		
		return result;
	}	

	public int deleteHairinfo(Connection conn, int customerNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from hair_info where customer_no = ?";		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, customerNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}		
		return result;
	}
	public int insertHairinfo(Connection conn, Hairinfo hairinfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into customer values(customer_seq.currval,?,?,?,?,?,?,?)";		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hairinfo.getMyhairScalp());
			pstmt.setString(2, hairinfo.getMyhairCurly());
			pstmt.setString(3, hairinfo.getMyhairRich());
			pstmt.setString(4, hairinfo.getMyhairBold());
			pstmt.setString(5, hairinfo.getMyhairVol());
			pstmt.setString(6, hairinfo.getMyhairStatus());
			pstmt.setString(7, hairinfo.getMyhairOld());
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
