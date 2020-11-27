package hairshop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hairshop.model.dao.HairshopDao;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class ReserVationServlet
 */
@WebServlet(name = "ReserVation", urlPatterns = { "/reserVation" })
public class ReserVationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserVationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//2. view	
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		//3. 비지니스
		Hairshop hs = new HairshopService().selectOneHairshop(shopNo);
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/hairshopDeta/reserVation.jsp");
		request.setAttribute("hs", hs);
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
