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
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));

		// 비즈니스 로직
		int result = new ReviewService().deleteReviewByReviewNo(reviewNo);
		response.setContentType("text/plain; charset=utf-8");
		if (result > 0) {
			response.getWriter().print("삭제성공");
		} else {
			response.getWriter().print("삭제실패");
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
