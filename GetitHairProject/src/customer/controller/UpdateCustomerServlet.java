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
		request.setCharacterEncoding("utf-8");
		//2.view에서 넘어온 값 저장
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		String customerId = request.getParameter("customerId");
		String customerPw = request.getParameter("customerPw");
		String customerGen = request.getParameter("customerGen");
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String customerAddr = request.getParameter("customerAddr");
		String customerPhone = request.getParameter("customerPhone");
		String addrDetail = request.getParameter("addrDetail");
		String addrPostcode = request.getParameter("addrPostcode");
		String customerBirthdate = request.getParameter("customerBirthdate");
		String customerEnrolldate = request.getParameter("customerEnrolldate");
		
		/*
		customerNo = 1;
		customerId = "user01";
		customerPw = "1234";
		customerGen = "남성";
		customerName = "이름01";
		customerEmail = "이메일01";
		customerAddr = "주소01";
		customerPhone = "번호01";
		addrDetail = "상세주소01";
		addrPostcode = "우편번호01";
		customerBirthdate = "20201123";
		customerEnrolldate = "20201123";		
		*/
		
		Customer customer = new Customer();
		customer.setAddrDetail(addrDetail);
		customer.setAddrPostcode(addrPostcode);
		customer.setCustomerAddr(customerAddr);
		customer.setCustomerBirthdate(customerBirthdate);
		customer.setCustomerEmail(customerEmail);
		customer.setCustomerEnrolldate(customerEnrolldate);
		customer.setCustomerGen(customerGen);
		customer.setCustomerId(customerId);
		customer.setCustomerName(customerName);
		customer.setCustomerNo(customerNo);
		customer.setCustomerPhone(customerPhone);
		customer.setCustomerPw(customerPw);
		//3.비지니스로직처리
		int result = new CustomerService().updateCustomer(customer);
		//4.결과처리		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");
		request.setAttribute("customer", customer);
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
