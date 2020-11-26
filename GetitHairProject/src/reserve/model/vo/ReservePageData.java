package reserve.model.vo;

import java.util.ArrayList;

public class ReservePageData {
	private ArrayList<Reserve> list;
	private String reqPage;
	public ReservePageData(ArrayList<Reserve> list, String reqPage) {
		super();
		this.list = list;
		this.reqPage = reqPage;
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
	public String getReqPage() {
		return reqPage;
	}
	public void setReqPage(String reqPage) {
		this.reqPage = reqPage;
	}
	
}
