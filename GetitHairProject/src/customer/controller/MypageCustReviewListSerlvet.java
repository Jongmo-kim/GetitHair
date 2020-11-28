package customer.controller;

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
 * Servlet implementation class MypageCustomerReviewListSerlvet
 */
@WebServlet(name = "MypageCustomerReviewList", urlPatterns = { "/mypageCustReviewList" })
public class MypageCustReviewListSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCustReviewListSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerNo = Integer.parseInt(request.getParameter("customerNo")); //회원
		int reqPage = Integer.parseInt(request.getParameter("reqPage")); 
		int numPerPage = 10;		//하나에 페이지당 10개씩
		int maxSize = 5; //1 2 3 4 5 => 5개 네비 최대 갯수 표시 6개면  6으로 시작함

		//3.비지니스로직처리
		int maxPageSize = new ReviewService().getAllReviewByCustomerNoMaxPageSize(numPerPage,customerNo);//cust기준 최대 페이지개수
		ArrayList<Review> list = new ReviewService().selectAllReviewByCustomerNo(customerNo, reqPage, numPerPage); //리스트작업
		int[] startEnd = new ReviewService().getPageStartEnd(reqPage, maxSize, maxPageSize); //시작숫자와 끝숫자 int배열에 저장
		//4.결과처리
		if(list !=null) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/mypageCustReviewList.jsp");
			request.setAttribute("list", list);
			request.setAttribute("start", startEnd[0]);
			request.setAttribute("end", startEnd[1]);
			request.setAttribute("reqPage", reqPage);
			request.setAttribute("maxPageSize", maxPageSize);
			request.setAttribute("customerNo", customerNo);
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
