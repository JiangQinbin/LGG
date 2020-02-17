package lgg.upload.model;

public class Vodeo {
	private String yonghu;
	private String shipinming;
	private String shijian;
	public Vodeo(String yonghu, String shipinming, String shijian) {
		super();
		this.yonghu = yonghu;
		this.shipinming = shipinming;
		this.shijian = shijian;
	}
	public Vodeo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getYonghu() {
		return yonghu;
	}
	public String getShipinming() {
		return shipinming;
	}
	public String getShijian() {
		return shijian;
	}
	public void setYonghu(String yonghu) {
		this.yonghu = yonghu;
	}
	public void setShipinming(String shipinming) {
		this.shipinming = shipinming;
	}
	public void setShijian(String shijian) {
		this.shijian = shijian;
	}
	

}
