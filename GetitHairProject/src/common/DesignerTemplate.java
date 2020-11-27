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
		System.out.println(id);
		System.out.println(pw);
		System.out.println(Gen);
		System.out.println(name);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(year);
		System.out.println(rank);
		System.out.println(intro);
		System.out.println(keyword);
		
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
