package designer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.dao.DesignerDao;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import reserve.model.dao.ReserveDao;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

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
		int DesignerNo = 1;//Integer.parseInt(request.getParameter("DesignerNo"));
		ArrayList<Reserve> list = new ReserveService().selectAllByDesigner(DesignerNo);
		if(list !=null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reserve/designer/designerReserve.jsp"); 
			request.setAttribute("list", list);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "예약내역이 존재하지 않습니다.");
			request.setAttribute("loc", "/");
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
