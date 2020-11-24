package common;

import javax.servlet.http.HttpServletRequest;

import hairinfo.model.vo.Hairinfo;

public class HairinfoTemplate {
	public static Hairinfo setHairinfo(HttpServletRequest request) {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		String myhairScalp = request.getParameter("myhair_scalp");
		String myhairCurly = request.getParameter("myhair_curly");
		String myhairRich  = request.getParameter("myhair_rich");
		String myhairBold = request.getParameter("myhair_bold");
		String myhairVol  = request.getParameter("myhair_vol");
		String myhairStatus = request.getParameter("myhair_status");
		String myhairOld = request.getParameter("myhair_old");
		
		Hairinfo hairinfo = new Hairinfo();
		hairinfo.setCustomerNo(customerNo);
		hairinfo.setMyhairBold(myhairBold);
		hairinfo.setMyhairCurly(myhairCurly);
		hairinfo.setMyhairOld(myhairOld);
		hairinfo.setMyhairRich(myhairRich);
		hairinfo.setMyhairScalp(myhairScalp);
		hairinfo.setMyhairStatus(myhairStatus);
		hairinfo.setMyhairVol(myhairVol);		
		return hairinfo;
	}
}
