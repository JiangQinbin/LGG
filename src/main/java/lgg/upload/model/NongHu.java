package lgg.upload.model;

public class NongHu {
	private String username;
	private String dianming;
	private String shenfengzhengma;
	private String xingming;
	private String dizhi;
	private int xiaoshouliang;
	private String zhifubaohao;
	private String kaidianshijian;
	public NongHu(String username, String dianming, String shenfengzhengma, String xingming, String dizhi,
			int xiaoshouliang, String zhifubaohao, String kaidianshijian) {
		super();
		this.username = username;
		this.dianming = dianming;
		this.shenfengzhengma = shenfengzhengma;
		this.xingming = xingming;
		this.dizhi = dizhi;
		this.xiaoshouliang = xiaoshouliang;
		this.zhifubaohao = zhifubaohao;
		this.kaidianshijian = kaidianshijian;
	}
	public NongHu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUsername() {
		return username;
	}
	public String getDianming() {
		return dianming;
	}
	public String getShenfengzhengma() {
		return shenfengzhengma;
	}
	public String getXingming() {
		return xingming;
	}
	public String getDizhi() {
		return dizhi;
	}
	public int getXiaoshouliang() {
		return xiaoshouliang;
	}
	public String getZhifubaohao() {
		return zhifubaohao;
	}
	public String getKaidianshijian() {
		return kaidianshijian;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setDianming(String dianming) {
		this.dianming = dianming;
	}
	public void setShenfengzhengma(String shenfengzhengma) {
		this.shenfengzhengma = shenfengzhengma;
	}
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	public void setDizhi(String dizhi) {
		this.dizhi = dizhi;
	}
	public void setXiaoshouliang(int xiaoshouliang) {
		this.xiaoshouliang = xiaoshouliang;
	}
	public void setZhifubaohao(String zhifubaohao) {
		this.zhifubaohao = zhifubaohao;
	}
	public void setKaidianshijian(String kaidianshijian) {
		this.kaidianshijian = kaidianshijian;
	}
	

}
