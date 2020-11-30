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
import review.model.vo.Review;
import style.model.service.StyleService;
import style.model.vo.Style;

public class ReviewTemplate {
	public static Review setReview(HttpServletRequest request) {
		int reviewNo = request.getParameter("reviewNo")==null ?  -1:Integer.parseInt(request.getParameter("reviewNo"));
		int shopNo = request.getParameter("shopNo")==null ?  -1:Integer.parseInt(request.getParameter("shopNo"));
		int designerNo = request.getParameter("designerNo")==null ?  -1:Integer.parseInt(request.getParameter("designerNo"));
		int customerNo = request.getParameter("customerNo")==null ?  -1:Integer.parseInt(request.getParameter("customerNo"));		
		int styleNo = request.getParameter("styleNo")==null ?  -1:Integer.parseInt(request.getParameter("styleNo"));
		String reviewContent = request.getParameter("reviewContent");
		int reviewRate = request.getParameter("reviewRate")==null ?  -1:Integer.parseInt(request.getParameter("reviewRate"));
		int reviewLikes = request.getParameter("reviewLikes")==null ?  -1:Integer.parseInt(request.getParameter("reviewLikes"));		
		String reviewDate = request.getParameter("reviewDate");
		
		Hairshop s = new HairshopService().selectOneHairshop(shopNo);
		if( s ==null) {
			s = new Hairshop();
		}
		Designer d = new DesignerService().selectOneDesigner(designerNo);
		if(d == null) {
			d = new Designer();
		}
		
		Customer c = new CustomerService().selectOneCustomer(customerNo);
		if(c==null) {
			c = new Customer();
		}
		Style style = new StyleService().selectOneStyle(styleNo);
		if(style ==null) {
			style = new Style();
		}		
		Review r = new Review();
		r.setReviewNo(reviewNo);
		r.setShop(s);
		r.setDesigner(d);
		r.setCustomer(c);
		r.setStyle(style);		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date to = sdf.parse(reviewDate);			
			java.sql.Date sqlDate = new java.sql.Date(to.getTime());			
			r.setReviewDate(sqlDate);	
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		r.setReviewContent(reviewContent);
		r.setReviewRate(reviewRate);
		r.setReviewLikes(reviewLikes);
		//r.setReviewDate(reviewDate);		
		return r;
		
	}
}
