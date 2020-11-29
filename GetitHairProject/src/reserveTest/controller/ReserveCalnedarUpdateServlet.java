package reserveTest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import reserveTest.model.service.ReserveTestService;
import reserveTest.model.vo.ReserveTest;

/**
 * Servlet implementation class ReserveCalnedaUpdateServlet
 */
@WebServlet(name = "ReserveCalnedarUpdate", urlPatterns = { "/reserveCalnedarUpdate" })
public class ReserveCalnedarUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveCalnedarUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. view에서 넘어오는 데이터 처리
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		// 3. 비지니스 처리
		// reserveNo로 reserve갖고온다
		 ReserveTest rt = new ReserveTestService().selectOneReserveTest(reserveNo);
		//가져온 reserve객체를 json으로 각각 변환한다.
		JSONObject jsonRt = new JSONObject();
		jsonRt.put("reserveNo", rt.getReserveNo());
		jsonRt.put("reserveStartDate", rt.getReserveStartDate().getTime());
		jsonRt.put("reserveEndDate", rt.getReserveEndDate().getTime());
		jsonRt.put("reserveTitle", URLEncoder.encode(rt.getReserveTitle(),"utf-8"));
		jsonRt.put("reserveStatus", URLEncoder.encode(rt.getReserveStatus(),"utf-8"));
		jsonRt.put("reserveCustReq", URLEncoder.encode(rt.getReserveCustReq(),"utf-8"));
		jsonRt.put("reserveDesignerReq", URLEncoder.encode(rt.getReserveDesignerReq(),"utf-8"));
		jsonRt.put("reserveDisignerMemo", URLEncoder.encode(rt.getReserveDesignerMemo(),"utf-8"));
		jsonRt.put("customerName",  rt.getCustomer().getCustomerName());
		response.setContentType("text/html;charset=UTF-8"); 

		System.out.println(URLEncoder.encode(rt.getCustomer().getCustomerName(),"utf-8"));
		System.out.println(rt.getCustomer().getCustomerName());
		PrintWriter out = response.getWriter();
		out.print(jsonRt);
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
