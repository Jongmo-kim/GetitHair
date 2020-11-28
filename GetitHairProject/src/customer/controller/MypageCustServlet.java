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
import reserve.model.vo.Reserve;
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
		if(loginCustomer == null ) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "회원정보가 일치하지않습니다. 회원으로 로그인해주세요");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String selStatus = request.getParameter("selStatus");
		String sqlAdd ="";
		if(selStatus.equals("예약")) {
			sqlAdd = " and reserve_status='예약' ";
		}else if(selStatus.equals("완료")) {
			sqlAdd = " and reserve_status='완료' ";
		}else if(selStatus.equals("취소")) {
			sqlAdd = " and reserve_status='취소' ";
		}		
		//System.out.println("loginCustomer.custNo = "+loginCustomer.getCustomerNo());
		//System.out.println("reqPage = "+reqPage);
		//System.out.println("selStatus = "+selStatus);
		//System.out.println("sqlAdd = "+sqlAdd);
		ReservePageData rpd = new ReserveService().reserveSelectListCustomerSelStatus(reqPage, loginCustomer,selStatus,sqlAdd);
		//System.out.println("rpd.listSize = "+rpd.getList().size());
		//System.out.println("rpd.pageNavi = "+rpd.getPageNavi());
		RequestDispatcher rd1 =request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");
		RequestDispatcher rd2 =request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuestReserveList.jsp");		
		request.setAttribute("customer", loginCustomer);
		request.setAttribute("selStatus", selStatus);
		request.setAttribute("list", rpd.getList());
		request.setAttribute("pageNavi", rpd.getPageNavi());
		rd1.forward(request, response);	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
