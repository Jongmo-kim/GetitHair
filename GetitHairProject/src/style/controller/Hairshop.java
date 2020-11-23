package style.controller;

//장소, 가격, 소속디자이너들, 미용실 이름, 미용실 사진, 리뷰 , 시설정보
public class Hairshop {
private int shopNo; //헤어샵 번호
private String shopCompNo; //사업자 등록번호
private String shopName; //사업ㅈ명
private String shopAddr; //샵 장소
private String shopPhone; //샵 번호
private String shopTime; //샵 영업시간
private String shopOpen; //샵 오픈시간
private String shopClose; //샵 닫는 시간
private String shopHoliday; //정기 휴무일
private int shopRate; //평점
private String shopImg; //매장 이미지
private int shopLikes; //샵 좋아요수
private String addrDetail; //상세주소
private String addrPostcode; //우편번호
public Hairshop() {
super();
//TODO Auto-generated constructor stub
}
public Hairshop(int shopNo, String shopCompNo, String shopName, String shopAddr, String shopPhone, String shopTime,
String shopOpen, String shopClose, String shopHoliday, int shopRate, String shopImg, int shopLikes,
String addrDetail, String addrPostcode) {
super();
this.shopNo = shopNo;
this.shopCompNo = shopCompNo;
this.shopName = shopName;
this.shopAddr = shopAddr;
this.shopPhone = shopPhone;
this.shopTime = shopTime;
this.shopOpen = shopOpen;
this.shopClose = shopClose;
this.shopHoliday = shopHoliday;
this.shopRate = shopRate;
this.shopImg = shopImg;
this.shopLikes = shopLikes;
this.addrDetail = addrDetail;
this.addrPostcode = addrPostcode;
}
public int getShopNo() {
return shopNo;
}
public void setShopNo(int shopNo) {
this.shopNo = shopNo;
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
public String getShopTime() {
return shopTime;
}
public void setShopTime(String shopTime) {
this.shopTime = shopTime;
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
public String getShopImg() {
return shopImg;
}
public void setShopImg(String shopImg) {
this.shopImg = shopImg;
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
}