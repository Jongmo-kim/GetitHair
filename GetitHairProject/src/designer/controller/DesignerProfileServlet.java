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
 * Servlet implementation class DesignerProfileServlet
 */
@WebServlet(name = "DesignerProfile", urlPatterns = { "/designerProfile" })
public class DesignerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. view에서 넘어온 데이터 저장
		int designerNo = Integer.parseInt(request.getParameter("designerNo"));
		//3. 비지니스 로직 
		Designer designer = new DesignerService().selectOneMember(designerNo);
		//4. 결과처리
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/mypage/designer/designerProfile.jsp");
		request.setAttribute("designer", designer);
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
