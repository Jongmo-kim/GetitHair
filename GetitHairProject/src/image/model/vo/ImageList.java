package image.model.vo;

public class ImageList {
	private int imageListNo;
	private Image image;
	private String imageType;
	private int imageTypeNo;
	
	public ImageList() {
		// TODO Auto-generated constructor stub
	}

	public ImageList(int imageListNo, Image image, String imageType, int imageTypeNo) {
		super();
		this.imageListNo = imageListNo;
		this.image = image;
		this.imageType = imageType;
		this.imageTypeNo = imageTypeNo;
	}

	public int getImageListNo() {
		return imageListNo;
	}

	public void setImageListNo(int imageListNo) {
		this.imageListNo = imageListNo;
	}

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
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
