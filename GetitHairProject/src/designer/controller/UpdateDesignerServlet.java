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
 * Servlet implementation class UpdateDesignerServlet
 */
@WebServlet(name = "UpdateDesigner", urlPatterns = { "/updateDesigner" })
public class UpdateDesignerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDesignerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Designer designer = new Designer();
		designer.setDesignerNo(Integer.parseInt(request.getParameter("designerNo")));
		designer.setDesignerPw(request.getParameter("designerPw"));
		designer.setDesignerPhone(request.getParameter("designerPhone"));
		designer.setDesignerYear(Integer.parseInt(request.getParameter("designerYear")));
		designer.setDesignerRank(request.getParameter("designerRank"));
		designer.setDesignerIntro(request.getParameter("designerIntro"));
		
		int result = new DesignerService().updateDesigner(designer);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("designer", designer);
		if(result>0) {
			request.setAttribute("msg", "프로필 수정이 완료되었습니다.");
			request.setAttribute("loc", "/");
		}else {
			request.setAttribute("msg", "프로필 수정에 실패했습니다. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/");
		}
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
