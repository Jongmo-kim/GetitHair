package customer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class MypageCustReviewAjaxServlet
 */
@WebServlet(name = "MypageCustReviewAjax", urlPatterns = { "/mypageCustReviewAjax" })
public class MypageCustReviewAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCustReviewAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo =-1;
		if(request.getParameter("reviewNo") == null) {
			reviewNo = 1000;
		}else {
			reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		}
		Review r = new ReviewService().selectOneReview(reviewNo);
		if(r==null) {
			r= new Review();
		}
		java.util.Date reviewDate = r.getReviewDate();
		String shopName = r.getShop().getShopName();
		String designerName = r.getDesigner().getDesignerName();
		String styleName = r.getStyle().getStyleName();
		String reviewContent = r.getReviewContent();
		
		JSONObject result = new JSONObject();
		result.put("reviewDate", URLEncoder.encode(reviewDate.toString(),"UTF-8"));
		result.put("reviewNo", reviewNo);	
		result.put("shopName",URLEncoder.encode(shopName.toString(),"UTF-8"));
		result.put("designerName",URLEncoder.encode(designerName.toString(),"UTF-8"));
		result.put("styleName",URLEncoder.encode(styleName.toString(),"UTF-8"));
		result.put("reviewContent",URLEncoder.encode(reviewContent.toString(),"UTF-8"));
	
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
