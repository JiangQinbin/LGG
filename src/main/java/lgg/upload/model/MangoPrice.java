package lgg.upload.model;

public class MangoPrice {
	private String manguoID;
	private String manguoname;
	private String username;
	private String introduce;
	private float danjiadahao;
	private float danjiaxiaohao;
	private float danjiadazhong;
	private float danjiaziaozhong;
	private float dapingjun;
	private float xiaopingjun;
	private int keshouliang;
	private int yeshouliang;
	public MangoPrice() {
		super();
	}
	public MangoPrice(String manguoID, String manguoname, String username, String introduce, float danjiadahao,
		 float danjiaxiaohao, float danjiadazhong, float danjiaziaozhong, float dapingjun,
			float xiaopingjun, int keshouliang, int yeshouliang) {
		super();
		this.manguoID = manguoID;
		this.manguoname = manguoname;
		this.username = username;
		this.introduce = introduce;
		this.danjiadahao = danjiadahao;
		this.danjiaxiaohao = danjiaxiaohao;
		this.danjiadazhong = danjiadazhong;
		this.danjiaziaozhong = danjiaziaozhong;
		this.dapingjun = dapingjun;
		this.xiaopingjun = xiaopingjun;
		this.keshouliang = keshouliang;
		this.yeshouliang = yeshouliang;
	}
	public String getManguoID() {
		return manguoID;
	}
	public void setManguoID(String manguoID) {
		this.manguoID = manguoID;
	}
	public String getManguoname() {
		return manguoname;
	}
	public void setManguoname(String manguoname) {
		this.manguoname = manguoname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public float getDanjiadahao() {
		return danjiadahao;
	}
	public void setDanjiadahao(float danjiadahao) {
		this.danjiadahao = danjiadahao;
	}
	public float getDanjiaxiaohao() {
		return danjiaxiaohao;
	}
	public void setDanjiaxiaohao(float danjiaxiaohao) {
		this.danjiaxiaohao = danjiaxiaohao;
	}
	public float getDanjiadazhong() {
		return danjiadazhong;
	}
	public void setDanjiadazhong(float danjiadazhong) {
		this.danjiadazhong = danjiadazhong;
	}
	public float getDanjiaziaozhong() {
		return danjiaziaozhong;
	}
	public void setDanjiaziaozhong(float danjiaziaozhong) {
		this.danjiaziaozhong = danjiaziaozhong;
	}
	public float getDapingjun() {
		return dapingjun;
	}
	public void setDapingjun(float dapingjun) {
		this.dapingjun = dapingjun;
	}
	public float getXiaopingjun() {
		return xiaopingjun;
	}
	public void setXiaopingjun(float xiaopingjun) {
		this.xiaopingjun = xiaopingjun;
	}
	public int getKeshouliang() {
		return keshouliang;
	}
	public int getYeshouliang() {
		return yeshouliang;
	}
	public void setKeshouliang(int keshouliang) {
		this.keshouliang = keshouliang;
	}
	public void setYeshouliang(int yeshouliang) {
		this.yeshouliang = yeshouliang;
	}
	
	

}
