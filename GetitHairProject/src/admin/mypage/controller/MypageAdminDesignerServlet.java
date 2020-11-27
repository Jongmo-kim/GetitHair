package admin.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PagingCommon;
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
		// 전달 받은 값 저장
		// type value 1 : 아이디로 검색 , 2 : 이름으로 검색
		int type = request.getParameter("searchType") != null ? Integer.parseInt(request.getParameter("searchType")) : 0;
		String keyword = request.getParameter("keyword");
		// reqPage = 요청할 페이지 번호.
		int reqPage = request.getParameter("reqPage") != null ? Integer.parseInt(request.getParameter("reqPage")) : 1;
		
		// 비즈니스 로직
		int pageSize = 0;
		int maxPrintSize = 10; //한 페이지에 출력될 리뷰 최대 갯수 지정.
		ArrayList<Designer> list = null;
		list = new DesignerService().selectAllDesigner();
		if(type == 1 && !keyword.equals("")) { //검색으로 얻어올 경우
//			list = new DesignerService().selectAllDesignerById(keyword,reqPage,maxPrintSize);
		}else if(type == 2 && !keyword.equals("")){ //name 검색일 경우 
			
		}else { //검색이 아닐때 모든 디자이너를 반환.
			pageSize = new DesignerService().getAllDesignerMaxPageSize(maxPrintSize);
			list = new DesignerService().selectAllDesigner(reqPage,maxPrintSize);		
		}
		int maxSize = 5;
	    int [] startEnd = PagingCommon.getPageStartEnd(reqPage,maxSize, pageSize);
		// 값 전달
		request.setAttribute("list", list);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("reqPage", reqPage);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageStart", startEnd[0]);
		request.setAttribute("pageEnd", startEnd[1]);
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
