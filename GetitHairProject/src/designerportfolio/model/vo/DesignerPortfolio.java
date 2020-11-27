package designerportfolio.model.vo;

public class DesignerPortfolio {
	private int portfolioNo;
	private String portfolioWriter;
	private String styleName;
	private String portfolioComment;
	private String filepath;
	public DesignerPortfolio() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DesignerPortfolio(int portfolioNo, String portfolioWriter, String styleName, String portfolioComment,
			String filepath) {
		super();
		this.portfolioNo = portfolioNo;
		this.portfolioWriter = portfolioWriter;
		this.styleName = styleName;
		this.portfolioComment = portfolioComment;
		this.filepath = filepath;
	}
	public int getPortfolioNo() {
		return portfolioNo;
	}
	public void setPortfolioNo(int portfolioNo) {
		this.portfolioNo = portfolioNo;
	}
	public String getPortfolioWriter() {
		return portfolioWriter;
	}
	public void setPortfolioWriter(String portfolioWriter) {
		this.portfolioWriter = portfolioWriter;
	}
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	public String getPortfolioComment() {
		return portfolioComment;
	}
	public void setPortfolioComment(String portfolioComment) {
		this.portfolioComment = portfolioComment;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
}
