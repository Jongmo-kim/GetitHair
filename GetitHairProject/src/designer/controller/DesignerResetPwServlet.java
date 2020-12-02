package designer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.service.DesignerService;
import designer.model.vo.Designer;



/**
 * Servlet implementation class DesignerResetPwServlet
 */
@WebServlet(name = "DesignerResetPw", urlPatterns = { "/designerResetPw" })
public class DesignerResetPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerResetPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int designerNo = Integer.parseInt(request.getParameter("designerNo"));
		String designerId = request.getParameter("designerId");
		String designerPw = request.getParameter("designerPw");
		Designer designer = new DesignerService().selectOneDesigner(designerNo);
		if(designer==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "조회되지 않는 회원입니다.");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
		}else {
			designer.setDesignerPw(designerPw);
			int result = new DesignerService().updateDesigner(designer);
			if(result>0) {
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp/findSuccess.jsp");
				request.setAttribute("option",0);
				rd.forward(request, response);
			}else {				
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				request.setAttribute("msg", "암호설정이 실패했습니다..");
				request.setAttribute("loc", "/");
				rd.forward(request, response);
			}
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
