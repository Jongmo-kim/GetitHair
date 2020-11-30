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

/**
 * Servlet implementation class UpdateReserveByCustServlet
 */
@WebServlet(name = "UpdateReserveByCust", urlPatterns = { "/updateReserveByCust" })
public class UpdateReserveByCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReserveByCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = new CustomerService().selectOneCustomer(Integer.parseInt(request.getParameter("customerNo")));
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String selStatus = request.getParameter("selStatus");
		
		/*
		int result = new ReserveService().deleteReserve(reserveNo);
		//결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {					
			request.setAttribute("msg", "예약리스트에서 삭제 완료되었습니다.");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
		}else {
			request.setAttribute("msg", "예약리스트에서 삭제 실패되었습니다.");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
		}
		rd.forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
