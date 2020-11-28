package admin.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import review.model.service.ReviewService;

/**
 * Servlet implementation class AdminDeleteReviewServlet
 */
@WebServlet("/adminDeleteReview")
public class AdminDeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteReviewServlet() {
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

		// 값 받기
		String[] reviewNo = request.getParameterValues("reviewNo");
		String isAjax = request.getParameter("isAjax"); // Ajax 요청인지 아닌지 판단

		// 비즈니스 로직
		int result = 0;
		for (int i = 0; i < reviewNo.length; i++) {
			result += new ReviewService().deleteReviewByReviewNo(Integer.parseInt((reviewNo[i])));
		}
		if (isAjax != null) { // Ajax를 이용한 요청일 경우
			response.setContentType("text/plain; charset=utf-8");
			if (result > 0) {
				response.getWriter().print("삭제성공");
			} else {
				response.getWriter().print("삭제실패");
			}
		} else {
			if (result > 0) {
				request.setAttribute("msg", "삭제에 성공하였습니다.");
				request.setAttribute("loc", "/mypageAdminReview");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "삭제에 실패했습니다.");
				request.setAttribute("loc", "/mypageAdminReview");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		}
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
