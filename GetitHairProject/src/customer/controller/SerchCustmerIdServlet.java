package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;

/**
 * Servlet implementation class SerchCustmerIdServlet
 */
@WebServlet(name = "SerchCustmerIdServlet", urlPatterns = { "/serchCustmerId" })
public class SerchCustmerIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SerchCustmerIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerName = request.getParameter("customerName");
		String customerPhone = request.getParameter("customerPhone");		
		Customer cust = new CustomerService().selectOneSerchId(customerName, customerPhone);
		System.out.println("customerName = " + customerName);
		System.out.println("customerPhone = " + customerPhone);
		System.out.println("cust = " + cust);
		if(cust==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "조회 할 수 없습니다.");
			request.setAttribute("loc", "/serchCustmerId");
			rd.forward(request, response);
		}else {
			String stringResult = cust.getCustomerId();
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/findSuccess.jsp");
			request.setAttribute("msg", "성공했습니다!");
			request.setAttribute("option", 1);
			request.setAttribute("stringResult", stringResult);	
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
