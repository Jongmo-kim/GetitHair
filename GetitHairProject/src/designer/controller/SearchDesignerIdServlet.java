package designer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.service.DesignerService;
import designer.model.vo.Designer;

/**
 * Servlet implementation class SerchDesignerIdServlet
 */
@WebServlet(name = "SearchDesignerId", urlPatterns = { "/searchDesignerId" })
public class SearchDesignerIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDesignerIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String designerName = request.getParameter("designerName");
		String designerPhone = request.getParameter("designerPhone");		
		Designer designer = new DesignerService().selectOneSerchId(designerName, designerPhone);
		//System.out.println("designerName = " + designerName);
		//System.out.println("designerPhone = " + designerPhone);
		//System.out.println("designer = " + designer);
		if(designer==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp/searchDesignerForm.jsp");
			request.setAttribute("msg", "아이디를 찾을 수 없습니다.....");			
			rd.forward(request, response);
		}else {
			String stringResult = designer.getDesignerId();
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/signUp/findSuccess.jsp");
			request.setAttribute("msg", "성공했습니다!");
			request.setAttribute("option",2);//암호찾기 버튼 옵션  cust:1 designer:2
			request.setAttribute("stringResult", stringResult);	
			rd.forward(request, response);
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
