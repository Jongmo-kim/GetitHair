package reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import reserve.model.service.ReserveService;
import reserve.model.vo.ReservePageData;

/**
 * Servlet implementation class UpdateReserveFrmServlet
 */
@WebServlet(name = "UpdateReserveFrm", urlPatterns = { "/updateReserveFrm" })
public class UpdateReserveFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReserveFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = new CustomerService().selectOneCustomer(Integer.parseInt(request.getParameter("customerNo")));
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
		ReservePageData rpd = new ReserveService().reserveSelectListCustomerSelStatus(reqPage, customer,selStatus,sqlAdd);		
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/customer/updateReserveFrm.jsp");
		request.setAttribute("customer", customer);
		request.setAttribute("selStatus", selStatus);
		request.setAttribute("list", rpd.getList());
		request.setAttribute("pageNavi", rpd.getPageNavi());
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
