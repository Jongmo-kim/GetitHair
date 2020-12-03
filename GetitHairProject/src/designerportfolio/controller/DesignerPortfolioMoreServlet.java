package designerportfolio.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import designerportfolio.model.service.DesignerPortfolioService;
import designerportfolio.model.vo.DesignerPortfolio;
import designerportfolio.model.vo.DesignerportfolioImage;
import hairshop.model.vo.HairshopImage;
import image.model.service.ImageService;
import image.model.vo.Image;


/**
 * Servlet implementation class DesignerPortfolioMoreServlet
 */
@WebServlet(name = "DesignerPortfolioMore", urlPatterns = { "/designerPortfolioMore" })
public class DesignerPortfolioMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerPortfolioMoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
		// 2. view에서 넘어온 값 저장
		int start = Integer.parseInt(request.getParameter("start"));
		// 3. 비지니스로직
		ArrayList<Image> imglist = new ImageService().selectAllImageByType("designer_portfolio");
		ArrayList<DesignerPortfolio> portfoliolist = new DesignerPortfolioService().DesignerPortfolioMore(start);
		DesignerportfolioImage list = new DesignerportfolioImage(imglist, portfoliolist);
		// 4. 결과처리
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
