package designer.model.vo;

import hairshop.model.vo.Hairshop;

public class Designer {
	private int designerNo;
	private String designerId;
	private String designerPw;
	private String designerName;
	private String designerPhone;
	private int designerYear;
	private String designerRank;
	private String designerIntro;
	private String designerEnrolldate;
	private Hairshop shop;
	public Designer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Designer(int designerNo, String designerId, String designerPw, String designerName, String designerPhone,
			int designerYear, String designerRank, String designerIntro, String designerEnrolldate, Hairshop shop) {
		super();
		this.designerNo = designerNo;
		this.designerId = designerId;
		this.designerPw = designerPw;
		this.designerName = designerName;
		this.designerPhone = designerPhone;
		this.designerYear = designerYear;
		this.designerRank = designerRank;
		this.designerIntro = designerIntro;
		this.designerEnrolldate = designerEnrolldate;
		this.shop = shop;
	}
	public int getDesignerNo() {
		return designerNo;
	}
	public void setDesignerNo(int designerNo) {
		this.designerNo = designerNo;
	}
	public String getDesignerId() {
		return designerId;
	}
	public void setDesignerId(String designerId) {
		this.designerId = designerId;
	}
	public String getDesignerPw() {
		return designerPw;
	}
	public void setDesignerPw(String designerPw) {
		this.designerPw = designerPw;
	}
	public String getDesignerName() {
		return designerName;
	}
	public void setDesignerName(String designerName) {
		this.designerName = designerName;
	}
	public String getDesignerPhone() {
		return designerPhone;
	}
	public void setDesignerPhone(String designerPhone) {
		this.designerPhone = designerPhone;
	}
	public int getDesignerYear() {
		return designerYear;
	}
	public void setDesignerYear(int designerYear) {
		this.designerYear = designerYear;
	}
	public String getDesignerRank() {
		return designerRank;
	}
	public void setDesignerRank(String designerRank) {
		this.designerRank = designerRank;
	}
	public String getDesignerIntro() {
		return designerIntro;
	}
	public void setDesignerIntro(String designerIntro) {
		this.designerIntro = designerIntro;
	}
	public String getDesignerEnrolldate() {
		return designerEnrolldate;
	}
	public void setDesignerEnrolldate(String designerEnrolldate) {
		this.designerEnrolldate = designerEnrolldate;
	}
	public Hairshop getShop() {
		return shop;
	}
	public void setShop(Hairshop shop) {
		this.shop = shop;
	}
}
