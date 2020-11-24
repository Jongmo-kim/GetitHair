package admin.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.mypage.model.vo.AdminCustomer;
import common.JDBCTemplate;

public class AdminDao {
	
	public ArrayList<AdminCustomer> getCustomerList(Connection conn,int page){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select customer_no,customer_id,customer_gen,customer_name,to_char(customer_enrolldate,'yyyy-mm-dd') from customer";
		ArrayList<AdminCustomer> list = null;
		
		try {
			pstmt = conn.prepareStatement(qrySelect);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<AdminCustomer>();
				
				AdminCustomer ac = new AdminCustomer();
				ac.setNo(rs.getInt(1));
				ac.setCustId(rs.getString(2));
				ac.setCustGender(rs.getString(3));
				ac.setCustName(rs.getString(4));
				ac.setEnrollDate(rs.getString(5));
				list.add(ac);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	}

	public ArrayList<AdminCustomer> getCustomerListById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select customer_no,customer_id,customer_gen,customer_name,to_char(customer_enrolldate,'yyyy-mm-dd') from customer where customer_id = ?";
		ArrayList<AdminCustomer> list = null;
		
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<AdminCustomer>();
				
				AdminCustomer ac = new AdminCustomer();
				ac.setNo(rs.getInt(1));
				ac.setCustId(rs.getString(2));
				ac.setCustGender(rs.getString(3));
				ac.setCustName(rs.getString(4));
				ac.setEnrollDate(rs.getString(5));
				list.add(ac);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public ArrayList<AdminCustomer> getCustomerListByName(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select customer_no,customer_id,customer_gen,customer_name,to_char(customer_enrolldate,'yyyy-mm-dd') from customer where customer_name = ?";
		ArrayList<AdminCustomer> list = null;
		
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<AdminCustomer>();
				
				AdminCustomer ac = new AdminCustomer();
				ac.setNo(rs.getInt(1));
				ac.setCustId(rs.getString(2));
				ac.setCustGender(rs.getString(3));
				ac.setCustName(rs.getString(4));
				ac.setEnrollDate(rs.getString(5));
				list.add(ac);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}
