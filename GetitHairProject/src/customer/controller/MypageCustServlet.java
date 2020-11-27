package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import customer.model.vo.Customer;

import reserve.model.service.ReserveService;
import reserve.model.vo.ReservePageData;


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
		HttpSession session = request.getSession(false);
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");		
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String selStatus = request.getParameter("selStatus");
		ReservePageData rpd = null;
		
		if(selStatus.equals("전체")) {
			rpd = new ReserveService().reserveSelectList(reqPage);
		}else {
			rpd = new ReserveService().reserveSelectListSelStatus(reqPage,selStatus);
		}
		if(loginCustomer!=null) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");	
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("list", rpd.getList());
			request.setAttribute("pageNavi", rpd.getReqPage());
			request.setAttribute("selStatus", selStatus);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "회원정보가 없습니다. 로그인부터 해주세요.");
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
