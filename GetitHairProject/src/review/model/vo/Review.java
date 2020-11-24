package review.model.vo;

public class Review {
	private int reviewNo;
	private int shopNo;
	private int designerNo;
	private int customerNo;
	private int styleNo;
	private String reviewContent;
	private int reviewRate;
	private int reviewLikes;
	private String reviewDate;
	private String reviewImg;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, int shopNo, int designerNo, int customerNo, int styleNo, String reviewContent,
			int reviewRate, int reviewLikes, String reviewDate, String reviewImg) {
		super();
		this.reviewNo = reviewNo;
		this.shopNo = shopNo;
		this.designerNo = designerNo;
		this.customerNo = customerNo;
		this.styleNo = styleNo;
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

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public int getDesignerNo() {
		return designerNo;
	}

	public void setDesignerNo(int designerNo) {
		this.designerNo = designerNo;
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public int getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
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
