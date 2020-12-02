package reserve.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jmx.snmp.Timestamp;

import common.DebugTemplate;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class InsertReReserveServlet
 */
@WebServlet(name = "InsertReReserve", urlPatterns = { "/insertReReserve" })
public class InsertReReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reserveStatus = "(NUll)";			
		if(request.getParameter("reserveStatus") == null) {reserveStatus ="(Null)";}else {reserveStatus  = request.getParameter("reserveStatus");}
		String selStatus = request.getParameter("selStatus");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));	
		if(!reserveStatus.equals("예약")) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "상태코드가 예약에서만 작동됩니다.");			
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
			rd.forward(request, response);
		}
		int reserveNo=-1; String reserveCustReq ="(Null)";
		if(request.getParameter("reserveNo") == null) {	reserveNo =-1;}else {reserveNo = Integer.parseInt(request.getParameter("reserveNo"));}
		if(request.getParameter("reserveCustReq") == null) {reserveCustReq ="(Null)";}else {reserveCustReq  = request.getParameter("reserveCustReq");}	
		Reserve reserve = new ReserveService().selectOneReserve(reserveNo);		
		try {
			String dateStr = request.getParameterValues("reserveDate1")[0];
			String timeStr = request.getParameterValues("reserveDate2")[0];
			//System.out.println("time str :"+timeStr);
			//System.out.println("date str :"+dateStr);	
			SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat timeSdf = new SimpleDateFormat("HH:mm");
			SimpleDateFormat combineSdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			long timeSdfDate = timeSdf.parse(timeStr).getTime();
			long dateSdfDate = dateSdf.parse(dateStr).getTime();			
			long resultDate = timeSdfDate+dateSdfDate+32400000 ;	
			Timestamp timestamp  = new Timestamp(resultDate);
			//java.sql.Date sqlDate=  new java.sql.Date( combineSdf.format(new Date(timestamp.getDateTime())));
			java.sql.Date sqlDate = new java.sql.Date(timestamp.getDateTime());
			reserve.setReserveDate(sqlDate);
			//확인 코드 combineSdf.format 을 써야함
			//System.out.println("timestamp : " + combineSdf.format(new Date(timestamp.getDateTime())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		reserve.setReserveCustReq(reserveCustReq);		
		//DebugTemplate.setCurrObjAtSession(request.getSession(), reserve,"reserve");
		int result = new ReserveService().insertReReserve(reserve);
		System.out.println("insert = "+result);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");		
		if(result >0) {
			request.setAttribute("msg", "다시 예약 등록이 완료되었습니다.");			
		}else {
			request.setAttribute("msg", "다시 예약 등록이 실패되었습니다.");
		}
		request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
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
