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
		c1.setAge(22);
		c1.setName("이름1");
		c1.setAge(25);
		c1.setName("이름2");
		c1.setAge(27);
		c1.setName("이름3");
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
