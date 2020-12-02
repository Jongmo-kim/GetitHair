package hairshop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import image.model.service.ImageService;
import image.model.vo.ImageList;

/**
 * Servlet implementation class HairshopMoreServlet
 */
@WebServlet(name = "HairshopMore", urlPatterns = { "/hairshopMore" })
public class HairshopMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HairshopMoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int start = Integer.parseInt(request.getParameter("start"));
		ArrayList<ImageList> shopimg = new ImageService().selectAllImageListByType("hairshop");
		ArrayList<Hairshop> list = new HairshopService().hairshopMore(start);
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
		new Gson().toJson(shopimg,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
