package admin.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.service.DesignerService;


/**
 * Servlet implementation class AdminDeleteDesignerServlet
 */
@WebServlet("/adminDeleteDesigner")
public class AdminDeleteDesignerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDeleteDesignerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 값 받기
		String[] designerId = request.getParameterValues("designerId");

		// 비즈니스 로직
		int result = 0;
		for (int i = 0; i < designerId.length; i++) {
			result += new DesignerService().deleteDesigner(designerId[i]);
		}

		if (result > 0) {
			request.setAttribute("msg", "삭제에 성공하였습니다.");
			request.setAttribute("loc", "/mypageAdminDesigner");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			System.out.println("디자이너 삭제 완료");

		} else {
			request.setAttribute("msg", "삭제에 실패했습니다.");
			request.setAttribute("loc", "/mypageAdminDesigner");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
