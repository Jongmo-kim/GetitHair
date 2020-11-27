package review.model.vo;

import customer.model.vo.Customer;
import designer.model.vo.Designer;
import hairshop.model.vo.Hairshop;
import style.model.vo.Style;

public class Review {
	private int reviewNo;	
	private Hairshop shop;
	private Designer designer;
	private Customer customer;
	private Style style;
	private String reviewContent;
	private int reviewRate;
	private int reviewLikes;
	private String reviewDate;
	private String reviewImg;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, Hairshop shop, Designer designer, Customer customer, Style style,
			String reviewContent, int reviewRate, int reviewLikes, String reviewDate, String reviewImg) {
		super();
		this.reviewNo = reviewNo;
		this.shop = shop;
		this.designer = designer;
		this.customer = customer;
		this.style = style;
		this.reviewContent = reviewContent;
		this.reviewRate = reviewRate;
		this.reviewLikes = reviewLikes;
		this.reviewDate = reviewDate;
		this.reviewImg = reviewImg;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public Hairshop getShop() {
		return shop;
	}

	public void setShop(Hairshop shop) {
		this.shop = shop;
	}

	public Designer getDesigner() {
		return designer;
	}

	public void setDesigner(Designer designer) {
		this.designer = designer;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Style getStyle() {
		return style;
	}

	public void setStyle(Style style) {
		this.style = style;
	}

	public String getReviewContentBr() {
		return reviewContent.replace("\r\n", "<br>");
	}
	
	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}

	public int getReviewLikes() {
		return reviewLikes;
	}

	public void setReviewLikes(int reviewLikes) {
		this.reviewLikes = reviewLikes;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}

	
}
