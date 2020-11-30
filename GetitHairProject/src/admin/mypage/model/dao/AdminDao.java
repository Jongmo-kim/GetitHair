package admin.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.model.vo.Admin;
import common.JDBCTemplate;
import customer.model.vo.Customer;

public class AdminDao {

	public Admin selecOneAdmin(Connection conn,String id,String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String qrySelect = "select * from admin where admin_id = ? and admin_pw = ?";
		Admin admin = null;
		
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				admin = new Admin();
				admin.setAdminNo(rs.getInt("admin_no"));
				admin.setAdminId(rs.getString("admin_id"));
				admin.setAdminPw(rs.getString("admin_pw"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		
		return admin;
	}
	public ArrayList<Customer> getCustomerListById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from customer where customer_id like ?";
		ArrayList<Customer> list = null;
		
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, id+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<Customer>();
				
				Customer cust = new Customer();
				cust.setAddrDetail(rs.getString("addr_detail"));
				cust.setAddrPostcode(rs.getString("addr_postcode"));
				cust.setCustomerAddr(rs.getString("customer_addr"));
				cust.setCustomerEmail(rs.getString("customer_email"));
				cust.setCustomerGen(rs.getString("customer_gen"));
				cust.setCustomerId(rs.getString("customer_id"));
				cust.setCustomerName(rs.getString("customer_name"));
				cust.setCustomerNo(rs.getInt("customer_no"));
				cust.setCustomerPhone(rs.getString("customer_phone"));
				cust.setCustomerPw(rs.getString("customer_pw"));
				cust.setCustomerBirthdate(rs.getDate("customer_birthdate"));
				cust.setCustomerEnrolldate(rs.getDate("customer_enrolldate"));
				list.add(cust);
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

	public ArrayList<Customer> getCustomerListByName(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "select * from customer where customer_name like ?";
		ArrayList<Customer> list = null;
		
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, keyword+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<Customer>();
				
				Customer cust = new Customer();
				cust.setAddrDetail(rs.getString("addr_detail"));
				cust.setAddrPostcode(rs.getString("addr_postcode"));
				cust.setCustomerAddr(rs.getString("customer_addr"));
				cust.setCustomerEmail(rs.getString("customer_email"));
				cust.setCustomerGen(rs.getString("customer_gen"));
				cust.setCustomerId(rs.getString("customer_id"));
				cust.setCustomerName(rs.getString("customer_name"));
				cust.setCustomerNo(rs.getInt("customer_no"));
				cust.setCustomerPhone(rs.getString("customer_phone"));
				cust.setCustomerPw(rs.getString("customer_pw"));
				cust.setCustomerBirthdate(rs.getDate("customer_birthdate"));
				cust.setCustomerEnrolldate(rs.getDate("customer_enrolldate"));
				list.add(cust);
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
