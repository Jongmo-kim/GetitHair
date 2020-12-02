package shopprice.model.vo;

import hairshop.model.vo.Hairshop;
import stylelist.model.vo.Stylelist;

public class ShopPrice {
	private int shopPriceNo;
	private Hairshop hairshop;
	private Stylelist styleList;
	private int price;
	public Stylelist getStyleList() {
		return styleList;
	}
	public void setStyleList(Stylelist styleList) {
		this.styleList = styleList;
	}
	public int getShopPriceNo() {
		return shopPriceNo;
	}
	public void setShopPriceNo(int shopPriceNo) {
		this.shopPriceNo = shopPriceNo;
	}
	public Hairshop getHairshop() {
		return hairshop;
	}
	public void setHairshop(Hairshop hairshop) {
		this.hairshop = hairshop;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public ShopPrice(int shopPriceNo, Hairshop hairshop,Stylelist styleList, int price) {
		super();
		this.shopPriceNo = shopPriceNo;
		this.hairshop = hairshop;
		this.styleList = styleList;
		this.price = price;
	}
	public ShopPrice() {
		super();
	}
	@Override
	public String toString() {
		return "ShopPrice [shopPriceNo=" + shopPriceNo + ", hairshop=" + hairshop + ", price=" + price + "]";
	}
	
}
