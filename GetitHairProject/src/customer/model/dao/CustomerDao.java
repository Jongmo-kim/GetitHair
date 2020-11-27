package customer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.vo.Customer;
import hairinfo.model.vo.Hairinfo;


public class CustomerDao {	

	public Customer selectOneCustomer(Connection conn, String customerId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from customer where customer_id=?";
		Customer customer =null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, customerId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				customer = getCustomerFromRset(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		return customer;
	}


	public Customer selectOneCustomer(Connection conn, int customerNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Customer customer = null;
		String query = "select * from customer where customer_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, customerNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				customer = getCustomerFromRset(rset);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		return customer;
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
				Customer cust = getCustomerFromRset(rset);				
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
			pstmt.setString(3, customer.getCustomerBirthdate());
			pstmt.setString(4, customer.getCustomerGen());
			pstmt.setString(5, customer.getCustomerName());
			pstmt.setString(6, customer.getCustomerEmail());
			pstmt.setString(7, customer.getCustomerAddr());
			pstmt.setString(8, customer.getCustomerPhone());
			pstmt.setString(9, customer.getAddrDetail());
			pstmt.setString(10, customer.getAddrPostcode());			
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
		Customer customer = null;
		String query = "select * from customer where customer_id=? and customer_pw=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, customerId);
			pstmt.setString(2, customerPw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				customer = getCustomerFromRset(rset);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		return customer;
	}


	public int totalCount(Connection conn) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) cnt from customer";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	private Customer getCustomerFromRset(ResultSet rset) {
		Customer customer = new Customer();
		try {
			customer.setCustomerNo(rset.getInt("customer_no"));
			customer.setAddrDetail(rset.getString("addr_detail"));
			customer.setAddrPostcode(rset.getString("addr_postcode"));
			customer.setCustomerAddr(rset.getString("customer_addr"));
			customer.setCustomerEmail(rset.getString("customer_email"));
			customer.setCustomerGen(rset.getString("customer_gen"));
			customer.setCustomerId(rset.getString("customer_id"));
			customer.setCustomerName(rset.getString("customer_name"));
			customer.setCustomerPhone(rset.getString("customer_phone"));
			customer.setCustomerPw(rset.getString("customer_pw"));
			customer.setCustomerBirthdate(rset.getString("customer_birthdate"));
			customer.setCustomerEnrolldate(rset.getDate("customer_enrolldate"));			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customer;
	}

	public ArrayList<Customer> customerSelectList(Connection conn, int startNum, int endNum) {
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		String query = "select * from ( select rownum as custnum, n.* from (select * from customer order by 1 desc)n ) where custnum between ? and ?";
		ArrayList<Customer> list = new ArrayList<Customer>();
		
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Customer cust = getCustomerFromRset(rset);
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
	
	//도현 admin 페이지에 필요해서 만든 페이징 메서드
	public int getMaxPageSize(Connection conn, int maxPrintSize) {
		PreparedStatement pstmt = null;
		String qrySelect = "select count(*) cnt from customer";
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(qrySelect);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
				if(result != 0) {
					result = (result / maxPrintSize) + ((result % maxPrintSize) != 0 ? 1 : 0);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
//		System.out.println(result);
		return result;
	}

	public ArrayList<Customer> selectAllCusetomer(Connection conn, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT * FROM (SELECT ROWNUM RN,CUST.* FROM "
				+ "(SELECT CUST.* FROM customer CUST ORDER BY CUST.customer_no DESC) CUST) "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Customer> list = new ArrayList<Customer>();
		try {
			pstmt=conn.prepareStatement(qrySelect);
			pstmt.setInt(1, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(2, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Customer cust = getCustomerFromRset(rs);
				list.add(cust);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}


}
