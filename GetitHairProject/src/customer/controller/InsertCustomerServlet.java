package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import common.CustTemplate;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;

/**
 * Servlet implementation class InsertCustomerServlet
 */
@WebServlet(name = "InsertCustomer", urlPatterns = { "/insertCustomer" })
public class InsertCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		//2.view에서 넘어온값저장
		if(!ServletFileUpload.isMultipartContent(request)) {
			 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			 request.setAttribute("msg","공지사항 작성 오류[enctype]");
			 request.setAttribute("loc","/");		 
			 rd.forward(request, response);
			 return;
		}
		Customer customer =  CustTemplate.setCust(request);
		//3.비지니스로직
		int result = new CustomerService().insertCustomer(customer);
		//4.결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");
		if(result>0) {
			request.setAttribute("msg", "회원가입성공");
		}else {
			request.setAttribute("msg", "회원가입실패");
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
