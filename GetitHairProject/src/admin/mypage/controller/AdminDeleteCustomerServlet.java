package admin.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;

/**
 * Servlet implementation class DeleteCustomerServlet
 */
@WebServlet("/adminDeleteCustomer")
public class AdminDeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteCustomerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 값 받기
		String[] customerNo = request.getParameterValues("customerNo");

		// 비즈니스 로직
		int result = 0;
		for (int i = 0; i < customerNo.length; i++) {
			result += new CustomerService().deleteCustomer(Integer.parseInt(customerNo[i]));
		}

		if (result > 0) {
			request.setAttribute("msg", "삭제에 성공하였습니다.");
			request.setAttribute("loc", "/mypageAdminCustomer");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			System.out.println("회원 삭제 완료");
			
		} else {
			request.setAttribute("msg", "삭제에 실패했습니다.");
			request.setAttribute("loc", "/mypageAdminCustomer");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
