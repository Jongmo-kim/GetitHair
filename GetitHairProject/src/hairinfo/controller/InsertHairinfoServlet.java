package hairinfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import common.HairinfoTemplate;
import hairinfo.model.service.HairinfoService;
import hairinfo.model.vo.Hairinfo;

/**
 * Servlet implementation class InsertHairinfoServlet
 */
@WebServlet(name = "InsertHairinfo", urlPatterns = { "/insertHairinfo" })
public class InsertHairinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertHairinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		//2.view에서 넘어온값저장
		if(!ServletFileUpload.isMultipartContent(request)) {
			 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			 request.setAttribute("msg","공지사항 작성 오류[enctype]");
			 request.setAttribute("loc","/");		 
			 rd.forward(request, response);
			 return;
		}
		Hairinfo hairinfo =  HairinfoTemplate.setCust(request);		
		//3.비지니스로직
		int result = new HairinfoService().insertHairinfo(hairinfo);
		//4.결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/customer/mypageGuest.jsp");
		if(result>0) {
			request.setAttribute("msg", "상세정보등록성공");
		}else {
			request.setAttribute("msg", "상세정보등록실패");
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
