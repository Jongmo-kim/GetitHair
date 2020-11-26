package hairinfo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
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
				loginHairinfo = getHairinfoFromRset(rset);								
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
				Hairinfo hair = getHairinfoFromRset(rset);				
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
			pstmt.setInt(8, hairinfo.getCustomer().getCustomerNo());
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
	private Hairinfo getHairinfoFromRset(ResultSet rset) {
		Hairinfo hairinfo = new Hairinfo();		
		try {
			hairinfo.setCustomer(getCustomerByNo(rset.getInt("customer_no")));
			hairinfo.setMyhairScalp(rset.getString("myhair_scalp"));
			hairinfo.setMyhairCurly(rset.getString("myhair_curly"));
			hairinfo.setMyhairRich(rset.getString("myhair_rich"));
			hairinfo.setMyhairBold(rset.getString("myhair_bold"));
			hairinfo.setMyhairVol(rset.getString("myhair_vol"));
			hairinfo.setMyhairStatus(rset.getString("myhair_status"));
			hairinfo.setMyhairOld(rset.getString("myhair_old"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hairinfo;
	}
	private Customer getCustomerByNo(int no) {
		Customer cust = new CustomerService().selectOneCustomer(no);
		if(cust == null) {
			cust =  new Customer();
			cust.setCustomerNo(-1);
		}
		return cust;
	}

}
