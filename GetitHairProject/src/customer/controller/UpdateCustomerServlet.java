package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.CustTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;

/**
 * Servlet implementation class UpdateCustomerServlet
 */
@WebServlet(name = "UpdateCustomer", urlPatterns = { "/updateCustomer" })
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩		
		//2.view에서 넘어온 값 저장
		Customer customer = CustTemplate.setCust(request);		
		//3.비지니스로직처리
		int result = new CustomerService().updateCustomer(customer);
		//4.결과처리	
		if(result > 0 ) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/updateCustomerFrm.jsp");
			request.setAttribute("customer", customer);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "회원수정에 실패했습니다.");
			request.setAttribute("loc", "/WEB-INF/views/customer/updateCustomerFrm.jsp");
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
