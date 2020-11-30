package stylelist.model.vo;

import designer.model.vo.Designer;
import shopprice.model.vo.ShopPrice;
import style.model.vo.Style;

public class Stylelist {
	private int stylelistNo;
	private Style style;
	private Designer designer;
	private ShopPrice shopPrice;
	public Stylelist(int stylelistNo, Style style, Designer designer, ShopPrice shopPrice) {
		super();
		this.stylelistNo = stylelistNo;
		this.style = style;
		this.designer = designer;
		this.shopPrice = shopPrice;
	}
	public Stylelist() {
		super();
	}
	public int getStylelistNo() {
		return stylelistNo;
	}
	public void setStylelistNo(int stylelistNo) {
		this.stylelistNo = stylelistNo;
	}
	public Style getStyle() {
		return style;
	}
	public void setStyle(Style style) {
		this.style = style;
	}
	public Designer getDesigner() {
		return designer;
	}
	public void setDesigner(Designer designer) {
		this.designer = designer;
	}
	public ShopPrice getShopPrice() {
		return shopPrice;
	}
	public void setShopPrice(ShopPrice shopPrice) {
		this.shopPrice = shopPrice;
	}
	@Override
	public String toString() {
		return "Stylelist [stylelistNo=" + stylelistNo + ", style=" + style + ", designer=" + designer + ", shopPrice="
				+ shopPrice + "]";
	}
	
}
