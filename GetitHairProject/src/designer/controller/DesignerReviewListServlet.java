package designer.controller;

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
 * Servlet implementation class DesignerReviewListServlet
 */
@WebServlet(name = "DesignerReviewList", urlPatterns = { "/designerReviewList" })
public class DesignerReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		// 2. view에서 넘어온 데이터 저장
		int designerNo = 1;//Integer.parseInt(request.getParameter("designerNo"));
		// 3. 비지니스로직
		ArrayList<Review> list = new ReviewService().selectAllReviewByDesignerNo(designerNo);
		// 4. 결과처리
		if(list !=null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/review/designer/designerReviewList.jsp");
			request.setAttribute("list", list);	// 이걸 왜 빼먹냐 진심 개 빡대갈 ^^
			rd.forward(request, response);	
		}else {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리뷰가 존재하지 않습니다.");
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
