package common;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import designer.model.vo.Designer;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import image.model.service.ImageService;

public class DesignerTemplate {
	public static Designer setDesigner(HttpServletRequest request) {
		
		Designer designer = new Designer();
		int no = request.getParameter("designerNo")==null ? -1 :Integer.parseInt(request.getParameter("designerNo")); 
		String id = request.getParameter("designerId");
		String pw = request.getParameter("designerPw");
		String name = request.getParameter("designerName");
		String phone = request.getParameter("designerPhone");
		int year = request.getParameter("designerYear")==null ? -1 :Integer.parseInt(request.getParameter("designerYear"));
		String rank = request.getParameter("designerRank");
		String intro = request.getParameter("designerIntro");
		String enrollDate = request.getParameter("designerEnrollDate");
		
		if(DebugTemplate.DebugMode) {
			System.out.println("DesignerId : " +id);
			System.out.println("Designerpw : " +pw);
			System.out.println("Designername : " +name);
			System.out.println("Designerphone : " +phone);
			System.out.println("Designeryear : " +year);
			System.out.println("Designerrank : " +rank);
			System.out.println("Designerintro : " +intro);
			System.out.println("DesignerEnrollDate : " +enrollDate);
		}
		designer.setDesignerId(id);
		designer.setDesignerIntro(intro);
		designer.setDesignerName(name);
		designer.setDesignerNo(no);
		designer.setDesignerPhone(phone);
		designer.setDesignerPw(pw);
		designer.setDesignerRank(rank);
		designer.setDesignerYear(year);
		designer.setDesignerEnrolldate(enrollDate);
		return designer;
	}
	public static Designer setDesigner(MultipartRequest request) {
	
		Designer designer = new Designer();
		int no = request.getParameter("designerNo")==null ? -1 :Integer.parseInt(request.getParameter("designerNo")); 
		String id = request.getParameter("designerId");
		String pw = request.getParameter("designerPw");
		String name = request.getParameter("designerName");
		String phone = request.getParameter("designerPhone");
		int year = request.getParameter("designerYear")==null ||request.getParameter("designerYear").equals("") ? -1 :Integer.parseInt(request.getParameter("designerYear"));
		String rank = request.getParameter("designerRank");
		String intro = request.getParameter("designerIntro");
		String enrollDate = request.getParameter("designerEnrollDate");
		
		if(DebugTemplate.DebugMode) {
			System.out.println("DesignerId : " +id);
			System.out.println("Designerpw : " +pw);
			System.out.println("Designername : " +name);
			System.out.println("Designerphone : " +phone);
			System.out.println("Designeryear : " +year);
			System.out.println("Designerrank : " +rank);
			System.out.println("Designerintro : " +intro);
			System.out.println("DesignerEnrollDate : " +enrollDate);
		}
		designer.setDesignerId(id);
		designer.setDesignerIntro(intro);
		designer.setDesignerName(name);
		designer.setDesignerNo(no);
		designer.setDesignerPhone(phone);
		designer.setDesignerPw(pw);
		designer.setDesignerRank(rank);
		designer.setDesignerYear(year);
		designer.setDesignerEnrolldate(enrollDate);
		return designer;
	}
}
