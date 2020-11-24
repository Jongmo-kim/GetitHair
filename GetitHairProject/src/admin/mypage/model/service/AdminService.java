package admin.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.mypage.model.dao.AdminDao;
import admin.mypage.model.vo.AdminCustomer;
import common.JDBCTemplate;

public class AdminService {
	public ArrayList<AdminCustomer> getCustomerList(int page){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<AdminCustomer> list = new AdminDao().getCustomerList(conn, page);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<AdminCustomer> getCustomerListById(String id){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<AdminCustomer> list = new AdminDao().getCustomerListById(conn, id);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<AdminCustomer> getCustomerListByName(String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<AdminCustomer> list = new AdminDao().getCustomerListByName(conn, keyword);
		JDBCTemplate.close(conn);
		return list;
	}
}
