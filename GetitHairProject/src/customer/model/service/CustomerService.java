package customer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.dao.CustomerDao;
import customer.model.vo.Customer;


public class CustomerService {

	public Customer selectOneCustomer(String customerId) {
		Connection conn = JDBCTemplate.getConnection();
		Customer loginCustomer = new CustomerDao().selectOneCustomer(conn,customerId);
		JDBCTemplate.close(conn);
		return loginCustomer;
	}
	public Customer selectOneCustomer(int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		Customer loginCustomer = new CustomerDao().selectOneCustomer(conn,customerNo);
		JDBCTemplate.close(conn);
		return loginCustomer;
	}
	public ArrayList<Customer> selectAllCusetomer() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Customer> list = new CustomerDao().selectAllCustomer(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int updateCustomer(Customer customer) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new CustomerDao().updateCustomer(conn,customer);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteCustomer(String customerId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new CustomerDao().deleteCustomer(conn,customerId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int insertCustomer(Customer customer) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new CustomerDao().insertCustomer(conn,customer);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
}
