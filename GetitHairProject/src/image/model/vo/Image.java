package image.model.vo;

public class Image {
	private int imgNo;
	private String filepath;//이미지 객체 - 파일패스
	private String imgType;//헤어샵, 스타일
	private int imgTypeNo;//상세 번호
	
	public Image() {
		// TODO Auto-generated constructor stub
	}

	public Image(int imgNo, String filepath, String imgType, int imgTypeNo) {
		super();
		this.imgNo = imgNo;
		this.filepath = filepath;
		this.imgType = imgType;
		this.imgTypeNo = imgTypeNo;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getImgType() {
		return imgType;
	}

	public void setImgType(String imgType) {
		this.imgType = imgType;
	}

	public int getImgTypeNo() {
		return imgTypeNo;
	}

	public void setImgTypeNo(int imgTypeNo) {
		this.imgTypeNo = imgTypeNo;
	}
	
}
