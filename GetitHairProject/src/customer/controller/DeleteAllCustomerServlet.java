package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;

/**
 * Servlet implementation class DeleteAllCustomerServlet
 */
@WebServlet(name = "DeleteAllCustomer", urlPatterns = { "/deleteAllCustomer" })
public class DeleteAllCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAllCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		System.out.println("서블릿에온 custNo = "+ customerNo);
		int result = new CustomerService().deleteAllCustomer(customerNo);	
		System.out.println("서비스다녀온 custNo = "+ customerNo);
		System.out.println("서비스다녀온 result = "+ result);
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "회원탈퇴 성공했습니다 ^_^");
		}else {
			request.setAttribute("msg", "회원탈퇴 실패했네요... U_U");
		}
		request.setAttribute("loc", "/");
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
