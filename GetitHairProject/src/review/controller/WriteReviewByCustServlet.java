package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class InsertReviewByCustServlet
 */
@WebServlet(name = "InsertReviewByCust", urlPatterns = { "/writeReviewByCust" })
public class WriteReviewByCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteReviewByCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("writeReviewByCust 서블릿 호출!!~~!!");
		String selStatus = request.getParameter("selStatus");
		System.out.println("writeReviewByCust selStatus = "+selStatus);
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		System.out.println("writeReviewByCust reqPage = "+reqPage);
		String reserveNumber = request.getParameter("reserveNo");			
		System.out.println("reserveNumber = " +reserveNumber);		
		int reserveNo =  Integer.parseInt(reserveNumber);
		//int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		//int reserveNo = 100;
		System.out.println("reserveNo = " +reserveNo);
		Reserve reserve = new ReserveService().selectOneReserve(reserveNo);
		System.out.println("reserve = " +reserve);
		if(reserve == null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "조회할수 없는 값이 들어왔습니다.");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}
		String status = reserve.getReserveStatus();
		if(!status.equals("완료")) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "완료상태에서만 리뷰작성이 가능합니다.");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/writeReviewByCustFrm.jsp");
			request.setAttribute("reserve", reserve);
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
