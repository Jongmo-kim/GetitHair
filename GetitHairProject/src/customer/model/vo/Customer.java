package customer.model.vo;

import java.io.Serializable;
public class Customer implements Serializable{
	private static final long serialVersionUID = 1L;
	private int customerNo;
	private String customerId;
	private String customerPw;
	private String customerGen;
	private String customerName;
	private String customerEmail;
	private String customerAddr;
	private String customerPhone;
	private String addrDetail;
	private String addrPostcode;
	private String customerBirthdate;
	private String customerEnrolldate;
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(int customerNo, String customerId, String customerPw, String customerGen, String customerName,
			String customerEmail, String customerAddr, String customerPhone, String addrDetail, String addrPostcode,
			String customerBirthdate, String customerEnrolldate) {
		super();
		this.customerNo = customerNo;
		this.customerId = customerId;
		this.customerPw = customerPw;
		this.customerGen = customerGen;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerAddr = customerAddr;
		this.customerPhone = customerPhone;
		this.addrDetail = addrDetail;
		this.addrPostcode = addrPostcode;
		this.customerBirthdate = customerBirthdate;
		this.customerEnrolldate = customerEnrolldate;
	}
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerPw() {
		return customerPw;
	}
	public void setCustomerPw(String customerPw) {
		this.customerPw = customerPw;
	}
	public String getCustomerGen() {
		return customerGen;
	}
	public void setCustomerGen(String customerGen) {
		this.customerGen = customerGen;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerAddr() {
		return customerAddr;
	}
	public void setCustomerAddr(String customerAddr) {
		this.customerAddr = customerAddr;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getAddrPostcode() {
		return addrPostcode;
	}
	public void setAddrPostcode(String addrPostcode) {
		this.addrPostcode = addrPostcode;
	}
	public String getCustomerBirthdate() {
		return customerBirthdate;
	}
	public void setCustomerBirthdate(String customerBirthdate) {
		this.customerBirthdate = customerBirthdate;
	}
	public String getCustomerEnrolldate() {
		return customerEnrolldate;
	}
	public void setCustomerEnrolldate(String customerEnrolldate) {
		this.customerEnrolldate = customerEnrolldate;
	}
	@Override
	public String toString() {
		String str = "";
		str += "회원번호 :" + customerNo + "\n";
		str += "회원아이디 :" + customerId + "\n";
		str += "회원암호 :" + customerPw + "\n";
		str += "회원성별 :" + customerGen + "\n";
		str += "회원성별 :" + customerName + "\n";
		str += "회원이메일 :" + customerEmail + "\n";
		str += "회원주소 :" + customerAddr + "\n";
		str += "회원전화번호 :" + customerPhone + "\n";
		str += "회원상세주소 :" + addrDetail + "\n";
		str += "회원우편번호 :" + addrPostcode + "\n";
		str += "회원생년월일 :" + customerBirthdate + "\n";
		str += "회원가입일자 :" + customerEnrolldate + "";
		return str;
	}
}
