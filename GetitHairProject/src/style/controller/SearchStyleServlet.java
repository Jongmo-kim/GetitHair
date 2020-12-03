package style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import image.model.service.ImageService;
import image.model.vo.Image;
import style.model.service.StyleService;
import style.model.vo.Style;

/**
 * Servlet implementation class SearchStyleServlet
 */
@WebServlet(name = "SearchStyle", urlPatterns = { "/searchStyle" })
public class SearchStyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStyleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String searchStyle = request.getParameter("searchStyle");
		ArrayList<Style> stylelist = new StyleService().searchStyle(searchStyle);
		ArrayList<Image> imglist = new ArrayList<Image>();
		for(Style s : stylelist) {
			Image image = new ImageService().selectOneImageByTypeAndTypeNo("style", s.getStyleNo());
			imglist.add(image);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/style/searchStyle.jsp");
		request.setAttribute("stylelist", stylelist);
		request.setAttribute("imglist", imglist);
		request.setAttribute("searchStyle", searchStyle);
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
