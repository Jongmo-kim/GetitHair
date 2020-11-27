package common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;
import review.model.service.ReviewService;
import review.model.vo.Review;
import style.model.service.StyleService;
import style.model.vo.Style;

/**
 * Servlet implementation class ShowUsingDebugServlet
 */
@WebServlet(name = "showUsingDebug", urlPatterns = { "/showUsingDebug" })
public class ShowUsingDebugServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowUsingDebugServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer c1 = new CustomerService().selectOneCustomer(1);
		Designer de = new DesignerService().selectOneDesigner(1);
		Hairshop hair = new HairshopService().selectOneHairshop(1);
		Style style = new StyleService().selectOneStyle(1);
		Reserve reserve = new ReserveService().selectOneReserve(1);
		ArrayList<Customer> cList = new CustomerService().selectAllCusetomer();
		ArrayList<Review> review = new ReviewService().selectAllReviewByShopNo(1);
		
		
		DebugTemplate.setCurrObjAtSession(request.getSession(), cList, "cList");
		DebugTemplate.setCurrObjAtSession(request.getSession(), reserve, "reserve");
		if(review == null) {
			review = new ArrayList<Review>();
			Review rev = new Review();
			rev.setReviewNo(1);
			review.add(rev);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/");
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
