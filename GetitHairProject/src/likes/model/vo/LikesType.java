package likes.model.vo;

public class LikesType {
	private int likesTypeNo;
	private char likesType;

	public int getLikesTypeNo() {
		return likesTypeNo;
	}

	public void setLikesTypeNo(int likesTypeNo) {
		this.likesTypeNo = likesTypeNo;
	}

	public char getLikesType() {
		return likesType;
	}

	public void setLikesType(char likesType) {
		this.likesType = likesType;
	}

	public LikesType(int likesTypeNo, char likesType) {
		super();
		this.likesTypeNo = likesTypeNo;
		this.likesType = likesType;
	}

	public LikesType() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		String str = "";
		str += "likesTypeNo :" + likesTypeNo + "\n";
		str += "likesType :" + likesType + "\n";
		return str;
	}

}
