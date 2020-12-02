package customer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;

/**
 * Servlet implementation class IdNestedCheckServlet
 */
@WebServlet(name = "IdNestedCheck", urlPatterns = { "/idNestedCheck" })
public class IdNestedCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdNestedCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputId = request.getParameter("inputId");
		boolean isNested = new CustomerService().isNestedId(inputId);
		JSONObject jObj = new JSONObject();
		response.setContentType("applaction/json");
		jObj.put("isNested", isNested);
		PrintWriter out = response.getWriter();
		out.print(jObj);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
