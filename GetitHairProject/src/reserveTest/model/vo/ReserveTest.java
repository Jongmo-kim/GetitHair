package reserveTest.model.vo;

import java.sql.Date;

import customer.model.vo.Customer;
import designer.model.vo.Designer;
import hairshop.model.vo.Hairshop;

public class ReserveTest {
	private int reserveNo;
	private Customer customer;
	private Designer designer;
	private Hairshop shop;
	private Date reserveDate;
	private String reserveStatus;
	private String reserveCustReq;
	private String reserveDesignerReq;
	private String reserveDesignerMemo;
	private Date reserveStartDate;
	private Date reserveEndDate;
	private String reserveTitle;
	
	public Date getReserveStartDate() {
		return reserveStartDate;
	}
	public void setReserveStartDate(Date reserveStartDate) {
		this.reserveStartDate = reserveStartDate;
	}
	
	public Date getReserveEndDate() {
		return reserveEndDate;
	}
	public void setReserveEndDate(Date reserveEndDate) {
		this.reserveEndDate = reserveEndDate;
	}
	public String getReserveTitle() {
		return reserveTitle;
	}
	public void setReserveTitle(String reserveTitle) {
		this.reserveTitle = reserveTitle;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Designer getDesigner() {
		return designer;
	}
	public void setDesigner(Designer designer) {
		this.designer = designer;
	}
	public Hairshop getShop() {
		return shop;
	}
	public void setShop(Hairshop shop) {
		this.shop = shop;
	}
	public Date getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
	public String getReserveStatus() {
		return reserveStatus;
	}
	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
	}
	public String getReserveCustReq() {
		return reserveCustReq;
	}
	public void setReserveCustReq(String reserveCustReq) {
		this.reserveCustReq = reserveCustReq;
	}
	public String getReserveDesignerReq() {
		return reserveDesignerReq;
	}
	public void setReserveDesignerReq(String reserveDesignerReq) {
		this.reserveDesignerReq = reserveDesignerReq;
	}
	public String getReserveDesignerMemo() {
		return reserveDesignerMemo;
	}
	public void setReserveDesignerMemo(String reserveDesignerMemo) {
		this.reserveDesignerMemo = reserveDesignerMemo;
	}
	
	public ReserveTest(int reserveNo, Customer customer, Designer designer, Hairshop shop, Date reserveDate,
			String reserveStatus, String reserveCustReq, String reserveDesignerReq, String reserveDesignerMemo,
			Date reserveStartDate, Date reserveEndDate, String reserveTitle) {
		super();
		this.reserveNo = reserveNo;
		this.customer = customer;
		this.designer = designer;
		this.shop = shop;
		this.reserveDate = reserveDate;
		this.reserveStatus = reserveStatus;
		this.reserveCustReq = reserveCustReq;
		this.reserveDesignerReq = reserveDesignerReq;
		this.reserveDesignerMemo = reserveDesignerMemo;
		this.reserveStartDate = reserveStartDate;
		this.reserveEndDate = reserveEndDate;
		this.reserveTitle = reserveTitle;
	}
	public ReserveTest() {
		super();
	}
	
	@Override
	public String toString() {
		String str = "";
		str += "reserveNo :"+Integer.toString(reserveNo) +"\n";
		str += "Customer :"+customer.toString() +"\n";
		str += "designer :"+designer.toString() +"\n";
		str += "shop :"+shop.toString() +"\n";
		str += "reserveDate :"+reserveDate.toString() +"\n";
		str += "reserveStatus :"+reserveStatus+"\n";
		str += "reserveCustReq :"+reserveDesignerReq+"\n";
		str += "reserveDesignerReq :"+reserveDesignerMemo+"\n";
		str += "reserveStartDate :"+reserveStartDate + "\n";
		str += "reserveEndDate :"+ reserveEndDate + "\n";
		str += "reserveTitle :"+reserveTitle + "\n";
		return str;
	}
	
}
