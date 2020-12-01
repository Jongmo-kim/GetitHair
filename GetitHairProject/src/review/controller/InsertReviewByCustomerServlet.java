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
		//System.out.println("insertReviewByCustomer 서블릿 호출!");
		//int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		//int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		//int designerNo = Integer.parseInt(request.getParameter("designerNo"));
		//int customerNo = Integer.parseInt(request.getParameter("customerNo"));		
		//int styleNo = Integer.parseInt(request.getParameter("styleNo"));
		//String reviewContent = request.getParameter("reviewContent");
		//int reviewRate = Integer.parseInt(request.getParameter("reviewRate"));
		//int reviewLikes = Integer.parseInt(request.getParameter("reviewLikes"));		
		//String reviewDate = request.getParameter("reviewDate");		
		//System.out.println("Servlet  reviewNo = "+reviewNo);
		//System.out.println("Servlet  shopNo = "+shopNo);
		//System.out.println("Servlet  designerNo = "+designerNo);
		//System.out.println("Servlet  customerNo= "+customerNo);
		//System.out.println("Servlet  styleNo= "+styleNo);
		//System.out.println("Servlet  reviewContent= "+reviewContent);
		//System.out.println("Servlet  reviewRate= "+reviewRate);
		//System.out.println("Servlet  reviewLikes = "+reviewLikes);
		//System.out.println("Servlet  reviewDate= "+reviewDate);
		
		String selStatus= request.getParameter("selStatus");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		Review review = ReviewTemplate.setReview(request);
		DebugTemplate.setCurrObjAtSession(request.getSession(), review, "review");		
		int result = new ReviewService().insertReview(review);
		//System.out.println("Servlet result = "+result);
		if(result>0) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리뷰작성에 성공하셨습니다!!");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리뷰작성에 실패하셨습니다..");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);		
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
