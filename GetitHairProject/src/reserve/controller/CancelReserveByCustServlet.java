package reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class CancelReserveByCustServlet
 */
@WebServlet(name = "CancelReserveByCust", urlPatterns = { "/cancelReserveByCust" })
public class CancelReserveByCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelReserveByCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String selStatus = request.getParameter("selStatus");
		Reserve r = new ReserveService().selectOneReserve(reserveNo);
		String selStatus2 = r.getReserveStatus();		
		if(!selStatus2.equals("예약")) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", selStatus2+"상태에서는 설정할 수 없습니다.");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
			rd.forward(request, response);		
		}else {
			int result = new ReserveService().cancelReserveByCust(reserveNo);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			if(result>0) {					
				request.setAttribute("msg", "해당 예약이 취소로 설정 되었습니다.");
			}else {
				request.setAttribute("msg", "해당 예약이 취소로 설정 되었습니다.");
			}
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
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
