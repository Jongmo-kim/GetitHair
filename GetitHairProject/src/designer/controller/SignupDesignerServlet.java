package designer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.DebugTemplate;
import common.DesignerTemplate;
import designer.model.dao.DesignerDao;
import designer.model.service.DesignerService;
import designer.model.vo.Designer;
import image.model.service.ImageService;

/**
 * Servlet implementation class DesignerSignupServlet
 */
@MultipartConfig(
		location="upload/designer",
		fileSizeThreshold=1024*1024*5,
		maxFileSize=1024*1024*10,
		maxRequestSize=1024*1024*15
)
@WebServlet(name = "DesignerSignup", urlPatterns = { "/signUpDesigner" })
public class SignupDesignerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupDesignerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(isMultiContent(request)) {
			toMsg(request,response);
			return;
		}
		String Msg = "";
		MultipartRequest mRequest = getMultipartRequest(request);
		Designer designer = DesignerTemplate.setDesigner(mRequest);
		int result = new DesignerService().insertDesigner(designer);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		System.out.println(designer);
		if(result >0) {
			String fileName = mRequest.getFilesystemName("filename");
			if(fileName==null) {
				
			} else {
				Designer insertedDesigner = new DesignerService().selectOneDesigner(designer.getDesignerId());
				String type = "designer";
				int typeNo = insertedDesigner.getDesignerNo();
				int imgResult = new ImageService().insertImage(mRequest.getFilesystemName("filename"), type, typeNo);
				if(imgResult > 0) {
					Msg += "이미지 등록 성공\n";
				}else {
					Msg += "이미지 등록 실패\n";
				}
			}
			Msg += "회원가입 성공";
			request.setAttribute("loc", "/");
			request.setAttribute("msg", Msg);
		} else {
			Msg += "회원가입 실패";
			request.setAttribute("loc", "/");
			request.setAttribute("msg", Msg);
		}
		rd.forward(request, response);
	}
	
	private boolean isMultiContent(HttpServletRequest request) {
		return !ServletFileUpload.isMultipartContent(request);
	}

	private void toMsg(HttpServletRequest request,HttpServletResponse response) {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("msg", "디자이너 회원가입 오류 [enctype]");
		request.setAttribute("loc", "/");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private MultipartRequest getMultipartRequest(HttpServletRequest request) {
		String root = getServletContext().getRealPath("/");
		String saveDir = root + "upload/designer";
		int maxSize = 1024 * 1024 * 10; //10MB
		MultipartRequest mRequest = null;
		try {
			mRequest = new MultipartRequest(request, saveDir, maxSize, "utf-8",new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mRequest;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
