package likes.model.vo;

import java.util.ArrayList;

public class LikesPageData {
	private ArrayList<Likes> list;
	private String pageNavi;
	public LikesPageData(ArrayList<Likes> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public LikesPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Likes> getList() {
		return list;
	}
	public void setList(ArrayList<Likes> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
