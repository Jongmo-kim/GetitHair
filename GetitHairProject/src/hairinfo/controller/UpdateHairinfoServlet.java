package hairinfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HairinfoTemplate;
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;

/**
 * Servlet implementation class UpdateHairinfoServlet
 */
@WebServlet(name = "UpdateHairinfo", urlPatterns = { "/updateHairinfo" })
public class UpdateHairinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHairinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		//2.view에서넘어온값 저장
		Hairinfo hairinfo = HairinfoTemplate.setCust(request);
		//3.비지니스로직처리
		int result = new HairinfoService().updateHairinfo(hairinfo);
		//4.결과처리
		if(result > 0 ) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");
			request.setAttribute("hairinfo", hairinfo);
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "회원수정에 실패했습니다.");
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
