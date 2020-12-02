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
import image.model.vo.ImageList;

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
			request.setAttribute("msg", "포트폴리오 작성 오류[enctype]");
			request.setAttribute("loc", "/");
			rd.forward(request, response);
			return;
		}
		
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/designerPortfolio";
		int maxSize = 10*1024*1024;
		
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize,"UTF-8",new DefaultFileRenamePolicy());
		DesignerPortfolio dp = new DesignerPortfolio();
		dp.setPortfolioWriter(mRequest.getParameter("portfolioWriter"));
		dp.setPortfolioContent(mRequest.getParameter("PortfolioContent"));
		dp.setStyleName(mRequest.getParameter("styleName"));
		
		int desigerNo = Integer.parseInt(mRequest.getParameter("designerNo"));		
		System.out.println("desigerNo : "+desigerNo);
		
		// 여기서 이미지 파일 리스트 불러오는 로직을 구현하는 로직
		String filename = mRequest.getOriginalFileName("filename");
		String filepath = mRequest.getFilesystemName("filename");

		
		int imgResult = new ImageService().insertImage("designer", desigerNo, filename, filepath);
		int result = new DesignerPortfolioService().insertDesignerPortfolio(dp,desigerNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0 && imgResult>0) {
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
