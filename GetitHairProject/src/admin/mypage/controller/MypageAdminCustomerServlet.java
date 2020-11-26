package admin.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.mypage.model.service.AdminService;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import review.model.service.ReviewService;

/**
 * Servlet implementation class MypageAdminCustomerServlet
 */
@WebServlet("/mypageAdminCustomer")
public class MypageAdminCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MypageAdminCustomerServlet() {
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
		// 전달 받은 값 저장
		// type value 1 : 아이디로 검색 , 2 : 이름으로 검색
		int type = request.getParameter("searchType") != null ? Integer.parseInt(request.getParameter("searchType")) : 0;
		String keyword = request.getParameter("keyword");

		// 비즈니스 로직
		ArrayList<Customer> list = null;
		if(type == 1 && !keyword.equals("")) { //id 검색일 경우
			list = new AdminService().getCustomerListById(keyword);
		}else if(type == 2 && !keyword.equals("")){ //name 검색일 경우 
			list = new AdminService().getCustomerListByName(keyword);		
		}else { //검색이 아닐경우
			list = new CustomerService().selectAllCusetomer();
		}

		// 값 전달
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("list", list);
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
