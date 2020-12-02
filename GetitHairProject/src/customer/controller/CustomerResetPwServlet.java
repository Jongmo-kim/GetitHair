package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;

/**
 * Servlet implementation class CustomerResetPwServlet
 */
@WebServlet(name = "CustomerResetPw", urlPatterns = { "/customerResetPw" })
public class CustomerResetPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerResetPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		String customerId = request.getParameter("customerId");
		String customerPw = request.getParameter("customerPw");
		Customer cust = new CustomerService().selectOneCustomer(customerNo);
		if(cust==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "조회되지 않는 회원입니다.");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}else {
			cust.setCustomerPw(customerPw);
			int result = new CustomerService().updateCustomer(cust);
			if(result>0) {
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				request.setAttribute("msg", "암호설정이 완료되었습니다.");
				request.setAttribute("loc", "/");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/findSuccess.jsp");
				request.setAttribute("option",0);
				rd.forward(request, response);
			}
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
