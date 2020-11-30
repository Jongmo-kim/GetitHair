package reserve.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reserve.model.service.ReserveService;
import reserve.model.vo.Reserve;

/**
 * Servlet implementation class DeleteReserveServlet
 */
@WebServlet(name = "DeleteReserve", urlPatterns = { "/deleteReserveByCust" })
public class DeleteReserveByCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReserveByCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));		
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		String selStatus = request.getParameter("selStatus");
		String sqlAdd ="";
		if(selStatus.equals("예약")) {
			sqlAdd = " and reserve_status='예약' ";
		}else if(selStatus.equals("완료")) {
			sqlAdd = " and reserve_status='완료' ";
		}else if(selStatus.equals("취소")) {
			sqlAdd = " and reserve_status='취소' ";
		}	
		//totalcount구하고 numPerPage구하고 totalPage를 구하면
		//그래서 totalPage가 줄어들었다면 줄어든 페이지로 이동한다
		Reserve reserve = new ReserveService().selectOneReserve(reserveNo);
		int beforeTotalPage = new ReserveService().getReserveTotalPageByCust(reserve.getCustomer().getCustomerNo(),selStatus,sqlAdd);
		int afterTotalPage = 0;		
		int result = new ReserveService().deleteReserve(reserveNo);
		//결과처리
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			afterTotalPage = new ReserveService().getReserveTotalPageByCust(reserve.getCustomer().getCustomerNo(),selStatus,sqlAdd);
			if(beforeTotalPage>afterTotalPage) {
				reqPage--;
				if(reqPage<=0) {
					reqPage=1;
				}
			}			
			request.setAttribute("msg", "예약리스트에서 삭제 완료되었습니다.");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
		}else {
			request.setAttribute("msg", "예약리스트에서 삭제 실패되었습니다.");
			request.setAttribute("loc", "/mypageCust?selStatus="+selStatus+"&reqPage="+reqPage);
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
