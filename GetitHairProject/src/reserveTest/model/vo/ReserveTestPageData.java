package reserveTest.model.vo;

import java.util.ArrayList;

public class ReserveTestPageData {
	private ArrayList<ReserveTest> list;
	private String pageNavi;
	public ArrayList<ReserveTest> getList() {
		return list;
	}
	public void setList(ArrayList<ReserveTest> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public ReserveTestPageData(ArrayList<ReserveTest> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ReserveTestPageData() {
		super();
	}
	
}
