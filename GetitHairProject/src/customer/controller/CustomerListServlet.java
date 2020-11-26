package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import customer.model.vo.CustomerPageData;

/**
 * Servlet implementation class CustomerListServlet
 */
@WebServlet(name = "CustomerList", urlPatterns = { "/customerList" })
public class CustomerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//2.view에서 넘어온 값 저장
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		//3.비지니스로직처리
		CustomerPageData cpd = new CustomerService().customerSelectList(reqPage);
		//4.결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/");
		request.setAttribute("list", cpd.getList());
		request.setAttribute("pageNavi", cpd.getPageNavi());
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
