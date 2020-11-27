package admin.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.service.DesignerService;
import designer.model.vo.Designer;

/**
 * Servlet implementation class MypageAdminDesignerServlet
 */
@WebServlet("/mypageAdminDesigner")
public class MypageAdminDesignerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MypageAdminDesignerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 비즈니스 로직
		ArrayList<Designer> list = new DesignerService().selectAllDesigner();
		// 값 전달
		request.setAttribute("list", list);
		// 메인 관리페이지로 이동
		request.getRequestDispatcher("/WEB-INF/views/mypage/admin/mypageAdminDesigner.jsp").forward(request, response);

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
