package reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class DeleteReserveListServlet
 */
@WebServlet(name = "DeleteReserveList", urlPatterns = { "/deleteReserveList" })
public class DeleteReserveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReserveListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//view에서 넘어온 값저장
		String JsonChkList = request.getParameter("JsonChkList");		
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));	
		String selStatus = request.getParameter("selStatus");
		int result = 0;
		int reserveNo = 0;		
		JsonParser parser = new JsonParser();		
		JsonArray jsonChklist = (JsonArray)parser.parse(JsonChkList);			
		//비지니스 로직		
		for(int i=0;i<jsonChklist.size();i++) {
			reserveNo = Integer.parseInt(jsonChklist.get(i).toString().replace("\"", ""));					
			result += new ReserveService().deleteReserve(reserveNo);
		}		
		//RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		//if(result>0) {			
		//	request.setAttribute("msg", "예약리스트에서 삭제 완료되었습니다.");
		//	request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
		//}else {
		//	request.setAttribute("msg", "예약리스트에서 삭제 실패되었습니다.");
		//	request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
		//}
		//rd.forward(request, response);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.print(reqPage);
		out.print(selStatus);
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
