package image.model.vo;

public class Image {
	private int imageNo;
	private String imageFileName;
	private String imageFilePath;
	
	public Image() {
		// TODO Auto-generated constructor stub
	}

	public Image(int imageNo, String imageFileName, String imageFilePath) {
		super();
		this.imageNo = imageNo;
		this.imageFileName = imageFileName;
		this.imageFilePath = imageFilePath;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}


}
