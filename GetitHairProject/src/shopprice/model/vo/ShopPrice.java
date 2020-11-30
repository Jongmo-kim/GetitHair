package shopprice.model.vo;

import hairshop.model.vo.Hairshop;

public class ShopPrice {
	private int shopPriceNo;
	private Hairshop hairshop;
	private int price;
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
	public ShopPrice(int shopPriceNo, Hairshop hairshop, int price) {
		super();
		this.shopPriceNo = shopPriceNo;
		this.hairshop = hairshop;
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
