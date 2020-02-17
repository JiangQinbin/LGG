package lgg.upload.model;

public class User {
	private String yonghuiming;
	private String mima;
	private String nicheng;
	private String shoujihao;
	private String zhuceshijian;
	private int category;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String yonghuiming, String mima, String nicheng, String shoujihao, String zhuceshijian, int category) {
		super();
		this.yonghuiming = yonghuiming;
		this.mima = mima;
		this.nicheng = nicheng;
		this.shoujihao = shoujihao;
		this.zhuceshijian = zhuceshijian;
		this.category = category;
	}
	public String getYonghuiming() {
		return yonghuiming;
	}
	public String getMima() {
		return mima;
	}
	public String getNicheng() {
		return nicheng;
	}
	public String getShoujihao() {
		return shoujihao;
	}
	public String getZhuceshijian() {
		return zhuceshijian;
	}
	public int getCategory() {
		return category;
	}
	public void setYonghuiming(String yonghuiming) {
		this.yonghuiming = yonghuiming;
	}
	public void setMima(String mima) {
		this.mima = mima;
	}
	public void setNicheng(String nicheng) {
		this.nicheng = nicheng;
	}
	public void setShoujihao(String shoujihao) {
		this.shoujihao = shoujihao;
	}
	public void setZhuceshijian(String zhuceshijian) {
		this.zhuceshijian = zhuceshijian;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	

}
