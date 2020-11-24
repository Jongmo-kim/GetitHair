package hairinfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hairinfo.model.service.HairinfoService;

/**
 * Servlet implementation class DeleteHairinfoServlet
 */
@WebServlet(name = "DeleteHairinfo", urlPatterns = { "/deleteHairinfo" })
public class DeleteHairinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHairinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		//2.view에서 넘어온값 저장
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		//3.비지니스 로직
		int result = new HairinfoService().deleteHairinfo(customerNo);
		//4.결과처리
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "상세정보삭제에 성공했습니다^_^");
		}else {
			request.setAttribute("msg", "상세정보삭제에 실패했습니다...");			
		}
		request.setAttribute("loc", "/");
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
