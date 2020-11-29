package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.mypage.model.service.AdminService;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;

/**
 * Servlet implementation class IntegratedLoginServlet
 */
@WebServlet(name = "IntegratedLogin", urlPatterns = { "/integratedLogin" })
public class IntegratedLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntegratedLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURL = "/";
		String loginType = request.getParameter("loginType");
		String inputId = request.getParameter("inputId");
		String inputPw = request.getParameter("inputPw");
		
		HttpSession session = request.getSession();
		boolean isLogined = false;
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		switch(loginType) {
			case "customer":
				
				Customer loginCust = new CustomerService().selectOneCustomer(inputId,inputPw);
				
				isLogined = loginCust != null;
				session.setAttribute("loginCustomer", loginCust);
				session.setAttribute("loginType", loginType);
				break;
			case "designer":
				Designer loginDesigner = new DesignerService().selectOneDesigner(inputId, inputPw);
				isLogined = loginDesigner != null;
				System.out.println(inputId);
				System.out.println(inputPw);
				session.setAttribute("loginDesigner", loginDesigner);
				session.setAttribute("loginType", loginType);
				break;
			case "hairshop":
//				Hairshop loginHairshop = new HairshopService().selectOneHairshop(inputId,inputPw);
//				session.setAttribute("loginHairshop", loginHairshop);
//				isLogined = loginCust == null; 
				break;
			case "admin":
//				Admin loginAdmin = new AdminService().selectOneAdmin(inputId,inputPw);
//				session.setAttribute("loginAdmin", loginAdmin);
//				isLogined = loginCust == null; 
				break;
		}
		if(isLogined) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 성공");			
		} else {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 실패");		
		}
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
