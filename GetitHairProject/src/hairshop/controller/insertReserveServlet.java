package hairshop.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import designer.model.service.DesignerService;
import hairshop.model.service.HairshopService;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;
import stylelist.model.service.StylelistService;
import stylelist.model.vo.Stylelist;

/**
 * Servlet implementation class insertReserveServlet
 */
@WebServlet(name = "InsertReserve", urlPatterns = { "/insertReserve" })
public class insertReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reserve rs = new Reserve();
		int designerNo = Integer.parseInt(request.getParameter("desinerNo"));
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		String startDate = request.getParameterValues("startDate")[0];
		String custReq = request.getParameter("custReq");
		String title = request.getParameter("title");
		String status = request.getParameter("status");
		String endDate = request.getParameter("endDate");
		Stylelist stli = new StylelistService().selectOneStylelistDesignerNo(designerNo);
		HttpSession session = request.getSession();
		Customer loginCust = (Customer)session.getAttribute("loginCustomer");   
		System.out.println(loginCust);
		rs.setStylelist(stli);
		rs.setCustomer(loginCust);
		rs.setDesigner(new DesignerService().selectOneDesigner(designerNo));
		rs.setShop(new HairshopService().selectOneHairshop(shopNo));
		rs.setReserveCustReq(custReq);
		rs.setReserveTitle(title);
		rs.setReserveStatus(status);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Date utilDate;
		rs.setReserveDate(new java.sql.Date(new Date().getTime()));
		try {
			utilDate = dateFormat.parse(startDate);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			rs.setReserveStartdate(sqlDate);
			rs.setReserveEndDate(sqlDate);
			int result = new ReserveService().insertReserve(rs);
			if(result >0) {
				request.setAttribute("msg", "예약을 완료하였습니다.");
				request.setAttribute("loc", "/hairshop");
			}else {
				request.setAttribute("msg", "로그인 후 이용해주세요.");
				request.setAttribute("loc", "/");
			}
			request.getRequestDispatcher("WEB-INF/views/common/msg.jsp").forward(request, response);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
