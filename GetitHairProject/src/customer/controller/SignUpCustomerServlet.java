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
 * Servlet implementation class SignUpCustomerServlet
 */
@WebServlet(name = "SignUpCustomer", urlPatterns = { "/signUpCustomer" })
public class SignUpCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer cust = CustTemplate.setCust(request);
		int result = new CustomerService().insertCustomer(cust);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/common/msg.jsp");
		if(result == 0) {
			request.setAttribute("msg", "회원가입 실패");
			request.setAttribute("loc", "/");
		} else {
			request.setAttribute("msg", "회원가입 성공");
			request.setAttribute("loc", "/");
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
