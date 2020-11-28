package reserveTest.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.vo.Customer;
import reserveTest.model.vo.ReserveTest;
import reserveTest.model.vo.ReserveTestPageData;
import reserveTest.model.dao.ReserveTestDao;

public class ReserveTestService {
	//custNo로 
	//sql custno로 where cust
	public ArrayList<ReserveTest> selectAll(int reserveNo){
		ArrayList<ReserveTest> list = null;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveTestDao().selectAll(conn);
		JDBCTemplate.close(conn);
		return list;		
	}
	public ArrayList<ReserveTest> selectAllByCust(int CustmoerNo){
		ArrayList<ReserveTest> list;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveTestDao().selectAllByCust(conn,CustmoerNo);
		JDBCTemplate.close(conn);
		return list;		
	}
	public ArrayList<ReserveTest> selectAllByDesigner(int DesignerNo){
		ArrayList<ReserveTest> list;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveTestDao().selectAllByDesigner(conn,DesignerNo);
		JDBCTemplate.close(conn);
		return list;		
	}
	public int insertReserveTest(ReserveTest reserve) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new ReserveTestDao().insertReserveTest(conn, reserve);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	public ReserveTest selectOneReserveTest(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		ReserveTest reserve = new ReserveTestDao().selectOneReserveTest(conn, reserveNo);
		if(reserve == null) {
			reserve = new ReserveTest();
		}
		JDBCTemplate.close(conn);
		return reserve;
	}
	public int deleteReserveTest(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result= new ReserveTestDao().deleteReserveTest(conn, reserveNo);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateReserveTest(ReserveTest reserve) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReserveTestDao().updateReserveTest(conn, reserve);
		commitOrRollback(conn, result);
		JDBCTemplate.close(conn);
		return result;
	}	
	
	private void commitOrRollback(Connection conn, int result) {
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
	}	
	public ReserveTestPageData reserveSelectListCustomerSelStatus(int reqPage,Customer customer, String selStatus,String sqlAdd) {
		Connection conn = JDBCTemplate.getConnection();
		ReserveTestDao dao = new ReserveTestDao();
		int totalCount = dao.getTotalCountCustomerSelStatus(conn, customer, sqlAdd);
		int numPerPage = 10;
		int totalPage = totalCount % numPerPage == 0 ? totalCount / numPerPage : totalCount / numPerPage + 1;
		// reqPage = 1 -> start : 1, end : 10
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		ArrayList<ReserveTest> list = dao.selectListCustomerSelStatus(conn,customer,start,end,sqlAdd);
		// 페이지 네비게이션 작성 시작
		int pageNaviSize = 5;
		String pageNavi = "";
		String link = "<a href='/updateReserveTestFrm?customerNo="+customer.getCustomerNo()+"&selStatus="+selStatus+"&reqPage=";
		// 페이지네비 시작번호 구하기
		// reqPage : 1~5 -> 1
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		// 이전버튼 : 페이지 시작번호가 1이 아닌경우에만 이전버튼 생성
		if (pageNo != 1) {
			pageNavi += link + (pageNo-1)+"'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; ++i) {
			if (reqPage == pageNo) {
				// 현재페이지
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += link + pageNo + "'>" + pageNo + "</a>";
			}
			++pageNo;
			if (pageNo > totalPage) {
				break;
			}
		}
		//다음버튼생성
		if (pageNo <= totalPage) {
			pageNavi +=  link + (pageNo)+"'>다음</a>";
		}		
		ReserveTestPageData rpd= new ReserveTestPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return rpd;
	}
	public int updateDateReserveTest(int no, String title, Date startDate, Date endDate) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReserveTestDao().updateDateReserveTest(conn,no,title,startDate,endDate);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
		
}
