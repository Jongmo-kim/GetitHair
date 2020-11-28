package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CustTemplate;
import common.HairinfoTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;

/**
 * Servlet implementation class UpdateAllCustomerServlet
 */
@WebServlet(name = "UpdateAllCustomer", urlPatterns = { "/updateAllCustomer" })
public class UpdateAllCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAllCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = CustTemplate.setCust(request);
		Hairinfo hairinfo = HairinfoTemplate.setHairinfo(request);
		int result = new CustomerService().updateAllHairinfo(customer,hairinfo);
		if(result>0) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/updateAllCustomerFrm.jsp");
			request.setAttribute("msg", "회원정보 수정완료");
			request.setAttribute("customer", customer);	
			request.setAttribute("hairinfo", hairinfo);
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
