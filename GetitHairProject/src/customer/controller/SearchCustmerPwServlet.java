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
 * Servlet implementation class SerchCustmerPwServlet2
 */
@WebServlet(name = "SearchCustmerPw", urlPatterns = { "/searchCustmerPw" })
public class SearchCustmerPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCustmerPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerId = request.getParameter("customerId");
		String customerPhone = request.getParameter("customerPhone");	
		System.out.println("customerId = " + customerId);
		System.out.println("customerPhone = " + customerPhone);

		Customer cust = new CustomerService().selectOneSerchPw(customerId, customerPhone);
		System.out.println("cust = " + cust);
		if(cust==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp/searchCustomerForm.jsp");
			request.setAttribute("msg", "암호를 찾을수 없습니다..");
			request.setAttribute("option", 1);
			rd.forward(request, response);
		}else {			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp/resetCustomerPw.jsp");
			request.setAttribute("customer", cust);
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
