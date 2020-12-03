package reserve.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import reserveTest.model.vo.ReserveTest;
import stylelist.model.service.StylelistService;
import stylelist.model.vo.Stylelist;

public class ReserveDao {

   public int insertReserve(Connection conn, Reserve reserve) {
      PreparedStatement pstmt = null;
      String sql = "insert into reserve values(reserve_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
      int result = 0 ;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, reserve.getCustomer().getCustomerNo());
         pstmt.setInt(2, reserve.getDesigner().getDesignerNo());
         pstmt.setInt(3, reserve.getShop().getShopNo());
         pstmt.setString(4, null);
         pstmt.setString(5, reserve.getReserveTitle());
         pstmt.setString(6, reserve.getReserveStatus());
         pstmt.setString(7, reserve.getReserveCustReq());
         pstmt.setString(8, "");
         pstmt.setString(9, "");
         pstmt.setTimestamp(10, new Timestamp(reserve.getReserveDate().getTime()));
         pstmt.setTimestamp(11, new Timestamp(reserve.getReserveStartdate().getTime()));
         pstmt.setTimestamp(12, new Timestamp(reserve.getReserveEndDate().getTime()));
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
         reserve.setStylelist(getStyleListByNo(rset.getInt("stylelist_no")));
         reserve.setReserveTitle(rset.getString("reserve_title"));
         reserve.setReserveStatus(rset.getString("reserve_status"));
         reserve.setReserveCustReq(rset.getString("reserve_cust_req"));
         reserve.setReserveDesignerReq(rset.getString("reserve_designer_req"));
         reserve.setReserveDesignerMemo(rset.getString("reserve_designer_memo"));
         reserve.setReserveDate(new Date(rset.getTimestamp("reserve_date").getTime()));
         reserve.setReserveStartdate(new Date(rset.getTimestamp("reserve_startdate").getTime()));
         reserve.setReserveEndDate(new Date(rset.getTimestamp("reserve_enddate").getTime()));
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
   private Stylelist getStyleListByNo(int no) {
	   Stylelist stylelist = new StylelistService().selectOneStylelist(no);
	   if(stylelist == null) {
		   stylelist = new Stylelist();
		   stylelist.setStylelistNo(-1);
	      }
	   return stylelist;
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

   public ArrayList<Reserve> selectListCustomerSelStatus(Connection conn, int start, int end, String sqlAdd,int customerNo) {
      ArrayList<Reserve> list = new ArrayList<Reserve>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = "select * from (select rownum as rnum, n.* from (select * from reserve where customer_no=? "+sqlAdd+" order by 1 desc)N) where rnum between ? and ?";
            
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, customerNo);
         pstmt.setInt(2, start);
         pstmt.setInt(3, end);               
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

public int getTotalCount(Connection conn, String sqlAdd) {
	int result =0;
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    String sql = "select count(*) cnt from reserve "+sqlAdd;
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

public int insertReReserve(Connection conn, Reserve reserve) {
	PreparedStatement pstmt = null;
    //String sql = "insert into reserve values(reserve_seq.nextval,?,?,?,?,sysdate,'예약',?,'','')";
	//태민local sql insert into reserve values(reserve_seq.nextval,1,1,1,1,'2020-12-01','예약','테스트123','','');
    String sql = "INSERT INTO RESERVE VALUES(RESERVE_SEQ.NEXTVAL,?,?,?,?,?,DEFAULT,?,?,?,?,?,?)";
    int result = 0 ;
    try {
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, reserve.getCustomer().getCustomerNo());
       pstmt.setInt(2, reserve.getDesigner().getDesignerNo());
       pstmt.setInt(3, reserve.getShop().getShopNo());
       pstmt.setInt(4, reserve.getStylelist().getStylelistNo());
       pstmt.setString(5, reserve.getReserveTitle());
       //pstmt.setString(6, reserve.getReserveStatus());//DEFAULT인 '예약'으로 설정
       pstmt.setString(6,reserve.getReserveCustReq());
       pstmt.setString(7,reserve.getReserveDesignerReq());
       pstmt.setString(8,reserve.getReserveDesignerMemo());       
       pstmt.setTimestamp(9,new Timestamp(reserve.getReserveDate().getTime()));      
       pstmt.setTimestamp(10,new Timestamp(reserve.getReserveStartdate().getTime()));
       pstmt.setTimestamp(11,new Timestamp(reserve.getReserveEndDate().getTime()));
       result = pstmt.executeUpdate();
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       JDBCTemplate.close(pstmt);
    }
    return result;
}


public int cancelReserve(Connection conn, int reserveNo) {
	int result = 0;
    String sql = "update reserve set reserve_status = '취소' where reserve_no=?";
    PreparedStatement pstmt = null;
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

public int selectAllByDate(Connection conn, Date startSqlDate, Date endSqlDate) {
	int result = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select count(*) from reserve where reserve_enddate between ? and ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setDate(1, startSqlDate);
		pstmt.setDate(2, endSqlDate);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			result = rs.getInt(1);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
	}
	
	return result;
}

public ArrayList<Reserve> selectOneReserveShop(Connection conn, int shopNo) {
	ArrayList<Reserve> list = new ArrayList<Reserve>();
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    String sql = "select * from reserve where shop_no = ?";
    try {
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, shopNo);
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

	// 디자이너 예약관리 캘린더 조회 메소드
	public int updateReserveCalnedar(Connection conn, Reserve rt) {
		PreparedStatement pstmt = null;
		String query = "update reserve set reserve_title=?, reserve_date=?, reserve_startdate=?, reserve_enddate=?, reserve_status=?, reserve_cust_req=?, reserve_designer_req=?, reserve_designer_memo=? where reserve_no=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rt.getReserveTitle());
			pstmt.setTimestamp(2, new Timestamp(rt.getReserveDate().getTime()));
			pstmt.setTimestamp(3, new Timestamp(rt.getReserveStartdate().getTime()));
			pstmt.setTimestamp(4, new Timestamp(rt.getReserveEndDate().getTime()));
			pstmt.setString(5, rt.getReserveStatus());
			pstmt.setString(6, rt.getReserveCustReq());
			pstmt.setString(7, rt.getReserveDesignerReq());
			pstmt.setString(8, rt.getReserveDesignerMemo());
			pstmt.setInt(9, rt.getReserveNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	public int updateDateReserve(Connection conn, int no, String title, Date startDate, Date endDate) {
		PreparedStatement pstmt = null;
		String sql = "update reserve set reserve_startdate = ? , reserve_endDate = ?, reserve_title = ? where reserve_no = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setTimestamp(1, new Timestamp(startDate.getTime()));
			pstmt.setTimestamp(2, new Timestamp(endDate.getTime()));
			pstmt.setString(3, title);
			pstmt.setInt(4, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Object[] selectAllReviewById(Connection conn, int no, int reqPage, int maxPrintSize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String qrySelect = "SELECT R.*,(SELECT COUNT(*) FROM (SELECT D.* FROM reserve D WHERE customer_no = ? ORDER BY D.customer_NO DESC) D) as cnt FROM (SELECT ROWNUM RN,D.* FROM "
				+ "(SELECT D.* FROM reserve D WHERE customer_no = ? ORDER BY D.customer_NO DESC) D) R "
				+ "WHERE RN BETWEEN ? AND ?";
		ArrayList<Reserve> list = null;
		int cnt =0;
		try {
			pstmt = conn.prepareStatement(qrySelect);
			pstmt.setInt(1, no);
			pstmt.setInt(2, no);
			pstmt.setInt(3, (maxPrintSize*(reqPage-1))+1);
			pstmt.setInt(4, maxPrintSize*reqPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(list == null)
					list = new ArrayList<Reserve>();
				cnt = rs.getInt("cnt");
				Reserve rsv = getReserveFromRset(rs);
				
				list.add(rsv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}
		return new Object[] {cnt,list};
	}   
}