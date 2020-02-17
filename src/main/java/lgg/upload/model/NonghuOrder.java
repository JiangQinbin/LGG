package lgg.upload.model;

import java.util.Date;

public class NonghuOrder {
	private String ordernumber;
	private String username;
	private String manguoname;
	private String guige;
	private int number;
	private Date paymentTime;
	private float actualPayment;
	private String consigneeName;
	private String fullAddress;
	private String mobile;
	private int delivery;
	private int harvest;
	public NonghuOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NonghuOrder(String ordernumber, String username, String manguoname, String guige, int number,
			Date paymentTime, float actualPayment, String consigneeName, String fullAddress, String mobile,
			int delivery, int harvest) {
		super();
		this.ordernumber = ordernumber;
		this.username = username;
		this.manguoname = manguoname;
		this.guige = guige;
		this.number = number;
		this.paymentTime = paymentTime;
		this.actualPayment = actualPayment;
		this.consigneeName = consigneeName;
		this.fullAddress = fullAddress;
		this.mobile = mobile;
		this.delivery = delivery;
		this.harvest = harvest;
	}
    
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getUsername() {
		return username;
	}
	public String getManguoname() {
		return manguoname;
	}
	public String getGuige() {
		return guige;
	}
	public int getNumber() {
		return number;
	}
	public Date getPaymentTime() {
		return paymentTime;
	}
	public float getActualPayment() {
		return actualPayment;
	}
	public String getConsigneeName() {
		return consigneeName;
	}
	public String getFullAddress() {
		return fullAddress;
	}
	public String getMobile() {
		return mobile;
	}
	public int getDelivery() {
		return delivery;
	}
	public int getHarvest() {
		return harvest;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setManguoname(String manguoname) {
		this.manguoname = manguoname;
	}
	public void setGuige(String guige) {
		this.guige = guige;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}
	public void setActualPayment(float actualPayment) {
		this.actualPayment = actualPayment;
	}
	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}
	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public void setHarvest(int harvest) {
		this.harvest = harvest;
	}
	

}
