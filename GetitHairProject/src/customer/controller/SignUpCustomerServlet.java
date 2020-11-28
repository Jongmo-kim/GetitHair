package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CustTemplate;
import common.DebugTemplate;
import common.HairinfoTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;
import hairshop.model.vo.Hairshop;

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
		Hairinfo hairinfo = HairinfoTemplate.setHairinfo(request);
		DebugTemplate.setCurrObjAtSession(request.getSession(), cust, "Customer");
		DebugTemplate.setCurrObjAtSession(request.getSession(), hairinfo, "hairInfo");
		//int result = new CustomerService().insertCustomer(cust,hairinfo);
		int result = new CustomerService().insertAllCustomer(cust, hairinfo);//태민변경테스트
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
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
		doGet(request, response);
	}

}
