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
 * Servlet implementation class DesignerReviewCommentDeleteServlet
 */
@WebServlet(name = "DesignerReviewCommentDelete", urlPatterns = { "/designerReviewCommentDelete" })
public class DesignerReviewCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerReviewCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int reviewCommentNo = Integer.parseInt(request.getParameter("reviewCommentNo"));
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int result = new ReviewService().deleteReviewComment(reviewCommentNo);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "댓글이 삭제되었습니다.");
		}else {
			request.setAttribute("msg", "댓글삭제 실패!!");
		}
		request.setAttribute("loc", "/designerReviewView?reviewNo="+reviewNo);
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
