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
		Review r = new Review();
		int reviewNo; 
		if(request.getParameter("reviewNo")==null || request.getParameter("reviewNo").equals("")) {
			reviewNo =-1;
		}else {
			reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		}
		//int reviewNo = request.getParameter("reviewNo")==null|| request.getParameter("reviewNo").equals("") ?  -1:Integer.parseInt(request.getParameter("reviewNo"));
		int shopNo = request.getParameter("shopNo")==null ?  -1:Integer.parseInt(request.getParameter("shopNo"));
		int designerNo = request.getParameter("designerNo")==null ?  -1:Integer.parseInt(request.getParameter("designerNo"));
		int customerNo = request.getParameter("customerNo")==null ?  -1:Integer.parseInt(request.getParameter("customerNo"));		
		int styleNo = request.getParameter("styleNo")==null ?  -1:Integer.parseInt(request.getParameter("styleNo"));
		String reviewContent = request.getParameter("reviewContent");
		int reviewRate = request.getParameter("reviewRate")==null ?  -1:Integer.parseInt(request.getParameter("reviewRate"));
		int reviewLikes = request.getParameter("reviewLikes")==null ?  -1:Integer.parseInt(request.getParameter("reviewLikes"));		
		
		if(request.getParameter("reviewDate")!=null ) {
			String reviewDate  = request.getParameter("reviewDate");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				java.util.Date to = sdf.parse(reviewDate);			
				java.sql.Date sqlDate = new java.sql.Date(to.getTime());			
				r.setReviewDate(sqlDate);	
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				java.util.Date to = sdf.parse("1900-01-01");			
				java.sql.Date sqlDate = new java.sql.Date(to.getTime());			
				r.setReviewDate(sqlDate);	
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("ReviewTemplate reviewNo = "+reviewNo);
		System.out.println("ReviewTemplate shopNo = "+shopNo);
		System.out.println("ReviewTemplate designerNo = "+designerNo);
		System.out.println("ReviewTemplate customerNo = "+customerNo);
		System.out.println("ReviewTemplate styleNo = "+styleNo);
		System.out.println("ReviewTemplate reviewContent = "+reviewContent);
		System.out.println("ReviewTemplate reviewRate = "+reviewRate);
		System.out.println("ReviewTemplate reviewLikes = "+reviewLikes);
		//System.out.println("ReviewTemplate reviewDate = "+reviewDate);
		
		
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
		
		r.setReviewNo(reviewNo);
		r.setShop(s);
		r.setDesigner(d);
		r.setCustomer(c);
		r.setStyle(style);		
		
				
		
		r.setReviewContent(reviewContent);
		r.setReviewRate(reviewRate);
		r.setReviewLikes(reviewLikes);
		//r.setReviewDate(reviewDate);		
		return r;
		
	}
}
