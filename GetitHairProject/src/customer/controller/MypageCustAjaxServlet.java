package customer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;

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
import reserve.model.vo.ReservePageData;

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
		int reserveNo =-1;
		if(request.getParameter("reserveNo") == null) {
			reserveNo = 1000;
		}else {
			reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		}		
		//System.out.println("reserveNo = "+reserveNo);
		Reserve r = new ReserveService().selectOneReserve(reserveNo);
		if(r==null) {
			r = new Reserve();
		}
		//System.out.println("reserve ="+r);
		//show영역
		String reserveShopName =  r.getShop().getShopName();
		String reserveDesignerName =  r.getDesigner().getDesignerName();
		String reserveStatus =r.getReserveStatus();
		String reserveDesignerReq = r.getReserveDesignerReq();
		java.util.Date reserveDate = r.getReserveDate();	
		//java.util.Date reserveTime = r.getReserveDate();
		java.sql.Date sqlDate = new java.sql.Date(reserveDate.getTime());
		//System.out.println("sqlDate="+sqlDate);
		SimpleDateFormat timeSdf = new SimpleDateFormat("HH:mm");
		//SimpleDateFormat time1Sdf = new SimpleDateFormat("YYYY-MM-dd'Y'HH:mm");
		//System.out.println("sqlDate="+time1Sdf.format(sqlDate));
		//String resultTime1 = time1Sdf.format(sqlDate);
		String resultTime2 = timeSdf.format(sqlDate);
		//System.out.println("resultTime1= "+resultTime1);
		//System.out.println("resultTime2= "+resultTime2);
		//Timestamp timestamp  = new Timestamp(resultDate);
		//long timeSdfDate = timeSdf.parse(sqlDate);		
		String  reserveCustReq = r.getReserveCustReq();
		//hidden영역
		int reserveCustomerNo = r.getCustomer().getCustomerNo();
		int reserveDesignerNo = r.getDesigner().getDesignerNo();
		int reserveShopNo = r.getShop().getShopNo();
		int reserveStylelistNo = r.getStylelist().getStylelistNo(); //스타일객체수정시 보여주기
		String reserveTitle = r.getReserveTitle();
		String reserveDesignerMemo = r.getReserveDesignerMemo();
		java.util.Date reserveStartDate = r.getReserveStartdate();
		java.util.Date reserveEndDate = r.getReserveEndDate();
		if(reserveDesignerReq == null) {
			reserveDesignerReq="(null)";
		}
		if(reserveDesignerMemo==null) {
			reserveDesignerMemo="(null)";
		}	
		
		JSONObject result = new JSONObject();	
		//result.put("reserveNo", reserveNo);//int타입시 사용하기
		//result.put("reserveShopName", URLEncoder.encode(reserveShopName.toString(),"UTF-8")); //String사용시
		//show영역		
		result.put("reserveNo", reserveNo);		
		result.put("reserveShopName", URLEncoder.encode(reserveShopName.toString(),"UTF-8"));
		result.put("reserveDesignerName", URLEncoder.encode(reserveDesignerName.toString(),"UTF-8"));
		result.put("reserveStatus", URLEncoder.encode(reserveStatus.toString(),"UTF-8"));		
		result.put("reserveDesignerReq", URLEncoder.encode(reserveDesignerReq.toString(),"UTF-8"));
		result.put("reserveDate", URLEncoder.encode(reserveDate.toString(),"UTF-8"));
		result.put("reserveTime", URLEncoder.encode(resultTime2.toString(),"UTF-8"));
		result.put("reserveCustReq", URLEncoder.encode(reserveCustReq.toString(),"UTF-8"));
		//hidden영역
		result.put("customerNo", reserveCustomerNo);
		result.put("designerNo",reserveDesignerNo );
		result.put("shopNo",reserveShopNo);
		result.put("stylelistNo",reserveStylelistNo);
		result.put("reserveTitle ", URLEncoder.encode(reserveTitle .toString(),"UTF-8"));
		result.put("reserveDesignerMemo", URLEncoder.encode(reserveDesignerMemo.toString(),"UTF-8"));
		result.put("reserveStartDate", URLEncoder.encode(reserveStartDate.toString(),"UTF-8"));
		result.put("reserveEndDate", URLEncoder.encode(reserveEndDate.toString(),"UTF-8"));		
		//System.out.println(result);			
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
