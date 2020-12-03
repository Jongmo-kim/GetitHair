package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.ReviewComment;

/**
 * Servlet implementation class InsertDesignerReviewCommentServlet
 */
@WebServlet(name = "InsertDesignerReviewComment", urlPatterns = { "/insertDesignerReviewComment" })
public class InsertDesignerReviewCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDesignerReviewCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ReviewComment rc = new ReviewComment();
		rc.setReviewCommentWriter(request.getParameter("reviewCommentWriter"));
		rc.setReviewCommentContent(request.getParameter("reviewCommentContent"));
		rc.setReviewRef(Integer.parseInt(request.getParameter("reviewRef")));
		// 3. 비지니스 로직
		int result = new ReviewService().insertReviewComment(rc);
		
		// 4. 결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "댓글 등록이 완료되었습니다.");
		}else {
			request.setAttribute("msg", "댓글 등록에 실패하였습니다. 관리자에게 문의하세요.");
		}
		request.setAttribute("loc", "/designerReviewView?reviewNo="+rc.getReviewRef());
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
