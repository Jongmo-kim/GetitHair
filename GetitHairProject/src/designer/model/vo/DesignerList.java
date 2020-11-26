package designer.model.vo;

import hairshop.model.vo.Hairshop;

public class DesignerList {
	private int designerListNo;
	private Hairshop shop;
	private Designer designer;
	public DesignerList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DesignerList(int designerListNo, Hairshop shop, Designer designer) {
		super();
		this.designerListNo = designerListNo;
		this.shop = shop;
		this.designer = designer;
	}
	public int getDesignerListNo() {
		return designerListNo;
	}
	public void setDesignerListNo(int designerListNo) {
		this.designerListNo = designerListNo;
	}
	public Hairshop getShop() {
		return shop;
	}
	public void setShop(Hairshop shop) {
		this.shop = shop;
	}
	public Designer getDesigner() {
		return designer;
	}
	public void setDesigner(Designer designer) {
		this.designer = designer;
	}
}
