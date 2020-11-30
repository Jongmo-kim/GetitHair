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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		// 회원 관련 summary 정보
		int customerCnt = new CustomerService().selectAllCustomer().size(); // 전체 회원 수
		cal.add(Calendar.DATE, 1);
		String endDate = sdf.format(cal.getTime());
		cal.add(Calendar.DATE, -7-1);
		String startDate = sdf.format(cal.getTime());
		int customerWeekCnt = new CustomerService().selectAllCustomer(startDate,endDate).size(); // 1주간 가입한 회원 수
		// 디자이너 관련 summary 정보
		int designerCnt = new DesignerService().selectAllDesigner().size(); // 전체 디자이너 수

		// 리뷰 관련 summary 정보
		int reviewCnt = new ReviewService().selectAllReviewCount(); // 전체 리뷰 수

		// 헤어샵 관련 summary 정보
		int shopCnt = new HairshopService().selectHairshopList().size(); // 전체 헤어샵 수
		
		// 예약 관련 sumamry 정보
		int reserveWeekCnt = new ReserveService().selectAllByDate(startDate,endDate).size(); // 1주내 진행될(된) 예약 수
		// 값 설정 후 메인 관리페이지로 이동
		request.setAttribute("customerCnt", customerCnt);
		request.setAttribute("customerWeekCnt", customerWeekCnt);
		request.setAttribute("designerCnt", designerCnt);
		request.setAttribute("reviewCnt", reviewCnt);
		request.setAttribute("shopCnt", shopCnt);
		request.setAttribute("reserveWeekCnt", reserveWeekCnt);
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
