package designerportfolio.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import designerportfolio.model.service.DesignerPortfolioService;
import designerportfolio.model.vo.DesignerPortfolio;
import image.model.dao.ImageDao;
import image.model.service.ImageService;
import image.model.vo.Image;

/**
 * Servlet implementation class InsertDesignerPortfolioServlet
 */
@WebServlet(name = "InsertDesignerPortfolio", urlPatterns = { "/insertDesignerPortfolio" })
public class InsertDesignerPortfolioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDesignerPortfolioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			request.setAttribute("msg", "enc오류");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
			return;
		}
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/designerPortfolio";
		int maxSize = 10*1024*1024;
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize,"UTF-8",new DefaultFileRenamePolicy());
		//ArrayList<Image> list = new ImageService().selectAllImageListByType();
		DesignerPortfolio dp = new DesignerPortfolio();
		dp.setPortfolioContent(mRequest.getParameter("PortfolioContent"));
		dp.setPortfolioWriter(mRequest.getParameter("PortfolioWriter"));
		int result = new DesignerPortfolioService().insertDesignerPortfolio(dp);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("msg", "포트폴리오가 등록되었습니다.");
		}else {
			request.setAttribute("msg", "포트폴리오 등록에 실패했습니다. 관리자에게 문의하세요.");			
		}
		request.setAttribute("loc", "/designerPortfolioList");	// 더보기로 만들거라 reqPage안넣어도 됨
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
