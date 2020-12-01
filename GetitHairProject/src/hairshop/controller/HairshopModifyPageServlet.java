package hairshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;

/**
 * Servlet implementation class HairshopModifyPageServlet
 */
@WebServlet("/hairshopModifyPage")
public class HairshopModifyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HairshopModifyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		
		//비즈니스
		Hairshop shop = new HairshopService().selectOneHairshop(shopNo);
		
		if(shop != null) {			
			request.setAttribute("shop", shop);
			request.getRequestDispatcher("/WEB-INF/views/hairshopDeta/modifyHairshop.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "조회에 실패하였습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
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
