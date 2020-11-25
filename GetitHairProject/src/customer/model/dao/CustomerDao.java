package customer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.vo.Customer;


public class CustomerDao {	

	public Customer selectOneCustomer(Connection conn, String customerId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Customer loginCustomer = null;
		String query = "select * from customer where customer_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, customerId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginCustomer = new Customer();
				loginCustomer.setAddrDetail(rset.getString("addr_detail"));
				loginCustomer.setAddrPostcode(rset.getString("addr_postcode"));
				loginCustomer.setCustomerAddr(rset.getString("customer_addr"));
				loginCustomer.setCustomerEmail(rset.getString("customer_email"));
				loginCustomer.setCustomerGen(rset.getString("customer_gen"));
				loginCustomer.setCustomerId(rset.getString("customer_id"));
				loginCustomer.setCustomerName(rset.getString("customer_name"));
				loginCustomer.setCustomerNo(rset.getInt("customer_no"));
				loginCustomer.setCustomerPhone(rset.getString("customer_phone"));
				loginCustomer.setCustomerPw(rset.getString("customer_pw"));
				loginCustomer.setCustomerBirthdate(rset.getString("customer_birthdate"));
				loginCustomer.setCustomerEnrolldate(rset.getString("customer_enrolldate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return loginCustomer;
	}


	public Customer selectOneCustomer(Connection conn, int customerNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Customer loginCustomer = null;
		String query = "select * from customer where customer_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, customerNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginCustomer = new Customer();
				loginCustomer.setAddrDetail(rset.getString("addr_detail"));
				loginCustomer.setAddrPostcode(rset.getString("addr_postcode"));
				loginCustomer.setCustomerAddr(rset.getString("customer_addr"));
				loginCustomer.setCustomerEmail(rset.getString("customer_email"));
				loginCustomer.setCustomerGen(rset.getString("customer_gen"));
				loginCustomer.setCustomerId(rset.getString("customer_id"));
				loginCustomer.setCustomerName(rset.getString("customer_name"));
				loginCustomer.setCustomerNo(rset.getInt("customer_no"));
				loginCustomer.setCustomerPhone(rset.getString("customer_phone"));
				loginCustomer.setCustomerPw(rset.getString("customer_pw"));
				loginCustomer.setCustomerBirthdate(rset.getString("customer_birthdate"));
				loginCustomer.setCustomerEnrolldate(rset.getString("customer_enrolldate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return loginCustomer;
	}
	public ArrayList<Customer> selectAllCustomer(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Customer> list = new ArrayList<Customer>();
		String query = "select * from customer";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Customer cust = new Customer();
				cust.setAddrDetail(rset.getString("addr_detail"));
				cust.setAddrPostcode(rset.getString("addr_postcode"));
				cust.setCustomerAddr(rset.getString("customer_addr"));
				cust.setCustomerEmail(rset.getString("customer_email"));
				cust.setCustomerGen(rset.getString("customer_gen"));
				cust.setCustomerId(rset.getString("customer_id"));
				cust.setCustomerName(rset.getString("customer_name"));
				cust.setCustomerNo(rset.getInt("customer_no"));
				cust.setCustomerPhone(rset.getString("customer_phone"));
				cust.setCustomerPw(rset.getString("customer_pw"));
				cust.setCustomerBirthdate(rset.getString("customer_birthdate"));
				cust.setCustomerEnrolldate(rset.getString("customer_enrolldate"));
				list.add(cust);				
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


	public int updateCustomer(Connection conn, Customer customer) {

		PreparedStatement pstmt =null;
		int result =0;
		String query ="update customer set customer_pw=?,customer_email=?,customer_addr=?,addr_detail=?,customer_phone=? where customer_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, customer.getCustomerPw());
			pstmt.setString(2, customer.getCustomerEmail());
			pstmt.setString(3, customer.getCustomerAddr());
			pstmt.setString(4, customer.getAddrDetail());
			pstmt.setString(5, customer.getCustomerPhone());
			pstmt.setInt(6, customer.getCustomerNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteCustomer(Connection conn, String customerId) {
		PreparedStatement pstmt =null;
		int result =0;
		String query ="delete from customer where customer_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, customerId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertCustomer(Connection conn, Customer customer) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = "insert into customer values(customer_seq.nextval,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, customer.getCustomerId());
			pstmt.setString(2, customer.getCustomerPw());
			pstmt.setString(3, customer.getCustomerGen());
			pstmt.setString(4, customer.getCustomerName());
			pstmt.setString(5, customer.getCustomerEmail());
			pstmt.setString(6, customer.getCustomerAddr());
			pstmt.setString(7, customer.getCustomerPhone());
			pstmt.setString(8, customer.getAddrDetail());
			pstmt.setString(9, customer.getAddrPostcode());
			pstmt.setString(10, customer.getCustomerBirthdate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	public Customer selectOneCustomer(Connection conn, String customerId, String customerPw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Customer loginCustomer = null;
		String query = "select * from customer where customer_id=? and customer_pw=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, customerId);
			pstmt.setString(2, customerPw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginCustomer = new Customer();
				loginCustomer.setAddrDetail(rset.getString("addr_detail"));
				loginCustomer.setAddrPostcode(rset.getString("addr_postcode"));
				loginCustomer.setCustomerAddr(rset.getString("customer_addr"));
				loginCustomer.setCustomerEmail(rset.getString("customer_email"));
				loginCustomer.setCustomerGen(rset.getString("customer_gen"));
				loginCustomer.setCustomerId(rset.getString("customer_id"));
				loginCustomer.setCustomerName(rset.getString("customer_name"));
				loginCustomer.setCustomerNo(rset.getInt("customer_no"));
				loginCustomer.setCustomerPhone(rset.getString("customer_phone"));
				loginCustomer.setCustomerPw(rset.getString("customer_pw"));
				loginCustomer.setCustomerBirthdate(rset.getString("customer_birthdate"));
				loginCustomer.setCustomerEnrolldate(rset.getString("customer_enrolldate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		return loginCustomer;
	}
}
