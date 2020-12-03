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
		ArrayList<Hairshop> list = new HairshopService().selectHairshop();
		int totalCount = new HairshopService().totalCount();
		ArrayList<String> filepath = new ArrayList<String>();
		String filepath1 = new ImageService().selectFilepath("style", 1);
		String filepath2 = new ImageService().selectFilepath("style", 2);
		String filepath3 = new ImageService().selectFilepath("style", 3);
		String filepath4 = new ImageService().selectFilepath("style", 4);
		filepath.add(filepath1);
		filepath.add(filepath2);
		filepath.add(filepath3);
		filepath.add(filepath4);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hairshop/hairshop.jsp");
		request.setAttribute("list", list);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("filepath", filepath);
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
