package reserve.model.service;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import common.JDBCTemplate;
import reserve.model.dao.ReserveDao;
import reserve.model.vo.Reserve;
import reserve.model.vo.ReservePageData;

public class ReserveService {
	//custNo로 
	//sql custno로 where cust
	public ArrayList<Reserve> selectAll(int reserveNo){
		ArrayList<Reserve> list = null;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveDao().selectAll(conn);
		JDBCTemplate.close(conn);
		return list;		
	}
	public ArrayList<Reserve> selectAllByCust(int CustmoerNo){
		ArrayList<Reserve> list;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveDao().selectAllByCust(conn,CustmoerNo);
		JDBCTemplate.close(conn);
		return list;		
	}
	public ArrayList<Reserve> selectAllByDesigner(int DesignerNo){
		ArrayList<Reserve> list;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveDao().selectAllByDesigner(conn,DesignerNo);
		JDBCTemplate.close(conn);
		return list;		
	}
	public int selectAllByDate(String startDate,String endDate){
		Connection conn = JDBCTemplate.getConnection();
		java.sql.Date startSqlDate = getSqlDateFromString(startDate);
		java.sql.Date endSqlDate = getSqlDateFromString(endDate);
		int result = new ReserveDao().selectAllByDate(conn, startSqlDate, endSqlDate);
		JDBCTemplate.close(conn);
		return result;
	}
	private java.sql.Date getSqlDateFromString(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date sqlDate = null;
		try {
			Date utilDate= sdf.parse(date);
			sqlDate = new java.sql.Date(utilDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sqlDate;
	}
	public int insertReserve(Reserve reserve) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new ReserveDao().insertReserve(conn, reserve);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	public Reserve selectOneReserve(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		Reserve reserve = new ReserveDao().selectOneReserve(conn, reserveNo);
		if(reserve == null) {
			reserve = new Reserve();
		}
		JDBCTemplate.close(conn);
		return reserve;
	}
	public int deleteReserve(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result= new ReserveDao().deleteReserve(conn, reserveNo);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateReserve(Reserve reserve) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReserveDao().updateReserve(conn, reserve);
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
	public ReservePageData reserveSelectListCustomerSelStatus(int reqPage,int customerNo, String selStatus,String sqlAdd) {
		Connection conn = JDBCTemplate.getConnection();
		ReserveDao dao = new ReserveDao();
		int totalCount = dao.getTotalCountCustomerSelStatus(conn, customerNo, sqlAdd);
		int numPerPage = 10;
		int totalPage = totalCount % numPerPage == 0 ? totalCount / numPerPage : totalCount / numPerPage + 1;
		//System.out.println("service totalCount = "+totalCount);
		//System.out.println("service totalPage = "+totalPage);
		// reqPage = 1 -> start : 1, end : 10
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		//System.out.println("service start = "+start);
		//System.out.println("service end = "+end);
		ArrayList<Reserve> list = dao.selectListCustomerSelStatus(conn,start,end,sqlAdd,customerNo);
		//System.out.println("service List.size = "+list.size());  Connection conn, int start, int end, String selStatus,int customerNo
		// 페이지 네비게이션 작성 시작
		int pageNaviSize = 5;
		String pageNavi = "";
		//String link = "<a href='/updateReserveFrm?customerNo="+customer.getCustomerNo()+"&selStatus="+selStatus+"&reqPage=";
		String link = "<a class='btn btn-primary' href='/mypageCust?selStatus="+selStatus+"&reqPage=";
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
				pageNavi += "<span class='btn btn-primary'>" + pageNo + "</span>";
			} else {
				pageNavi += link + pageNo +"'>" + pageNo + "</a>";
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
		ReservePageData rpd= new ReservePageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return rpd;
	}
	
	public int getReserveTotalPageByCust(int customerNo, String selStatus, String sqlAdd) {
		Connection conn = JDBCTemplate.getConnection();
		ReserveDao dao = new ReserveDao();
		int totalCount = dao.getTotalCountCustomerSelStatus(conn,customerNo,sqlAdd);
		int numPerPage = 10;
		int totalPage = totalCount % numPerPage == 0 ? totalCount / numPerPage : totalCount / numPerPage + 1;		
		JDBCTemplate.close(conn);
		return totalPage;
	}

	
	//아래부터 도현 메서드
	//paging 으로 가져오는 메서드
	public int getAllReserveMaxPageSize(int maxPrintSize) {
		// TODO Auto-generated method stub getTotalCount
		Connection conn = JDBCTemplate.getConnection();
		int count = new ReserveDao().getTotalCount(conn);
		count = (count / maxPrintSize) + ((count % maxPrintSize) != 0 ? 1 : 0);
		JDBCTemplate.close(conn);
		return count;

	}	
	public ArrayList<Reserve> selectAllReservePaging(int reqPage, int maxPrintSize) {
		ArrayList<Reserve> list;
		Connection conn = JDBCTemplate.getConnection();
		list = new ReserveDao().selectList(conn,(maxPrintSize*(reqPage-1))+1,maxPrintSize*reqPage);
		JDBCTemplate.close(conn);
		return list;
	}
	//아래부터 태민 메서드 (뒤늦은 주석추가..)
	//paging 으로 가져오는 메서드 (selStatus조건 sql문 추가)
	public int getAllReserveMaxPageSize(int maxPrintSize, String selStatus) {
		String sqlAdd ="";
		if(selStatus.equals("예약")) {
			sqlAdd = " where reserve_status='예약' ";
		}else if(selStatus.equals("완료")) {
			sqlAdd = " where reserve_status='완료' ";
		}else if(selStatus.equals("취소")) {
			sqlAdd = " where reserve_status='취소' ";
		}
		Connection conn = JDBCTemplate.getConnection();
		int count = new ReserveDao().getTotalCount(conn,sqlAdd);
		count = (count / maxPrintSize) + ((count % maxPrintSize) != 0 ? 1 : 0);
		JDBCTemplate.close(conn);
		return count;

	}
	//태민추가 메서드 손님 다시예약하기 예약상태 디자이너메모 및 요청사항 고정
	public int insertReReserve(Reserve reserve) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new ReserveDao().insertReReserve(conn, reserve);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	//태민추가 메서드 손님 예약하기 상태 취소로 바꾸기
	public int cancelReserveByCust(int reserveNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReserveDao().cancelReserve(conn,reserveNo);
		commitOrRollback(conn,result);
		JDBCTemplate.close(conn);
		return result;
	}
	
}
