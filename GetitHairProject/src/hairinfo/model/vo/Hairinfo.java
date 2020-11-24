package hairinfo.model.vo;

import java.io.Serializable;

public class Hairinfo implements Serializable {
	private static final long serialVersionUID = 1L;
	private int customerNo;
	private String myhairScalp;
	private String myhairCurly;
	private String myhairRich;
	private String myhairBold;
	private String myhairVol;
	private String myhairStatus;
	private String myhairOld;

	public Hairinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Hairinfo(int customerNo, String myhairScalp, String myhairCurly, String myhairRich, String myhairBold,
			String myhairVol, String myhairStatus, String myhairOld) {
		super();
		this.customerNo = customerNo; //회원번호 [customer에서 FK]
		this.myhairScalp = myhairScalp; //두피상태[지성,건성,비듬/지루성,민감성,중성,모름]
		this.myhairCurly = myhairCurly; //곱슬정도 [곱슬,반곱슬,직모,모름]
		this.myhairRich = myhairRich; //머리숱상태 [머리숱많음,머리숱보통,머리숱적음,탈모,모름]
		this.myhairBold = myhairBold; // 모발굵기[가는모발,중간모발,두꺼운모발,모름]
		this.myhairVol = myhairVol; //볼륨상태 [볼륨부족,뜨는머리,고민없음,모름]
		this.myhairStatus = myhairStatus; //모발상태 [끊기는모발,푸석한모발,건강한모발,모름]
		this.myhairOld = myhairOld; //모발노화상태[새치조금,새치많음,새치없음,모름]
	}

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getMyhairScalp() {
		return myhairScalp;
	}

	public void setMyhairScalp(String myhairScalp) {
		this.myhairScalp = myhairScalp;
	}

	public String getMyhairCurly() {
		return myhairCurly;
	}

	public void setMyhairCurly(String myhairCurly) {
		this.myhairCurly = myhairCurly;
	}

	public String getMyhairRich() {
		return myhairRich;
	}

	public void setMyhairRich(String myhairRich) {
		this.myhairRich = myhairRich;
	}

	public String getMyhairBold() {
		return myhairBold;
	}

	public void setMyhairBold(String myhairBold) {
		this.myhairBold = myhairBold;
	}

	public String getMyhairVol() {
		return myhairVol;
	}

	public void setMyhairVol(String myhairVol) {
		this.myhairVol = myhairVol;
	}

	public String getMyhairStatus() {
		return myhairStatus;
	}

	public void setMyhairStatus(String myhairStatus) {
		this.myhairStatus = myhairStatus;
	}

	public String getMyhairOld() {
		return myhairOld;
	}

	public void setMyhairOld(String myhairOld) {
		this.myhairOld = myhairOld;
	}

	@Override
	public String toString() {
		String str = "";
		str += "회원번호 :" + customerNo + "\n";
		str += "두피상태 :" + myhairScalp + "\n";
		str += "곱슬정도 :" + myhairCurly + "\n";
		str += "머리숱 :" + myhairRich + "\n";
		str += "모발굵기 :" + myhairBold + "\n";
		str += "모발볼륨 :" + myhairVol + "\n";
		str += "모발상태 :" + myhairStatus + "\n";
		str += "모발노화상태 :" + myhairOld + "";
		return str;
	}
}
