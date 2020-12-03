package designerportfolio.model.vo;

import java.util.ArrayList;

import image.model.vo.Image;

public class DesignerportfolioImage {
	private ArrayList<Image> imglist;
	private ArrayList<DesignerPortfolio> portfoliolist;
	public DesignerportfolioImage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DesignerportfolioImage(ArrayList<Image> imglist, ArrayList<DesignerPortfolio> portfoliolist) {
		super();
		this.imglist = imglist;
		this.portfoliolist = portfoliolist;
	}
	public ArrayList<Image> getImglist() {
		return imglist;
	}
	public void setImglist(ArrayList<Image> imglist) {
		this.imglist = imglist;
	}
	public ArrayList<DesignerPortfolio> getPortfoliolist() {
		return portfoliolist;
	}
	public void setPortfoliolist(ArrayList<DesignerPortfolio> portfoliolist) {
		this.portfoliolist = portfoliolist;
	}
}
