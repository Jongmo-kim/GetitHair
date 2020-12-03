package stylelist.controller;

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
 * Servlet implementation class StyleServlet
 */
@WebServlet(name = "Style", urlPatterns = { "/style" })
public class StyleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ArrayList<Style> stylelist = new StyleService().selectAllStyle();
		ArrayList<Image> imglist = new ImageService().selectAllImageByType("style");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/style/style.jsp");
		request.setAttribute("stylelist", stylelist);
		request.setAttribute("imglist", imglist);
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
