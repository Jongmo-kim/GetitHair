package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import likes.model.service.LikesService;
import likes.model.vo.LikesPageData;

/**
 * Servlet implementation class MypageCustLikesListServlet
 */
@WebServlet(name = "MypageCustLikesList", urlPatterns = { "/mypageCustLikesList" })
public class MypageCustLikesListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCustLikesListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		int reqPage=  Integer.parseInt(request.getParameter("reqPage"));
		LikesPageData lpd = new LikesService().LikesSelectListByCustomer(reqPage, customerNo);
		if(lpd != null) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/mypageCustLikesList.jsp");	
			request.setAttribute("list", lpd.getList());
			request.setAttribute("pageNavi", lpd.getPageNavi());
			rd.forward(request, response);
		}else {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "찜리스트표시를 취소합니다.");
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
