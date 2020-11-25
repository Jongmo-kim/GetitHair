package designer.model.vo;

public class Designer {
	private int designerNo;
	private String designerId;
	private String designerPw;
	private String designerGen;
	private String designerName;
	private String designerEmail;
	private String designerPhone;
	private int designerYear;
	private String designerRank;
	private String designerIntro;
	private String designerKeyword;
	private String designerImg;
	public Designer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Designer(int designerNo, String designerId, String designerPw, String designerGen,
			String designerName, String designerEmail, String designerPhone, int designerYear, String designerRank,
			String designerIntro, String designerKeyword, String designerImg) {
		super();
		this.designerNo = designerNo;
		this.designerId = designerId;
		this.designerPw = designerPw;
		this.designerGen = designerGen;
		this.designerName = designerName;
		this.designerEmail = designerEmail;
		this.designerPhone = designerPhone;
		this.designerYear = designerYear;
		this.designerRank = designerRank;
		this.designerIntro = designerIntro;
		this.designerKeyword = designerKeyword;
		this.designerImg = designerImg;
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
	public String getDesignerGen() {
		return designerGen;
	}
	public void setDesignerGen(String designerGen) {
		this.designerGen = designerGen;
	}
	public String getDesignerName() {
		return designerName;
	}
	public void setDesignerName(String designerName) {
		this.designerName = designerName;
	}
	public String getDesignerEmail() {
		return designerEmail;
	}
	public void setDesignerEmail(String designerEmail) {
		this.designerEmail = designerEmail;
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
	public String getDesignerKeyword() {
		return designerKeyword;
	}
	public void setDesignerKeyword(String designerKeyword) {
		this.designerKeyword = designerKeyword;
	}
	public String getDesignerImg() {
		return designerImg;
	}
	public void setDesignerImg(String designerImg) {
		this.designerImg = designerImg;
	}
}
