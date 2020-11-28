package reserve.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import customer.model.dao.CustomerDao;
import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import designer.model.vo.Designer;
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
      } finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
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
         hairshop.setShopNo(-1);
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
      } finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }

   public ArrayList<Reserve> selectAll(Connection conn) {
      ArrayList<Reserve> list = new ArrayList<Reserve>();
      String sql = "select * from reserve";
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      try {
         pstmt = conn.prepareStatement(sql);
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Reserve r  = getReserveFromRset(rset);
            list.add(r);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }
      return list;
   }
   public ArrayList<Reserve> selectAllByCust(Connection conn,int CustomerNo) {
      ArrayList<Reserve> list = new ArrayList<Reserve>();
      String sql = "select * from reserve where customer_no = ?";
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, CustomerNo);
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Reserve r  = getReserveFromRset(rset);
            list.add(r);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }
      return list;
   }
   public ArrayList<Reserve> selectAllByDesigner(Connection conn,int DesignerNo) {
      ArrayList<Reserve> list = new ArrayList<Reserve>();
      String sql = "select * from reserve where designer_no = ?";
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, DesignerNo);
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Reserve r  = getReserveFromRset(rset);
            list.add(r);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }
      return list;
   }

   public int updateReserve(Connection conn, Reserve reserve) {
      int result = 0;
      String sql = "update reserve set reserve_status = ?, reserve_cust_req = ? "
            + ", reserve_designer_req = ?, reserve_designer_memo = ? where reserve_no = ?";
      PreparedStatement pstmt = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, reserve.getReserveStatus());
         pstmt.setString(2, reserve.getReserveCustReq());
         pstmt.setString(3, reserve.getReserveDesignerReq());
         pstmt.setString(4, reserve.getReserveDesignerMemo());
         pstmt.setInt(5, reserve.getReserveNo());
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JDBCTemplate.close(pstmt);
      }
      return result;
   }
   public int getTotalCount(Connection conn) {
      int result =0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = "select count(*) cnt from reserve";
      try {
         pstmt = conn.prepareStatement(sql);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            result = rset.getInt("cnt");
         }         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }      
      return result;
   }

   public ArrayList<Reserve> selectList(Connection conn, int startNum, int endNum) {
      ArrayList<Reserve> list = new ArrayList<Reserve>();
      String sql = "select * from (select rownum as rnum, n.* from (select * from reserve order by 1 desc)N) where rnum between ? and ?";
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, startNum);
         pstmt.setInt(2, endNum);
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Reserve r  = getReserveFromRset(rset);
            list.add(r);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }
      return list;
   }
   
   public ArrayList<Reserve> selectListCustomer(Connection conn, int startNum, int endNum,int customerNo) {
      ArrayList<Reserve> list = new ArrayList<Reserve>();
      String sql = "select * from (select rownum as rnum, n.* from (select * from reserve where customer_no=? order by 1 desc)N) where rnum between ? and ?";
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, customerNo);
         pstmt.setInt(2, startNum);
         pstmt.setInt(3, endNum);
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Reserve r  = getReserveFromRset(rset);
            list.add(r);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }
      return list;
   }

   public int getTotalCountCustomerSelStatus(Connection conn, String selStatus,int customerNo) {
      int result =0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = "select count(*) cnt from reserve where customer_no=? and reserve_status=?";
      try {
         pstmt = conn.prepareStatement(sql);         
         pstmt.setInt(1, customerNo);   
         pstmt.setString(2, selStatus);               
         rset = pstmt.executeQuery();
         if(rset.next()) {
            result = rset.getInt("cnt");
         }         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }      
      return result;
   }

   public ArrayList<Reserve> selectListCustomerSelStatus(Connection conn, int start, int end, String selStatus,int customerNo) {
      ArrayList<Reserve> list = new ArrayList<Reserve>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = "select * from (select rownum as rnum, n.* from (select * from reserve where reserve_status=? and customer_no=? order by 1 desc)N) where rnum between ? and ?";
            
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, selStatus);
         pstmt.setInt(2, customerNo);
         pstmt.setInt(3, start);
         pstmt.setInt(4, end);               
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Reserve r  = getReserveFromRset(rset);
            list.add(r);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }
      return list;
   }
   public int getTotalCountCustomer(Connection conn, int customerNo) {
      int result =0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = "select count(*) cnt from reserve where and customer_no=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, customerNo);
         rset = pstmt.executeQuery();
         if(rset.next()) {
            result = rset.getInt("cnt");
         }         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         JDBCTemplate.close(rset);
         JDBCTemplate.close(pstmt);
      }      
      return result;
   }
   
   public ArrayList<Reserve> selectListCustomerSelStatus(Connection conn, Customer customer, int start, int end,String sqlAdd) {
  		ArrayList<Reserve> list = new ArrayList<Reserve>();
  		PreparedStatement pstmt = null;
  		ResultSet rset = null;
  		//String sql = "select * from (select rownum as rnum, n.* from (select * from reserve where customer_no=? "+sqlAdd+" order by 1 desc)N) where rnum between ? and ?";
  		String sql = "select * from (select rownum as rnum, n.* from (select * from reserve where customer_no = ? "+sqlAdd+"  order by 1 desc)N) where rnum between ? and ?";	
  		try {
  			pstmt = conn.prepareStatement(sql);			
  			pstmt.setInt(1, customer.getCustomerNo());
  			pstmt.setInt(2, start);
  			pstmt.setInt(3, end);					
  			rset = pstmt.executeQuery();
  			while(rset.next()) {
  				Reserve r  = getReserveFromRset(rset);
  				list.add(r);
  			}
  			//System.out.println("dao List.size = "+list.size());
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} finally {
  			JDBCTemplate.close(rset);
  			JDBCTemplate.close(pstmt);
  		}
  		return list;
  	}
   
   public int getTotalCountCustomerSelStatus(Connection conn,int customerNo, String sqlAdd) {
  		int result =0;
  		PreparedStatement pstmt = null;
  		ResultSet rset = null;
  		String sql = "select count(*) cnt from reserve where customer_no= ? "+sqlAdd;
  		try {  			
  			pstmt = conn.prepareStatement(sql);			
  			pstmt.setInt(1, customerNo);				
  			rset = pstmt.executeQuery();
  			if(rset.next()) {
  				result = rset.getInt("cnt");
  			}			
  		} catch (SQLException e) {
  			e.printStackTrace();
  		}finally {
  			JDBCTemplate.close(rset);
  			JDBCTemplate.close(pstmt);
  		}		
  		return result;
  	}   
}