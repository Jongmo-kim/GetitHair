package admin.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.vo.Admin;
import admin.mypage.model.dao.AdminDao;
import common.JDBCTemplate;
import customer.model.vo.Customer;

public class AdminService {
	public Object[] getCustomerListById(String keyword, int reqPage, int maxPrintSize){
		Connection conn = JDBCTemplate.getConnection();
		Object[] list = new AdminDao().getCustomerListById(conn, keyword,reqPage,maxPrintSize);
		int result = (Integer)list[0];
		result = (result / maxPrintSize) + ((result % maxPrintSize) != 0 ? 1 : 0); //maxPageSize 계산
		list[0] = result;
		JDBCTemplate.close(conn);
		return list;
	}
	public Object[] getCustomerListByName(String keyword, int reqPage, int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		Object[] list = new AdminDao().getCustomerListByName(conn, keyword,reqPage,maxPrintSize);
		int result = (Integer)list[0];
		result = (result / maxPrintSize) + ((result % maxPrintSize) != 0 ? 1 : 0); //maxPageSize 계산
		list[0] = result;
		JDBCTemplate.close(conn);
		return list;
	}
	
	public Admin selectOneAdmin(String id,String pw) {
		Connection conn = JDBCTemplate.getConnection();
		Admin admin = new AdminDao().selecOneAdmin(conn, id, pw);
		JDBCTemplate.close(conn);
		
		return admin;
	}
}
