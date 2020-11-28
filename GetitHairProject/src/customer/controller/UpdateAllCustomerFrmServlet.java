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
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;

/**
 * Servlet implementation class UpdateAllCustomerFrmServlet
 */
@WebServlet(name = "UpdateAllCustomerFrm", urlPatterns = { "/updateAllCustomerFrm" })
public class UpdateAllCustomerFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAllCustomerFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		Customer customer = new CustomerService().selectOneCustomer(customerNo);
		Hairinfo hairinfo = new HairinfoService().selectOneHairinfo(customerNo);		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/updateAllCustomerFrm.jsp");
		request.setAttribute("customer", customer);	
		request.setAttribute("hairinfo", hairinfo);
		request.setAttribute("msg", "");
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
