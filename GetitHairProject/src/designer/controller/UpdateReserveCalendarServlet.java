package designer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import reserve.model.service.ReserveService;

/**
 * Servlet implementation class UpdateReserveCalendarServlet
 */
@WebServlet(name = "UpdateReserveCalendar", urlPatterns = { "/updateReserveCalendar" })
public class UpdateReserveCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReserveCalendarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		System.out.println(112);
		String Title = request.getParameter("JsonTitles");
		String Start = request.getParameter("JsonStartDate");
		String End = request.getParameter("JsonEndDate");
		String reserveNo = request.getParameter("JsonReserveNo");
		JsonParser parser = new JsonParser();
		JsonArray jsonTitle = (JsonArray)parser.parse(Title);
		JsonArray jsonStart = (JsonArray)parser.parse(Start);
		JsonArray jsonEnd = (JsonArray)parser.parse(End);
		JsonArray jsonNo = (JsonArray)parser.parse(reserveNo);
		System.out.println(jsonTitle);
		System.out.println(jsonStart);
		System.out.println(jsonEnd);
		System.out.println(jsonNo);
		//값 받기 끝
		for(int i = 0 ; i < jsonTitle.size() ; ++i) {
			String title = jsonTitle.get(i).toString().replaceAll("\"", "");
			String start = jsonStart.get(i).toString();
			String end = jsonEnd.get(i).toString();
			int no = Integer.parseInt(jsonNo.get(i).toString().replaceAll("\"", ""));
		
			DateFormat dateFormat = new SimpleDateFormat("\"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'\"");
			java.sql.Date startDate = null;
			java.sql.Date endDate = null;
			try {
				java.util.Date date = dateFormat.parse(start);
				startDate = new java.sql.Date(date.getTime());
				java.util.Date date1 = dateFormat.parse(end);
				endDate= new java.sql.Date(date1.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			result += new ReserveService().updateDateReserve(no, title, startDate, endDate);
		}
		System.out.println(119);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
