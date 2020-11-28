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
 * Servlet implementation class DesignerReviewCommentUpdateServlet
 */
@WebServlet(name = "DesignerReviewCommentUpdate", urlPatterns = { "/designerReviewCommentUpdate" })
public class DesignerReviewCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerReviewCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reviewCommentNo = Integer.parseInt(request.getParameter("reviewCommentNo"));
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String reviewCommentContent = request.getParameter("reviewCommentContent");
		int result = new ReviewService().updateReviewComment(reviewCommentNo, reviewCommentContent);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "댓글 수정 완료.");
		}else {			
			request.setAttribute("msg", "댓글 수정 실패!!!!");
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
