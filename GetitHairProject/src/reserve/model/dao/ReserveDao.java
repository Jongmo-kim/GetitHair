package reserve.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import customer.model.dao.CustomerDao;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import designer.medel.vo.Designer;
import designer.model.service.DesignerService;
import hairshop.model.service.HairshopService;
import hairshop.model.vo.Hairshop;
import reserve.model.vo.Reserve;

public class ReserveDao {

	public int insertReserve(Connection conn, Reserve reserve) {
		PreparedStatement pstmt = null;
		String sql = "insert into reserve values(reserve_seq.nextval,?,?,?,sysdate,?,?,?,?)";
		int result = 0 ;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserve.getCustomer().getCustomerNo());
			pstmt.setInt(2, reserve.getDesigner().getDesignerNo());
			pstmt.setInt(3, reserve.getShop().getShopNo());
			pstmt.setDate(4, reserve.getReserveDate());
			pstmt.setString(5, reserve.getReserveStatus());
			pstmt.setString(6,reserve.getReserveCustReq());
			pstmt.setString(7, reserve.getReserveDesignerReq());
			pstmt.setString(8, reserve.getReserveDesignerMemo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Reserve selectOneReserve(Connection conn, int reserveNo) {
		Reserve reserve = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from reserve where reserve_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				reserve = getReserveFromRset(rset);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reserve;
	}

	
	private Reserve getReserveFromRset(ResultSet rset) {
		Reserve reserve = new Reserve();
		try {
			reserve.setReserveNo(rset.getInt("reserve_no"));
			reserve.setCustomer(getCustomerByNo(rset.getInt("customer_no")));
			reserve.setDesigner(getDesignerByNo(rset.getInt("designer_no")));
			reserve.setShop(getHairshopByNo(rset.getInt("shop_no")));
			reserve.setReserveDate(rset.getDate("reserve_date"));
			reserve.setReserveStatus(rset.getString("reserve_status"));
			reserve.setReserveCustReq(rset.getString("reserve_cust_req"));
			reserve.setReserveDesignerReq(rset.getString("reserve_designer_req"));
			reserve.setReserveDesignerMemo(rset.getString("reserve_designer_memo"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reserve;
	}
	private Customer getCustomerByNo(int no) {
		Customer cust = new CustomerService().selectOneCustomer(no);
		if(cust == null) {
			cust = new Customer();
			cust.setCustomerNo(-1);
		}
		return cust;
	}
	private Designer getDesignerByNo(int no) {
		Designer designer = new DesignerService().selectOneDesigner(no);
		if(designer == null) {
			designer = new Designer();
			designer.setDesignerNo(-1);
		}
		return designer;
	}
	private Hairshop getHairshopByNo(int no) {
		Hairshop hairshop = new HairshopService().selectOneHairshop(no);
		if(hairshop == null) {
			hairshop = new Hairshop();
			hairshop.setHairshopNo(-1);
		}
		return hairshop;
	}
	public int deleteReserve(Connection conn, int reserveNo) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		String sql = "delete from reserve where reserve_no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

	

}