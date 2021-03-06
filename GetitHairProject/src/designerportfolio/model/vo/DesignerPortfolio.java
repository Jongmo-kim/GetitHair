package designerportfolio.model.vo;

public class DesignerPortfolio {
	private int portfolioNo;
	private String portfolioWriter;//디자이너
	private String styleName;//시술명
	private String portfolioContent;
	private String portfolioDate;
	private String filepath;
	public DesignerPortfolio() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DesignerPortfolio(int portfolioNo, String portfolioWriter, String styleName, String portfolioContent,
			String portfolioDate, String filepath) {
		super();
		this.portfolioNo = portfolioNo;
		this.portfolioWriter = portfolioWriter;
		this.styleName = styleName;
		this.portfolioContent = portfolioContent;
		this.portfolioDate = portfolioDate;
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
	public String getPortfolioContent() {
		return portfolioContent;
	}
	public void setPortfolioContent(String portfolioContent) {
		this.portfolioContent = portfolioContent;
	}
	public String getPortfolioDate() {
		return portfolioDate;
	}
	public void setPortfolioDate(String portfolioDate) {
		this.portfolioDate = portfolioDate;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
}
