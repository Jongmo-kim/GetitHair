package style.model.vo;

public class Style {
	private int styleNo;
	private String styleType;//cut, color, perm, etc
	private String styleName;//상세 이름
	private int styleLikes;
	public Style() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Style(int styleNo, String styleType, String styleName, int styleLikes) {
		super();
		this.styleNo = styleNo;
		this.styleType = styleType;
		this.styleName = styleName;
		this.styleLikes = styleLikes;
	}
	public int getStyleNo() {
		return styleNo;
	}
	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}
	public String getStyleType() {
		return styleType;
	}
	public void setStyleType(String styleType) {
		this.styleType = styleType;
	}
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	public int getStyleLikes() {
		return styleLikes;
	}
	public void setStyleLikes(int styleLikes) {
		this.styleLikes = styleLikes;
	}
}
