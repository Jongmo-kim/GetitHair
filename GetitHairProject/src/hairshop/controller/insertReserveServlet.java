package hairshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class insertReserveServlet
 */
@WebServlet(name = "InsertReserve", urlPatterns = { "/insertReserve" })
public class insertReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
		int designerNo = Integer.parseInt(request.getParameter("designerNo"));
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		int stylelistNo = Integer.parseInt(request.getParameter("stylelistno"));
		// hairshopdeata.j 에서 가져온 모든 인풋 벨류들을 겟리퀘스트로 가져온다	
		Customer customer = new CustomerService().selectOneCustomer(customerNo);
		// 그리고 객체가 필요한 커스터머 디자이너 샵 스타일리스트는셀렉트원을 써서 해당넘버와 맞게 가져와
		Reserve reserve = new Reserve();
	    reserve.setCustomer(customer);
		//새로운 리저브 객체 의 세터를 사용해 각각의 값을설정한
	    int result = new ReserveService().insertReserve(reserve);
	    //세팅이 다 되면 그 리절브 객체를ㄹ 리저브서비스의 인서트 리저브를 이용해 인서트하고 
	    if(result > 0) {
	    	
	    }else {
	    	
	    }
	    // 돌아온 리턴값을 확인해 제대로 들어갔는지 안들어갔는지에 따라 결과 처리한
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
