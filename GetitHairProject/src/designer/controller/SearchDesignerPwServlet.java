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
 * Servlet implementation class SerchDesignerPwServlet
 */
@WebServlet(name = "SearchDesignerPw", urlPatterns = { "/searchDesignerPw" })
public class SearchDesignerPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDesignerPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designerId = request.getParameter("designerId");
		String designerPhone = request.getParameter("designerPhone");		
		Designer designer = new DesignerService().selectOneSerchPw(designerId, designerPhone);
		if(designer==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp/searchDesignerForm.jsp");
			request.setAttribute("msg", "암호를 찾을수 없습니다..");
			request.setAttribute("option", 1);//암호 autofocus용
			rd.forward(request, response);
		}else {			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp/resetDesignerPw.jsp");
			request.setAttribute("designer", designer);
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
