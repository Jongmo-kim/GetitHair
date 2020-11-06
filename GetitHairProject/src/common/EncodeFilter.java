package common;

import java.io.IOException;
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
				String uri = req.getRequestURI();
				request.setCharacterEncoding("utf-8");
				System.out.println("요청 URI : " + uri);
			}
			chain.doFilter(request, response);			
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
