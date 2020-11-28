package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class test2FormServlet
 */
@WebServlet(name = "test2Form", urlPatterns = { "/test2Form" })
public class test2FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test2FormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Title = request.getParameter("JsonTitles");
		String Start = request.getParameter("JsonStartDate");
		String End = request.getParameter("JsonEndDate");
		JsonParser parser = new JsonParser();
		JSONObject jTitle = new JSONObject();
		JsonArray jsonTitle = (JsonArray)parser.parse(Title);
		JsonArray jsonStart = (JsonArray)parser.parse(Start);
		JsonArray jsonEnd = (JsonArray)parser.parse(End);
		//값 받기 끝
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
