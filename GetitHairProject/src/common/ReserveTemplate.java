package common;



import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import reserve.model.vo.Reserve;

public class ReserveTemplate {
	public static Reserve setReserve(HttpServletRequest request) {
		int reserveNo = request.getParameter("reserveNo")==null ?  -1:Integer.parseInt(request.getParameter("reserveNo"));
		int customerNo = request.getParameter("customerNo")==null ?  -1:Integer.parseInt(request.getParameter("customerNo"));
		int designerNo = request.getParameter("designerNo")==null ?  -1:Integer.parseInt(request.getParameter("designerNo"));
		int shopNo = request.getParameter("shopNo")==null ?  -1:Integer.parseInt(request.getParameter("shopNo"));
		String reserveDate = request.getParameter("reserveDate");
		String reserveStatus = request.getParameter("reserveStatus");
		String reserveCustReq = request.getParameter("reserveCustReq");
		String reserveDesignerReq = request.getParameter("reserveDesignerReq");
		String reserveDesignerMemo = request.getParameter("reserveDesignerMemo");
		Customer c = new CustomerService().selectOneCustomer(customerNo);
		if(c==null) {
			c = new Customer();
		}
		Designer d = new DesignerService().selectOneDesigner(designerNo);
		if(d == null) {
			d = new Designer();
		}
		Hairshop s = new HairshopService().selectOneHairshop(shopNo);
		if( s ==null) {
			s = new Hairshop();
		}
		Reserve r = new Reserve();
		r.setCustomer(c);
		r.setDesigner(d);
		r.setReserveCustReq(reserveCustReq);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date to = sdf.parse(reserveDate);
			java.sql.Date sqlDate = new java.sql.Date(to.getTime());
			r.setReserveDate(sqlDate);	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		r.setReserveDesignerMemo(reserveDesignerMemo);
		r.setReserveDesignerReq(reserveDesignerReq);
		r.setReserveNo(reserveNo);
		r.setReserveStatus(reserveStatus);
		r.setShop(s);
		
		return r;
		
	}
}
