package customer.model.vo;

import java.util.ArrayList;

public class CustomerPageData {
	private ArrayList<Customer> list;
	private String pageNavi;
	public CustomerPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustomerPageData(ArrayList<Customer> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Customer> getList() {
		return list;
	}
	public void setList(ArrayList<Customer> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
