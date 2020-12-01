package hairshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hairshop.model.dao.HairshopDao;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;

/**
 * Servlet implementation class HairshopModifyServlet
 */
@WebServlet("/hairshopModify")
public class HairshopModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HairshopModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		String shopName = request.getParameter("shopName");
		String shopPhone = request.getParameter("shopPhone");
		String shopOpen = request.getParameter("shopOpen");
		String shopClose = request.getParameter("shopClose");
		String shopHoliday = request.getParameter("shopHoliday");
		
		//비즈니스
		Hairshop shop = new HairshopService().selectOneHairshop(shopNo);
		shop.setShopName(shopName);
		shop.setShopPhone(shopPhone);
		shop.setShopOpen(shopOpen);
		shop.setShopClose(shopClose);
		shop.setShopHoliday(shopHoliday);
		
		int result = new HairshopService().updateShop(shop);
		
		if(result >0) {
			request.setAttribute("msg", "수정에 성공하였습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "수정에 실패하였습니다.");
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
