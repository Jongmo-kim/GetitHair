package reserve.model.vo;

import java.util.ArrayList;

public class ReservePageData {
	private ArrayList<Reserve> list;
	private String pageNavi;
	public ReservePageData(ArrayList<Reserve> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ReservePageData() {
		super();
	}
	public ArrayList<Reserve> getList() {
		return list;
	}
	public void setList(ArrayList<Reserve> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void getPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
