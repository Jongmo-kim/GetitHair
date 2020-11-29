package reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DebugTemplate;
import common.ReserveTemplate;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class InsertReReserveServlet
 */
@WebServlet(name = "InsertReReserve", urlPatterns = { "/insertReReserve" })
public class InsertReReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reserve reserve = ReserveTemplate.setReserve(request);
		String selStatus = request.getParameter("selStatus");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));		
		DebugTemplate.setCurrObjAtSession(request.getSession(), reserve,"reserve");
		int result = new ReserveService().insertReReserve(reserve);
		System.out.println("insert = "+result);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		
		if(result >0) {
			request.setAttribute("msg", "다시 예약 등록이 완료되었습니다.");			
		}else {
			request.setAttribute("msg", "다시 예약 등록이 실패되었습니다.");
		}
		request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
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
