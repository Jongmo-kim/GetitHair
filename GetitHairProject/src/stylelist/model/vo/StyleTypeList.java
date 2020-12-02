package stylelist.model.vo;

import java.util.ArrayList;

import style.model.vo.Style;

public class StyleTypeList {
	private String type;
	private ArrayList<ArrayList<Style>> styleList;
	public StyleTypeList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StyleTypeList(String type, ArrayList<ArrayList<Style>> styleList) {
		this.type = type;
		this.styleList = styleList;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ArrayList<ArrayList<Style>> getStyleList() {
		return styleList;
	}
	public void setStyleList(ArrayList<ArrayList<Style>> styleList) {
		this.styleList = styleList;
	}
	public void addStyleList(ArrayList<Style> list) {
		styleList.add(list);
	}
	
	
}
