package customer.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import common.JDBCTemplate;
import customer.model.dao.CustomerDao;
import customer.model.vo.Customer;
import customer.model.vo.CustomerPageData;
import hairinfo.model.dao.HairinfoDao;
import hairinfo.model.vo.Hairinfo;


public class CustomerService {

	public Customer selectOneCustomer(String customerId) {
		Connection conn = JDBCTemplate.getConnection();
		Customer loginCustomer = new CustomerDao().selectOneCustomer(conn,customerId);
		JDBCTemplate.close(conn);
		return loginCustomer;
	}
	public Customer selectOneCustomer(String customerId,String customerPw) {
		Connection conn = JDBCTemplate.getConnection();
		Customer loginCustomer = new CustomerDao().selectOneCustomer(conn,customerId,customerPw);
		JDBCTemplate.close(conn);
		return loginCustomer;
	}
	public Customer selectOneCustomer(int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		Customer loginCustomer = new CustomerDao().selectOneCustomer(conn,customerNo);
		JDBCTemplate.close(conn);
		return loginCustomer;
	}
	public ArrayList<Customer> selectAllCustomer() {
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
	public int insertCustomer(Customer customer,Hairinfo hairinfo) {
		Connection conn = JDBCTemplate.getConnection();
		int result1 = 0;
		int result2 = 0;
		result1 = new CustomerDao().insertCustomer(conn,customer);
		if(result1>0) {
			JDBCTemplate.commit(conn);
			customer = selectOneCustomer(customer.getCustomerId());
			if(result1>0) {
				result2 = new HairinfoDao().insertHairinfo(conn,hairinfo,customer.getCustomerNo());
			}
			if(result2>0) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
		} else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);			
		}
		
		return result2;
	}
	public CustomerPageData customerSelectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		CustomerDao dao = new CustomerDao();
		int totalCount = dao.totalCount(conn); //모든 DB 수
		int numPerPage = 10;//하나의 페이지당 게시물 수
		int totalPage = 0; //전체 페이지 수
		//조건문 나머지가 0인지 확인해서 11페이면 2페이지 나오게끔 설정
		if(totalCount % numPerPage == 0) { 
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//페이지 시작과 끝
		int startNum = (reqPage-1)*numPerPage+1;
		int endNum = reqPage*numPerPage;
		//해당 리스트 불러오기
		ArrayList<Customer> list = dao.customerSelectList(conn,startNum,endNum);
		int pageNaviSize =5;
		String pageNavi ="";
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		//이전버튼구현
		if(pageNo !=1) {
			pageNavi = "<a href='/customerList?reqPage="+(pageNo -1)+"'>이전</a>";
		}
		//페이지네비숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/customerList?reqpage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/customerList?reqPage="+pageNo+"'>다음</a>";
		}
		CustomerPageData cpd = new CustomerPageData(list, pageNavi);
		JDBCTemplate.close(conn);		
		return cpd;
	}	
	
	//도현 admin 페이지에 필요해서 만든 페이징 메서드
	// 총 페이지 개수를 반환 해주는 메서드
		public int getMaxPageSize(int maxPrintSize) {
			Connection conn = JDBCTemplate.getConnection();
			int result = new CustomerDao().getMaxPageSize(conn,maxPrintSize);
			if (result > 0) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
			return result;
		}
	// 모든 리뷰의 리스트를 페이징 하여 가져옴.
	public ArrayList<Customer> selectAllCusetomer(int reqPage,int maxPrintSize) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Customer> list = new CustomerDao().selectAllCusetomer(conn,reqPage,maxPrintSize);
		JDBCTemplate.close(conn);
		return list;
	}
	public int updateAllHairinfo(Customer customer, Hairinfo hairinfo) {
		Connection conn =JDBCTemplate.getConnection();
		int result = 0;
		result = (new CustomerDao().updateCustomer(conn, customer))*(new HairinfoDao().updateHairinfo(conn, hairinfo));
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int deleteCustomer(int customerNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		//int custResult = new CustomerDao().deleteCustomer(conn, customerNo);
		//int hairinfoResult = new HairinfoDao().deleteHairinfo(conn, customerNo);
		result = new CustomerDao().deleteCustomer(conn, customerNo);
		//System.out.println("custResult = "+custResult);
		//System.out.println("hairinfoResult = "+hairinfoResult);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);			
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int insertAllCustomer(Customer customer,Hairinfo hairinfo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		int custResult2 = new CustomerDao().insertCustomer(conn, customer);
		int hairinfoResult2 = new HairinfoDao().insertHairinfo(conn,hairinfo,customer.getCustomerNo());
		//result = (new CustomerDao().insertCustomer(conn, customer))*(new HairinfoDao().insertHairinfo(conn,hairinfo,customer.getCustomerNo()));
		result = custResult2*hairinfoResult2;
		System.out.println("custResult2 = "+custResult2);
		System.out.println("hairinfoResult2 = "+hairinfoResult2);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);			
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
