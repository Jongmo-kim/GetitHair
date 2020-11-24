package common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/EncodeFilter")
public class EncodeFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodeFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		Object isDebuggedMode = session.getAttribute("isDebugmode");
		if( isDebuggedMode == null) {
			request.setCharacterEncoding("utf-8");
			chain.doFilter(request, response);
		} else {
			boolean isDebugMode = (boolean)isDebuggedMode;
			if(isDebugMode) {
				printAllObjects(session);
				printRequestURI(req);
				request.setCharacterEncoding("utf-8");
			}
			chain.doFilter(request, response);			
		}
		
	}
	
	private void printRequestURI(HttpServletRequest req) {
		String uri = req.getRequestURI();
		System.out.println("요청 URI : " + uri);
	}

	private void printAllObjects(HttpSession session) {
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

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
