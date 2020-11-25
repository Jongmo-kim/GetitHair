package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class SelectAllReviewListServlet
 */
@WebServlet(name = "SelectAllReviewList", urlPatterns = { "/selectAllReviewList" })
public class SelectAllReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		//2.view에서 넘어온값 저장
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		//3.비지니스로직처리
		ArrayList<Review> list = new ReviewService().selectAllReview(customerNo);
		//4.결과처리
		if(list !=null) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/selectAllReviewListFrm.jsp");	
			rd.forward(request, response);	
		}else {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리뷰리스트를 조회 할 수 없습니다.");
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
