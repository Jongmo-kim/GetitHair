package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import common.DebugModeServlet;
import common.DebugTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;


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
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.view에서 넘어온 값저장
		String customerId = request.getParameter("customerId");
		customerId = "user10"; //로그인한 ID입니다. 임시로 셋팅했어요 
		//3.비지니스 로직처리		
		Customer customer = new CustomerService().selectOneCustomer(customerId);
		//4.결과처리		
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");
		request.setAttribute("customer", customer);
		rd.forward(request, response);
		//2.view에서 넘어온 값저장
		String customerId = request.getParameter("customerId");
		customerId = "user10"; //로그인한 ID입니다. 임시로 셋팅했어요 
		
		//3.비지니스 로직처리		
		Customer customer = new CustomerService().selectOneCustomer(customerId);		
		int customerNo = customer.getCustomerNo();
		Hairinfo hairinfo = new HairinfoService().selectOneHairinfo(customerNo);
		//4.결과처리		
		if(customer !=null && hairinfo!=null) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");
			request.setAttribute("customer", customer);
			request.setAttribute("hairinfo", hairinfo);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "회원조회가 실패했습니다.");
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
