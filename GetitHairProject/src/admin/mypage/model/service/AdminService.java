package admin.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.mypage.model.dao.AdminDao;
import common.JDBCTemplate;
import customer.model.vo.Customer;

public class AdminService {
<<<<<<< HEAD
	
	public ArrayList<Customer> getCustomerListById(String id){
=======
	public ArrayList<AdminCustomer> getCustomerList(int page){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<AdminCustomer> list = new AdminDao().getCustomerList(conn, page);
		JDBCTemplate.close(conn);
		return list;
	}	
	public ArrayList<AdminCustomer> getCustomerListById(String id){
>>>>>>> 2327fc222a7b6f32e6919efbbbed66b3c2a5aee0
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Customer> list = new AdminDao().getCustomerListById(conn, id);
		JDBCTemplate.close(conn);
		return list;
	}
<<<<<<< HEAD

	public ArrayList<Customer> getCustomerListByName(String keyword) {
=======
	public ArrayList<AdminCustomer> getCustomerListByName(String keyword) {
>>>>>>> 2327fc222a7b6f32e6919efbbbed66b3c2a5aee0
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Customer> list = new AdminDao().getCustomerListByName(conn, keyword);
		JDBCTemplate.close(conn);
		return list;
	}
}
