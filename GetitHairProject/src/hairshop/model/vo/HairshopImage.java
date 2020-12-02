package hairshop.model.vo;

import java.util.ArrayList;

import image.model.vo.Image;

public class HairshopImage {
	private ArrayList<Image> imglist;
	private ArrayList<Hairshop> shoplist;
	public HairshopImage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HairshopImage(ArrayList<Image> imglist, ArrayList<Hairshop> shoplist) {
		super();
		this.imglist = imglist;
		this.shoplist = shoplist;
	}
	public ArrayList<Image> getImglist() {
		return imglist;
	}
	public void setImglist(ArrayList<Image> imglist) {
		this.imglist = imglist;
	}
	public ArrayList<Hairshop> getShoplist() {
		return shoplist;
	}
	public void setShoplist(ArrayList<Hairshop> shoplist) {
		this.shoplist = shoplist;
	}
	
}
