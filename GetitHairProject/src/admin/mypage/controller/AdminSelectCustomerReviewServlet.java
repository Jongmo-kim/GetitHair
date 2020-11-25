package admin.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class AdminSelectCustomerReviewServlet
 */
@WebServlet("/adminSelectCustomerReview")
public class AdminSelectCustomerReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelectCustomerReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//값 받아오기
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		//비즈니스 로직
		ArrayList<Review> list = new ReviewService().selectAllReviewByCustomerNo(customerNo);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		//값 전달하기
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(json);
		System.out.println(json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
