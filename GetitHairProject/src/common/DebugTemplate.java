package common;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class DebugTemplate {
	private static void setCurrListAtSession(HttpSession session, ArrayList<Object> list,String tag) {
		session.setAttribute("Objects", list);
		session.setAttribute("tag", tag);
	}
	public static void setCurrObjAtSession(HttpSession session, Object obj,String tag) {
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(obj);
		session.setAttribute("tag", tag);
		session.setAttribute("Objects", list);
	}
}
