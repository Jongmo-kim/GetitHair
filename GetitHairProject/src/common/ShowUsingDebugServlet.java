package common;

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

/**
 * Servlet implementation class ShowUsingDebugServlet
 */
@WebServlet(name = "showUsingDebug", urlPatterns = { "/showUsingDebug" })
public class ShowUsingDebugServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowUsingDebugServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer c1 = new Customer();
		Customer c2 = new Customer();
		Customer c3 = new Customer();
		c1.setCustomerNo(1);
		c1.setCustomerId("아이디1");
		c1.setCustomerPw("이름1");
		c1.setCustomerGen("성별1");
		c1.setCustomerName("이름1");
		c1.setCustomerEmail("이메일1");
		c1.setCustomerAddr("주소1");
		c1.setCustomerPhone("휴대폰번호1");
		c1.setAddrDetail("상세주소1");
		c1.setAddrPostcode("우편번호1");
		c2.setCustomerNo(2);
		c2.setCustomerId("아이디2");
		c2.setCustomerPw("이름2");
		c2.setCustomerGen("성별2");
		c2.setCustomerName("이름2");
		c2.setCustomerEmail("이메일2");
		c2.setCustomerAddr("주소2");
		c2.setCustomerPhone("휴대폰번호2");
		c2.setAddrDetail("상세주소2");
		c2.setAddrPostcode("우편번호2");
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(c1);
		list.add(c2);
		list.add(c3);
		HttpSession session = request.getSession();
		session.setAttribute("Objects", list);
		RequestDispatcher rd = request.getRequestDispatcher("/");
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
