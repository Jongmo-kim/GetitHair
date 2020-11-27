package common;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import designer.model.vo.Designer;

public class DesignerTemplate {
	public static Designer setDesigner(HttpServletRequest request) {
		Designer designer = new Designer();
		int no = request.getParameter("designerNo")==null ? -1 :Integer.parseInt(request.getParameter("designerNo")); 
		String id = request.getParameter("designerId");
		String pw = request.getParameter("designerPw");
		String Gen = request.getParameter("designerGen");
		String name = request.getParameter("designerName");
		String email = request.getParameter("designerEmail");
		String phone = request.getParameter("designerPhone");
		int year = request.getParameter("designerYear")==null ? -1 :Integer.parseInt(request.getParameter("designerYear"));
		String rank = request.getParameter("designerRank");
		String intro = request.getParameter("designerIntro");
		String keyword = request.getParameter("designerKeyword");
		if((boolean)request.getSession().getAttribute("isDebugmode")) {
			System.out.println("DesignerId : " +id);
			System.out.println("Designerpw : " +pw);
			System.out.println("Designergen : " +Gen);
			System.out.println("Designername : " +name);
			System.out.println("Designeremail : " +email);
			System.out.println("Designerphone : " +phone);
			System.out.println("Designeryear : " +year);
			System.out.println("Designerrank : " +rank);
			System.out.println("Designerintro : " +intro);
			System.out.println("Designerkey : " +keyword);
		}			
		designer.setDesignerEmail(email);
		designer.setDesignerGen(Gen);
		designer.setDesignerId(id);
		designer.setDesignerImg("");
		designer.setDesignerIntro(intro);
		designer.setDesignerKeyword(keyword);
		designer.setDesignerName(name);
		designer.setDesignerNo(no);
		designer.setDesignerPhone(phone);
		designer.setDesignerPw(pw);
		designer.setDesignerRank(rank);
		designer.setDesignerYear(year);
		return designer;
	}
	public static Designer setDesigner(MultipartRequest mRequest) {
		Designer d = new Designer();
		mRequest.getOriginalFileName("file");
		mRequest.getFilesystemName("file");
		return d;
	}
}
