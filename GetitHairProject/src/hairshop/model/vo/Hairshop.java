package hairshop.model.vo;

import java.util.Date;

//장소, 가격, 소속디자이너들, 미용실 이름, 미용실 사진, 리뷰 , 시설정보


public class Hairshop {
	private int shopNo;				//헤어샵 번호
	private String shopId;
	private String shopPw;
	private String shopCompNo;		//사업자 등록번호
	private String shopName;		//헤어샵명
	private String shopAddr;		//샵 장소
	private String shopPhone;		//샵 번호
	private String shopOpen;		//샵 오픈시간
	private String shopClose;		//샵 닫는 시간
	private String shopHoliday;		//정기 휴무일
	private int shopRate;			//평점
	private int shopLikes;			//샵 좋아요수
	private String addrDetail;		//상세주소
	private String addrPostcode;	//우편번호
	private Date enrollDate;		//시간
	public Hairshop() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Hairshop(int shopNo, String shopId, String shopPw, String shopCompNo, String shopName, String shopAddr,
			String shopPhone, String shopOpen, String shopClose, String shopHoliday, int shopRate, int shopLikes,
			String addrDetail, String addrPostcode, Date enrollDate) {
		super();
		this.shopNo = shopNo;
		this.shopId = shopId;
		this.shopPw = shopPw;
		this.shopCompNo = shopCompNo;
		this.shopName = shopName;
		this.shopAddr = shopAddr;
		this.shopPhone = shopPhone;
		this.shopOpen = shopOpen;
		this.shopClose = shopClose;
		this.shopHoliday = shopHoliday;
		this.shopRate = shopRate;
		this.shopLikes = shopLikes;
		this.addrDetail = addrDetail;
		this.addrPostcode = addrPostcode;
		this.enrollDate = enrollDate;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getShopPw() {
		return shopPw;
	}
	public void setShopPw(String shopPw) {
		this.shopPw = shopPw;
	}
	public String getShopCompNo() {
		return shopCompNo;
	}
	public void setShopCompNo(String shopCompNo) {
		this.shopCompNo = shopCompNo;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopAddr() {
		return shopAddr;
	}
	public void setShopAddr(String shopAddr) {
		this.shopAddr = shopAddr;
	}
	public String getShopPhone() {
		return shopPhone;
	}
	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}
	public String getShopOpen() {
		return shopOpen;
	}
	public void setShopOpen(String shopOpen) {
		this.shopOpen = shopOpen;
	}
	public String getShopClose() {
		return shopClose;
	}
	public void setShopClose(String shopClose) {
		this.shopClose = shopClose;
	}
	public String getShopHoliday() {
		return shopHoliday;
	}
	public void setShopHoliday(String shopHoliday) {
		this.shopHoliday = shopHoliday;
	}
	public int getShopRate() {
		return shopRate;
	}
	public void setShopRate(int shopRate) {
		this.shopRate = shopRate;
	}
	public int getShopLikes() {
		return shopLikes;
	}
	public void setShopLikes(int shopLikes) {
		this.shopLikes = shopLikes;
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
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
}