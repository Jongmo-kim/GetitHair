package admin.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.mypage.model.service.AdminService;
import customer.model.vo.Customer;

/**
 * Servlet implementation class SearchCustomerIdServlet
 */
@WebServlet("/searchCustomer")
public class SearchCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchCustomerServlet() {
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
		//전달 받은 값 저장
		//type value 1 : 아이디로 검색 , 2 : 이름으로 검색
		int type = Integer.parseInt(request.getParameter("searchType"));
		String keyword = request.getParameter("keyword");
		
		//비즈니스 로직
		ArrayList<Customer> list = null;
		if(type == 1)
			list = new AdminService().getCustomerListById(keyword);
		else if(type == 2) {
			list = new AdminService().getCustomerListByName(keyword);
		}

		// 값 전달
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		// 메인 관리페이지로 이동
		request.getRequestDispatcher("/WEB-INF/views/mypage/admin/mypageAdminCustomer.jsp").forward(request, response);
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
