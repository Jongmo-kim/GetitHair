package hairshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.vo.Customer;
import designer.model.service.DesignerListService;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import designer.model.vo.DesignerList;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import image.model.service.ImageService;
import image.model.vo.Image;
import likes.model.service.LikesService;
import likes.model.vo.Likes;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;
import review.model.service.ReviewService;
import review.model.vo.Review;
import shopprice.model.service.ShopPriceService;
import shopprice.model.vo.ShopPrice;
import style.model.vo.Style;
import stylelist.model.service.StylelistService;
import stylelist.model.vo.StyleTypeList;
import stylelist.model.vo.Stylelist;

/**
 * Servlet implementation class HairshopDetailServlet
 */
@WebServlet(name = "HairshopDetail", urlPatterns = { "/hairshopDetail" })
public class HairshopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HairshopDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		Hairshop hs = new HairshopService().selectOneHairshop(shopNo);// hs == null.getNo()
		ArrayList<Image> image = new ImageService().selectAllImageByTypeAndTypeNo("hairshop", shopNo);
		ArrayList<Review> review = new ReviewService().selectAllReviewByShopNo(hs.getShopNo());
		ArrayList<DesignerList> designerList = new DesignerListService().selectDesignerListByShopNo(shopNo);
		ArrayList<Reserve> reserve = new ReserveService().selectOneReserveShop(shopNo);
		String[] type = { "cut", "perm", "dye" };
		ArrayList<StyleTypeList> typeList = new ArrayList<StyleTypeList>();
		for (int i = 0; i < type.length; i++) {
			StyleTypeList stl = new StyleTypeList(type[i], new ArrayList<ArrayList<Style>>());
			for (int j = 0; j < designerList.size(); j++) {
				ArrayList<Style> sl = new StylelistService().selectAllStylelistByTypeAndDesignerNo(type[i],
						designerList.get(j).getDesigner().getDesignerNo());
				stl.addStyleList(sl);
			}
			typeList.add(stl);
		}
		for(int i=0;i<typeList.size();i++)
			System.out.println("type: "+typeList.get(i).getType()+" size:"+typeList.get(i).getStyleList().size());

		ArrayList<ShopPrice> price = new ShopPriceService().selectOneShopDetaPrice(shopNo);
		if (hs != null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hairshopDeta/hairshopDeta.jsp");
			request.setAttribute("hs", hs);
			request.setAttribute("review", review);
			request.setAttribute("designerList", designerList);
			request.setAttribute("reserve", reserve);
			request.setAttribute("price", price);
			request.setAttribute("typeList", typeList);
			request.setAttribute("image", image);
			rd.forward(request, response);
		} else {
			response.sendRedirect("/hairshop");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
