package designer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.DebugTemplate;
import common.DesignerTemplate;
import designer.model.dao.DesignerDao;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;

/**
 * Servlet implementation class DesignerSignupServlet
 */
@WebServlet(name = "DesignerSignup", urlPatterns = { "/signUpDesigner" })
public class SignupDesignerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupDesignerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Designer designer = DesignerTemplate.setDesigner(request);
		int result = new DesignerService().insertDesigner(designer);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result >0) {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "디자이너 가입 성공");
		} else {
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "디자이너 가입 실패");
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
