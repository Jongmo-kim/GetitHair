package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteReviewByCustServlet
 */
@WebServlet(name = "DeleteReviewByCust", urlPatterns = { "/deleteReviewByCust" })
public class DeleteReviewByCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewByCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("deleteReviewByCust호출 완료");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		int result = new ReviewService().deleteReviewByReviewNo(reviewNo);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "해당 리뷰가 삭제가 완료되었습니다.");
		}else {
			request.setAttribute("msg", "해당 리뷰가 삭제가 안됬습니다...");
		}
		request.setAttribute("loc", "mypageCustReviewList?customerNo="+customerNo+"&reqPage="+reqPage);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
