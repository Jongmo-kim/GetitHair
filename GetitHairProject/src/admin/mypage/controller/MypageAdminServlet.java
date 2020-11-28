package admin.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import designer.model.service.DesignerService;
import hairshop.model.service.HairshopService;
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

		// 회원 관련 summary 정보
		int customerCount = new CustomerService().selectAllCustomer().size(); // 전체 회원 수

		// 디자이너 관련 summary 정보
		int designerCount = new DesignerService().selectAllDesigner().size(); // 전체 디자이너 수
		System.out.println("de");
		// 리뷰 관련 summary 정보
		int reviewCount = new ReviewService().selectAllReviewCount(); // 전체 리뷰 수
		System.out.println("review");
		// 헤어샵 관련 summary 정보
		int shopCount = new HairshopService().selectHairshopList().size(); // 전체 헤어샵 수
		// 값 설정 후 메인 관리페이지로 이동
		request.setAttribute("customerCnt", customerCount);
		request.setAttribute("designerCnt", designerCount);
		request.setAttribute("reviewCnt", reviewCount);
		request.setAttribute("shopCnt", shopCount);
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
