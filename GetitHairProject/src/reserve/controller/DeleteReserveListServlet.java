package reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
		System.out.println("selStatus = " + selStatus);
		System.out.println("beforeReqPage = " + reqPage);
		int result = 0;
		int reserveNo = 0;		
		JsonParser parser = new JsonParser();		
		JsonArray jsonChklist = (JsonArray)parser.parse(JsonChkList);			
		//비지니스 로직	
		Reserve reserve = new ReserveService().selectOneReserve(reserveNo);		
		int maxPrintSize = 10;
		int beforeTotalPage = new  ReserveService().getAllReserveMaxPageSize(maxPrintSize,selStatus);
		//System.out.println("beforeTotalPage = "+beforeTotalPage);
	//	System.out.println("jsonChklist.size() = "+jsonChklist.size());
		for(int i=0;i<jsonChklist.size();i++) {
		//	System.out.println("JsonChkList("+i+") = "+jsonChklist.get(i).toString());
		//	System.out.println("JsonChkList("+i+").replace = "+jsonChklist.get(i).toString().replace("\"", ""));
			reserveNo = Integer.parseInt(jsonChklist.get(i).toString().replace("\"", ""));		
		//	System.out.println("reserveNo = "+reserveNo);
			result += new ReserveService().deleteReserve(reserveNo);
		}
		if(result>0) {
			//System.out.println("result = "+result);
			reserve = new ReserveService().selectOneReserve(reserveNo); //customer정보조회때문에 reserve객체생성
			int afterTotalPage = new  ReserveService().getAllReserveMaxPageSize(maxPrintSize,selStatus);
		//	System.out.println("afterTotalPage = "+afterTotalPage);
			if(beforeTotalPage>afterTotalPage) {
				reqPage--;
				if (reqPage <= 0) {
					reqPage = 1;
				}
			}

			//System.out.println("afterReqPage = " + reqPage);
		}
		JSONObject resultJson = new JSONObject();
		resultJson.put("result", result);
		resultJson.put("reqPage", reqPage);
		resultJson.put("selStatus", URLEncoder.encode(selStatus.toString(),"UTF-8"));
		
		//System.out.println("resultJson = "+resultJson);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(resultJson);
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
