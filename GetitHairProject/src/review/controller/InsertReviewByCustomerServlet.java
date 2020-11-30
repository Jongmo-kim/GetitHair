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
		System.out.println("insertReviewByCustomer 서블릿 호출!");
		Review review = ReviewTemplate.setReview(request);
		DebugTemplate.setCurrObjAtSession(request.getSession(), review, "review");
		//System.out.println("Servlet review = "+review);
		System.out.println("Servlet  reviewNo = "+review.getReviewNo());
		System.out.println("Servlet  shopNo = "+review.getShop().getShopNo());
		System.out.println("Servlet  designerNo = "+review.getDesigner().getDesignerNo());
		System.out.println("Servlet  cutomerNo= "+review.getCustomer().getCustomerNo());
		System.out.println("Servlet  styleNo= "+review.getStyle().getStyleNo());
		System.out.println("Servlet  reviewContent= "+review.getReviewContent());
		System.out.println("Servlet  reviewRate= "+review.getReviewRate());
		System.out.println("Servlet  reveiwLikes = "+review.getReviewLikes());
		System.out.println("Servlet  reviewDate= "+review.getReviewDate());
	
		
		
		int result = new ReviewService().insertReview(review);
		System.out.println("Servlet result = "+result);
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
