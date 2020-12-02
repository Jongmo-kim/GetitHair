package image.model.vo;

public class ImageList {
	private int imageListNo;
	private String filepath;//이미지 객체 - 파일패스
	private String imageType;//헤어샵, 스타일
	private int imageTypeNo;//상세 번호
	
	public ImageList() {
		// TODO Auto-generated constructor stub
	}
	public ImageList(int imageListNo, String filepath, String imageType, int imageTypeNo) {
		super();
		this.imageListNo = imageListNo;
		this.filepath = filepath;
		this.imageType = imageType;
		this.imageTypeNo = imageTypeNo;
	}
	public int getImageListNo() {
		return imageListNo;
	}
	public void setImageListNo(int imageListNo) {
		this.imageListNo = imageListNo;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getImageType() {
		return imageType;
	}
	public void setImageType(String imageType) {
		this.imageType = imageType;
	}
	public int getImageTypeNo() {
		return imageTypeNo;
	}
	public void setImageTypeNo(int imageTypeNo) {
		this.imageTypeNo = imageTypeNo;
	}
}
