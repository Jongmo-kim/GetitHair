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
	public Object[] getCustomerListById(Connection conn, String keyword, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT R.*,(SELECT COUNT(*) FROM (SELECT D.* FROM customer D WHERE customer_id LIKE ? ORDER BY D.customer_NO DESC) D) as cnt FROM (SELECT ROWNUM RN,D.* FROM "
				+ "(SELECT D.* FROM customer D WHERE customer_id LIKE ? ORDER BY D.customer_NO DESC) D) R "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Customer> list = null;
		int cnt =0;
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, keyword+"%");
			pstmt.setString(2, keyword+"%");
			pstmt.setInt(3, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(4, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<Customer>();
				cnt = rs.getInt("cnt");
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
		return new Object[] {cnt,list};
	}

	public Object[] getCustomerListByName(Connection conn, String keyword, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT R.*,(SELECT COUNT(*) FROM (SELECT D.* FROM customer D WHERE customer_name LIKE ? ORDER BY D.customer_NO DESC) D) as cnt FROM (SELECT ROWNUM RN,D.* FROM "
				+ "(SELECT D.* FROM customer D WHERE customer_name LIKE ? ORDER BY D.customer_NO DESC) D) R "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Customer> list = null;
		int cnt =0;
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setString(1, keyword+"%");
			pstmt.setString(2, keyword+"%");
			pstmt.setInt(3, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(4, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<Customer>();
				cnt = rs.getInt("cnt");
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
		return new Object[] {cnt,list};
	}
}
