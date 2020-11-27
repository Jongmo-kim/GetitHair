package common;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpSession;

import reserve.model.vo.Reserve;

public class DebugTemplate {
	
	public static void setCurrObjAtSession(HttpSession session, Object obj,String tag) {
		
		if(obj instanceof Collection<?>) {
			ArrayList<?> newList = new ArrayList<>((Collection<?>)obj);
			session.setAttribute("tag", tag);
			session.setAttribute("Objects", newList);
			printAllObjects(session);
		} else {
			ArrayList<Object> list = new ArrayList<Object>();
			list.add(obj);
			session.setAttribute("tag", tag);
			session.setAttribute("Objects", list);
			printAllObjects(session);
		}
	}

	public static void printAllObjects(HttpSession session) {
		ArrayList<Object> list = (ArrayList<Object>)session.getAttribute("Objects");
		String tag = (String)session.getAttribute("tag");
		if(list == null) {
			return;
		} else {
			int count = 1;
			System.out.printf("%s의 객체\n",tag);
			for(Object obj : list) {
				System.out.printf("%s의 %d번째 객체\n",tag,count++);
				System.out.println(obj);
				System.out.println("------------------------------------");
			}
			System.out.println();
		}
	}
}
