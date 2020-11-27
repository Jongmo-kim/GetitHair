package designerportfolio.model.vo;

public class DesignerPortfolio {
	private int portfolioNo;
	private String portfolioWriter;
	private String styleName;
	private String portfolioContent;
	private String filepath;
	private String portfolioDate;
	public DesignerPortfolio() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DesignerPortfolio(int portfolioNo, String portfolioWriter, String styleName, String portfolioContent,
			String filepath, String portfolioDate) {
		super();
		this.portfolioNo = portfolioNo;
		this.portfolioWriter = portfolioWriter;
		this.styleName = styleName;
		this.portfolioContent = portfolioContent;
		this.filepath = filepath;
		this.portfolioDate = portfolioDate;
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
	public String getPortfolioContent() {
		return portfolioContent;
	}
	public void setPortfolioContent(String portfolioContent) {
		this.portfolioContent = portfolioContent;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getPortfolioDate() {
		return portfolioDate;
	}
	public void setPortfolioDate(String portfolioDate) {
		this.portfolioDate = portfolioDate;
	}
}
