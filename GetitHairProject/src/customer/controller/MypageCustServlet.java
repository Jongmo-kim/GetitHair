package customer.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import review.model.service.ReviewService;
import review.model.vo.Review;


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
		//예약 리스트 view에서 저장
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
		
		//예약리스트 비지니스로직
		ReservePageData rpd = new ReserveService().reserveSelectListCustomerSelStatus(reqPage, loginCustomer,selStatus,sqlAdd);
		if(rpd == null) {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "리스트를 조회할 수 없습니다.");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}
		if(rpd.getList().size()==0) {
			reqPage--;
			if(reqPage <=0) {
				reqPage =1;
			}
		}			
		RequestDispatcher rd1 =request.getRequestDispatcher("/WEB-INF/views/customer/mypageCust.jsp");		
		request.setAttribute("reserveList", rpd.getList()); 
		request.setAttribute("pageNavi", rpd.getPageNavi()); 
		request.setAttribute("selStatus", selStatus);
		request.setAttribute("reqPage", reqPage);
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
