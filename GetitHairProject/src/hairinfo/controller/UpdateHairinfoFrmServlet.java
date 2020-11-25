package hairinfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DebugTemplate;
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;

/**
 * Servlet implementation class UpdateHairinfoFrmServlet
 */
@WebServlet(name = "UpdateHairinfoFrm", urlPatterns = { "/updateHairinfoFrm" })
public class UpdateHairinfoFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHairinfoFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		//2.views
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));		
		//3.비지니스로직
		Hairinfo hairinfo = new HairinfoService().selectOneHairinfo(customerNo);		
		//4.결과
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/updateHairinfoFrm.jsp");
		request.setAttribute("hairinfo", hairinfo);
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
