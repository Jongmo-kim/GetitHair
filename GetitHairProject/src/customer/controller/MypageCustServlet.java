package customer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DebugModeServlet;
import common.DebugTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;


/**
 * Servlet implementation class MypageCustServlet
 */
@WebServlet(name = "MypageCust", urlPatterns = { "/mypageCust" })
public class MypageCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		int customerNo = loginCustomer.getCustomerNo();
		ArrayList<Reserve> list = new ReserveService().selectAllByCust(customerNo);
		if(loginCustomer!=null) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");	
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("list", list);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "회원정보가 없습니다. 로그인부터 해주세요.");
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
