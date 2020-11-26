package style.model.vo;

import java.util.ArrayList;

public class StylePageData {
	private ArrayList<Style> list;
	private String reqPage;
	public StylePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StylePageData(ArrayList<Style> list, String reqPage) {
		super();
		this.list = list;
		this.reqPage = reqPage;
	}
	public ArrayList<Style> getList() {
		return list;
	}
	public void setList(ArrayList<Style> list) {
		this.list = list;
	}
	public String getReqPage() {
		return reqPage;
	}
	public void setReqPage(String reqPage) {
		this.reqPage = reqPage;
	}
	
}
