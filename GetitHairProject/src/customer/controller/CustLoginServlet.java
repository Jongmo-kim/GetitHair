package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;

/**
 * Servlet implementation class CustLoginServlet
 */
@WebServlet(name = "CustLogin", urlPatterns = { "/custLogin" })
public class CustLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputId = request.getParameter("inputId");
		String inputPw = request.getParameter("inputPw");
		Customer loginCust = new CustomerService().selectOneCustomer(inputId,inputPw);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		System.out.println(inputId);
		System.out.println(inputPw);
		if(loginCust == null) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 실패");		
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginCustomer", loginCust);
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 성공");		
		}
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
