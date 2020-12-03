package designerportfolio.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designerportfolio.model.service.DesignerPortfolioService;
import designerportfolio.model.vo.DesignerPortfolio;

/**
 * Servlet implementation class DeleteDesignerPortfolioServlet
 */
@WebServlet(name = "DeleteDesignerPortfolio", urlPatterns = { "/deleteDesignerPortfolio" })
public class DeleteDesignerPortfolioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDesignerPortfolioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int portfolioNo = Integer.parseInt(request.getParameter("portfolioNo"));
		// 3. 비지니스로직
		DesignerPortfolio dp = new DesignerPortfolioService().selectOnePortfolio(portfolioNo);
		int result = new DesignerPortfolioService().deletePortfolio(portfolioNo);
		// 4. 결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			if(dp.getFilepath() != null) {	// 해당 공지사항에 첨부파일이 있는 경우
				String root = getServletContext().getRealPath("/");
				String saveDirectory = root+"upload/notice/";
				File delFile = new File(saveDirectory+dp.getFilepath());
				boolean delResult = delFile.delete();
				if(delResult) {
					System.out.println("파일 삭제 성공");
				}else {
					System.out.println("파일 삭제 실패");
				}
			}
			request.setAttribute("msg", "삭제 완료");
			request.setAttribute("loc", "/designerPortfolioList");
		}else {
			request.setAttribute("msg", "포트폴리오 삭제 실패. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/designerPortfolioList");
		}
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
