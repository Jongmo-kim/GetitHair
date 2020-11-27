package likes.model.vo;

import customer.model.vo.Customer;


public class Likes {
	private int likesNo;
	private Customer customer;
	private LikesType likesType;
	
	public Likes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Likes(int likesNo, Customer customer, likes.model.vo.LikesType likesType) {
		super();
		this.likesNo = likesNo;
		this.customer = customer;
		this.likesType = likesType;
	}

	public int getLikesNo() {
		return likesNo;
	}

	public void setLikesNo(int likesNo) {
		this.likesNo = likesNo;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public LikesType getLikesType() {
		return likesType;
	}

	public void setLikesType(LikesType likesType) {
		this.likesType = likesType;
	}

	@Override
	public String toString() {
		String str = "";
		str += "likesNo :" +likesNo+"\n";
		str += "customerNo :" +customer.getCustomerNo()+"\n";
		str += "likesTypeNo :" +likesType.getLikesTypeNo()+"\n";
		str += "likesType :" +likesType.getLikesType()+"\n";
		return str;
	}
	
}
