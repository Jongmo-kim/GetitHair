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

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet(name = "HairshopSearch", urlPatterns = { "/hairshopSearch" })
public class HairshopSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HairshopSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//<<<<<<< HEAD:GetitHairProject/src/hairshop/controller/HairshopSearchServlet.java
		String search = request.getParameter("search");
		if(search.equals("")) {
			response.sendRedirect("/hairshop");
		}else {
			ArrayList<Hairshop> list = new HairshopService().searchHairshop(search);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hairshop/hairshopSearch.jsp");
			request.setAttribute("list", list);
			request.setAttribute("search", search);
			rd.forward(request, response);
		}
//=======
//		ArrayList<Hairshop> list = new HairshopService().selectHairshopList();
//		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hairshop/hairshop.jsp");
//		request.setAttribute("list", list);
//		rd.forward(request, response);
//>>>>>>> 6d0b30346eae69b8a421f42618b476a0b9c4c5d6:GetitHairProject/src/hairshop/controller/HairshopServlet.java
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
