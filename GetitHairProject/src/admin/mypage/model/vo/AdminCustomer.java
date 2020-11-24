package admin.mypage.model.vo;

public class AdminCustomer {
	private int no;
	private String custId;
	private String custGender;
	private String custName;
	private String enrollDate;
	
	public AdminCustomer() {
		// TODO Auto-generated constructor stub
	}

	public AdminCustomer(int no, String custId, String custGender, String custName, String enrollDate) {
		super();
		this.no = no;
		this.custId = custId;
		this.custGender = custGender;
		this.custName = custName;
		this.enrollDate = enrollDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustGender() {
		return custGender;
	}

	public void setCustGender(String custGender) {
		this.custGender = custGender;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	
}
