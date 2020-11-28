package designer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.service.DesignerService;
import review.model.service.ReviewService;
import review.model.vo.ReviewComment;
import review.model.vo.ReviewViewData;

/**
 * Servlet implementation class DesignerReviewViewServlet
 */
@WebServlet(name = "DesignerReviewView", urlPatterns = { "/designerReviewView" })
public class DesignerReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerReviewViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		ReviewViewData rvd = new ReviewService().selectReviewView(reviewNo);
		if(rvd.getR() == null) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리뷰가 존재하지 않습니다.");
			request.setAttribute("loc", "/designerReviewList?reqPage=1");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/review/designer/designerReviewView.jsp");
			request.setAttribute("r", rvd.getR());
			request.setAttribute("list", rvd.getList());
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
