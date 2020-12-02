package admin.mypage.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import designer.model.service.DesignerService;
import hairshop.model.service.HairshopService;
import reserve.model.service.ReserveService;
import review.model.service.ReviewService;

/**
 * Servlet implementation class MyPageAdminServlet
 */
@WebServlet("/mypageAdmin")
public class MypageAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MypageAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String getStartWeekAgoDate(int week) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.DATE, cal.get(Calendar.DATE) - week * 7);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		System.out.println(cal.getTime());
		return sdf.format(cal.getTime());
	}
	private String getStartMonthAgoDate(int month) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) - month);
		cal.set(Calendar.DATE, 1);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);

		return sdf.format(cal.getTime());
	}
	private String getAddedDate(int num) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.DATE, cal.get(Calendar.DATE) + num);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		return sdf.format(cal.getTime());
	}
	private String getCurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		
		return sdf.format(cal.getTime());
	}
	private String getEndMonthAgoDate(int month) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) - month);
		cal.set(Calendar.DATE,cal.getActualMaximum(Calendar.DAY_OF_MONTH)); // 마지막 일로 지정
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
//		System.out.println(cal.getTime());
		return sdf.format(cal.getTime());
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 회원 관련 summary 정보
		int customerCnt = new CustomerService().selectAllCustomer().size(); // 전체 회원 수
		int customerWeekCnt = new CustomerService().selectAllCustomer(getStartWeekAgoDate(1), getAddedDate(1)).size(); // 1주내 가입한 회원 수
		int customerMonthCnt = new CustomerService().selectAllCustomer(getStartMonthAgoDate(0), getEndMonthAgoDate(0)).size(); // 이번달 가입한 회원 수
		int customerLastMonthCnt = new CustomerService().selectAllCustomer(getStartMonthAgoDate(1), getEndMonthAgoDate(1)).size(); // 저번달 가입한 회원 수
		// 디자이너 관련 summary 정보
		int designerCnt = new DesignerService().selectAllDesigner().size(); // 전체 디자이너 수

		// 리뷰 관련 summary 정보
		int reviewCnt = new ReviewService().selectAllReviewCount(); // 전체 리뷰 수

		// 헤어샵 관련 summary 정보
		int shopCnt = new HairshopService().selectHairshop().size(); // 전체 헤어샵 수

		// 예약 관련 sumamry 정보
		int reserveWeekCnt = new ReserveService().selectAllByDate(getStartWeekAgoDate(1), getEndMonthAgoDate(0)); // 1주내 진행된 예약 수
		int reserveCurrMonthCnt = new ReserveService().selectAllByDate(getStartMonthAgoDate(0), getEndMonthAgoDate(0)); // 이번달 진행된 예약 수
		int reserveLastMonthCnt = new ReserveService().selectAllByDate(getStartMonthAgoDate(1), getEndMonthAgoDate(1)); // 이번달 진행된 예약 수
		int reserveCurrCnt = new ReserveService().selectAllByDate(getCurrentDate(),getAddedDate(1)); // 당일 예약 수
		int reserveAfterWeekCnt = new ReserveService().selectAllByDate(getAddedDate(1),getStartWeekAgoDate(-1)); // 향후 1주간 진행될 예약 수
		int reserveNextMonthCnt = new ReserveService().selectAllByDate(getStartMonthAgoDate(-1), getEndMonthAgoDate(-1)); // 다음달 예약 수
		// 값 설정 후 메인 관리페이지로 이동
		// 회원 값 설정
		request.setAttribute("customerCnt", customerCnt);
		request.setAttribute("customerWeekCnt", customerWeekCnt);
		request.setAttribute("customerMonthCnt", customerMonthCnt);
		request.setAttribute("customerLastMonthCnt", customerLastMonthCnt);
		// 디자이너 값 설정
		request.setAttribute("designerCnt", designerCnt);
		//리뷰 값 설정
		request.setAttribute("reviewCnt", reviewCnt);
		//헤어샵 값 설정
		request.setAttribute("shopCnt", shopCnt);
		//예약 값 설정
		request.setAttribute("reserveWeekCnt", reserveWeekCnt);
		request.setAttribute("reserveCurrMonthCnt", reserveCurrMonthCnt);
		request.setAttribute("reserveLastMonthCnt", reserveLastMonthCnt);
		request.setAttribute("reserveCurrCnt", reserveCurrCnt);
		request.setAttribute("reserveAfterWeekCnt", reserveAfterWeekCnt);
		request.setAttribute("reserveNextMonthCnt", reserveNextMonthCnt);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/admin/mypageAdminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
