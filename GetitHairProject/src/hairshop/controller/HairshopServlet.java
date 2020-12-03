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
import style.model.service.StyleService;
import style.model.vo.Style;

/**
 * Servlet implementation class HairshopServlet
 */
@WebServlet(name = "Hairshop", urlPatterns = { "/hairshop" })
public class HairshopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HairshopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ArrayList<Hairshop> shoplist = new HairshopService().selectHairshop();
		ArrayList<Style> stylelist = new StyleService().selectAllStyle();
		int totalCount = new HairshopService().totalCount();
		ArrayList<Image> imglist = new ArrayList<Image>();
		Image i1 = new ImageService().selectOneImageByTypeAndTypeNo("style", 1);
		Image i2 = new ImageService().selectOneImageByTypeAndTypeNo("style", 2);
		Image i3 = new ImageService().selectOneImageByTypeAndTypeNo("style", 3);
		Image i4 = new ImageService().selectOneImageByTypeAndTypeNo("style", 4);
		imglist.add(i1);
		imglist.add(i2);
		imglist.add(i3);
		imglist.add(i4);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hairshop/hairshop.jsp");
		request.setAttribute("shoplist", shoplist);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("imglist", imglist);
		request.setAttribute("stylelist", stylelist);
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
