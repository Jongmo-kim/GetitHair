package designer.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;
import reserveTest.model.service.ReserveTestService;
import reserveTest.model.vo.ReserveTest;

/**
 * Servlet implementation class UpdateReserveCalendarModalServlet
 */
@WebServlet(name = "UpdateReserveCalendarModal", urlPatterns = { "/updateReserveCalendarModal" })
public class UpdateReserveCalendarModalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReserveCalendarModalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDateString = request.getParameter("reserveStartDate");
		String endDateString = request.getParameter("reserveEndDate");
		String dateString = request.getParameter("reserveDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh시 mm분");
		java.sql.Date startDate = null;
		java.sql.Date endDate = null;
		java.sql.Date date = null;
		try {
			Date utilStartDate = sdf.parse(startDateString);
			Date utillEndDate = sdf.parse(endDateString);
			Date utillDate = sdf.parse(dateString);
			startDate = new java.sql.Date(utilStartDate.getTime());
			endDate = new java.sql.Date(utillEndDate.getTime());
			date = new java.sql.Date(utillDate.getTime());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		// 여기까지 String Date -> Sql.Date로 변환
		System.out.println(request.getParameter("reserveNo"));
		// 2. view에서 넘어온 데이터 처리
		Reserve r = new Reserve();
		r.setReserveTitle(request.getParameter("reserveTitle"));
		int reserveNo = request.getParameter("reserveNo")==null || request.getParameter("reserveNo").equals("")  ? 0 : Integer.parseInt(request.getParameter("reserveNo"));
		r.setReserveNo(reserveNo);
		
		r.setReserveStartdate(startDate);
		r.setReserveEndDate(endDate);
		r.setReserveDate(date);
		r.setReserveStatus(request.getParameter("reserveStatus"));
		r.setReserveCustReq(request.getParameter("reserveCustReq"));
		r.setReserveDesignerReq(request.getParameter("reserveDesignerReq"));
		r.setReserveDesignerMemo(request.getParameter("reserveDesignerMemo"));
		// 3. 비지니스로직 처리
		int result = new ReserveService().updateReserveCalnedar(r);
		System.out.println("resut : " + result);

		// 4. 결과출력
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/designer/designerReserve.jsp");
		if(result!=0) {
			request.setAttribute("msg", "예약 상세정보 수정 완료.");
			request.setAttribute("loc", "/WEB-INF/view/reserve/designer/designerReserve.jsp");
		}else {
			request.setAttribute("msg", "예약 상세정보 수정 실패.");
			request.setAttribute("loc", "/WEB-INF/view/reserve/designer/designerReserve.jsp");
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
