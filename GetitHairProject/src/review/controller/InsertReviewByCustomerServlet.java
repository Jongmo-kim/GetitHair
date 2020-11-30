package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DebugTemplate;
import common.ReviewTemplate;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class InsertReviewByCustomerServlet
 */
@WebServlet(name = "InsertReviewByCustomer", urlPatterns = { "/insertReviewByCustomer" })
public class InsertReviewByCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewByCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review review = ReviewTemplate.setReview(request);
		DebugTemplate.setCurrObjAtSession(request.getSession(), review, "review");
		int result = new ReviewService().insertReview(review);
		if(result>0) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리뷰작성에 성공하셨습니다!!");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리뷰작성에 실패하셨습니다!!");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
