package common;

import javax.servlet.http.HttpServletRequest;

import hairinfo.model.vo.Hairinfo;

public class HairinfoTemplate {
	public static Hairinfo setHairinfo(HttpServletRequest request) {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		String myhairScalp = request.getParameter("myhairScalp");
		String myhairCurly = request.getParameter("myhairCurly");
		String myhairRich  = request.getParameter("myhairRich");
		String myhairBold = request.getParameter("myhairBold");
		String myhairVol  = request.getParameter("myhairVol");
		String myhairStatus = request.getParameter("myhairStatus");
		String myhairOld = request.getParameter("myhairOld");
		
		Hairinfo hairinfo = new Hairinfo();
		hairinfo.setCustomerNo(customerNo);
		hairinfo.setMyhairScalp(myhairScalp);
		hairinfo.setMyhairCurly(myhairCurly);
		hairinfo.setMyhairRich(myhairRich);
		hairinfo.setMyhairBold(myhairBold);
		hairinfo.setMyhairVol(myhairVol);		
		hairinfo.setMyhairStatus(myhairStatus);		
		hairinfo.setMyhairOld(myhairOld);
		return hairinfo;
	}
}
