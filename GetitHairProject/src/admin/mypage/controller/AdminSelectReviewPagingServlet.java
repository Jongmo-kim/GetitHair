package admin.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class AdminSelectReviewPagingServlet
 */
@WebServlet("/adminSelectReviewPaging")
public class AdminSelectReviewPagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelectReviewPagingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 값 받아오기
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		// reqPage = 요청할 페이지 번호.
		int reqPage = request.getParameter("reqPage") != null ? Integer.parseInt(request.getParameter("reqPage")) : 1;
		// 비즈니스 로직
		int maxPrintSize = 10; //한 페이지에 출력될 리뷰 최대 갯수 지정.
		int pageSize = new ReviewService().getAllReviewByCustomerNoMaxPageSize(maxPrintSize, customerNo);
		int maxSize = 5;
	    int [] startEnd = new ReviewService().getPageStartEnd(reqPage,maxSize, pageSize);
	    Gson gson = new Gson();
	    JsonObject json = new JsonObject();
	    json.addProperty("reqPage", reqPage);
	    json.addProperty("maxPageSize", pageSize);
	    json.addProperty("pageStart", startEnd[0]);
	    json.addProperty("pageEnd", startEnd[1]);
		// 값 전달하기
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(gson.toJson(json));
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
