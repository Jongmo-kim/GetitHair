package designer.controller;

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
 * Servlet implementation class DesignerReserveServlet
 */
@WebServlet(name = "DesignerReserve", urlPatterns = { "/designerReserve" })
public class DesignerReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ArrayList<Hairshop> list = new HairshopService().selectHairshopList();
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/hairshop/hairshop.jsp");
		//RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/designer/designerReserve.jsp"); 20-11-25 18:47 충돌나서 일단 요거 죽였어요
		request.setAttribute("list", list);
		
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
