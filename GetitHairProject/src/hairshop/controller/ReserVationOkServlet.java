package hairshop.controller;

import java.io.Console;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hairinfo.model.service.HairinfoService;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class ReserVationOkServlet
 */
@WebServlet(name = "ReserVationOk", urlPatterns = { "/reserVationOk" })
public class ReserVationOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserVationOkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Reserve reserve = new Reserve();
		reserve.setReserveCustReq(request.getParameter("custReq"));
		
		int result = new ReserveService().insertReserve(reserve);
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/hairshopDeta/msg.jsp");
		if(result > 0 ) {
			request.setAttribute("msg", "예약완료");
			request.setAttribute("loc", "/hairshop");
		}else {
			request.setAttribute("msg", "로그인 후 에약해주세요!");
			request.setAttribute("loc", "/hairshop");
		}
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
