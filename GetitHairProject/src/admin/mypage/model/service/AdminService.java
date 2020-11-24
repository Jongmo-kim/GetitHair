package admin.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.mypage.model.dao.AdminDao;
import common.JDBCTemplate;
import customer.model.vo.Customer;

public class AdminService {
	
	public ArrayList<Customer> getCustomerListById(String id){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Customer> list = new AdminDao().getCustomerListById(conn, id);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Customer> getCustomerListByName(String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Customer> list = new AdminDao().getCustomerListByName(conn, keyword);
		JDBCTemplate.close(conn);
		return list;
	}
}
