package style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designerportfolio.model.service.DesignerPortfolioService;
import designerportfolio.model.vo.DesignerPortfolio;
import image.model.service.ImageService;
import image.model.vo.Image;
import style.model.service.StyleService;
import style.model.vo.Style;
import stylelist.model.service.StylelistService;
import stylelist.model.vo.Stylelist;

/**
 * Servlet implementation class StyleDetailServlet
 */
@WebServlet(name = "StyleDetail", urlPatterns = { "/styleDetail" })
public class StyleDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int styleNo = Integer.parseInt(request.getParameter("styleNo"));
		Stylelist stylelist = new StylelistService().selectOneStylelistByStyleNo(styleNo);
		Image image = new ImageService().selectOneImageByTypeAndTypeNo("style", styleNo);
		ArrayList<DesignerPortfolio> pflist = new DesignerPortfolioService().selectAllPortfolio(stylelist.getDesigner().getDesignerNo());
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/style/styleDetail.jsp");
		request.setAttribute("stylelist", stylelist);
		request.setAttribute("pflist", pflist);
		request.setAttribute("image", image);
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
