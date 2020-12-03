package hairshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import image.model.service.ImageService;
import image.model.vo.Image;
import style.model.vo.Style;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet(name = "SearchHairshop", urlPatterns = { "/searchHairshop" })
public class SearchHairshopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHairshopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String searchShop = request.getParameter("searchShop");
		if(!searchShop.equals("")) {
			ArrayList<Hairshop> shoplist = new HairshopService().searchHairshop(searchShop);
			ArrayList<Image> imglist = new ArrayList<Image>();
			for(Hairshop h : shoplist) {
				Image image = new ImageService().selectOneImageByTypeAndTypeNo("style", h.getShopNo());
				imglist.add(image);
			}
			int totalCount = new HairshopService().totalCount();
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hairshop/searchHairshop.jsp");
			request.setAttribute("shoplist", shoplist);
			request.setAttribute("imglist", imglist);
			request.setAttribute("searchShop", searchShop);
			request.setAttribute("totalCount", totalCount);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
