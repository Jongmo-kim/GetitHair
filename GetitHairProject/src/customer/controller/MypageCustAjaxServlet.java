package customer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class MypageCustAjaxServlet
 */
@WebServlet(name = "MypageCustAjax", urlPatterns = { "/mypageCustAjax" })
public class MypageCustAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCustAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selStatus = request.getParameter("selStatus");
		int index = Integer.parseInt(request.getParameter("index"));
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		System.out.println("selStatus = "+selStatus);
		System.out.println("index = "+index);
		System.out.println("reqPage = "+reqPage);
		
		JsonParser parser = new JsonParser();		
		JsonObject jsonChklist = (JsonObject)parser.parse(selStatus);	
		
		JSONObject result = new JSONObject();
		result.put("selStatus", URLEncoder.encode(selStatus, "UTF-8"));
		result.put("index", index);
		result.put("reqPage", reqPage);
		System.out.println(result);		
		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(result);
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
