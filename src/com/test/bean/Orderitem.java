package com.test.bean;

/**
 * Orderitem entity. @author MyEclipse Persistence Tools
 */

public class Orderitem implements java.io.Serializable {

	// Fields

	private Integer id;
	private Orderform orderid;
	private Commodity commodity;
	private Double discount;
	private Double actprice;
	private Double amount;

	// Constructors

	@Override
	public String toString() {
		return "Orderitem [id=" + id + ", orderid=" + orderid + ", commodity="
				+ commodity + ", discount=" + discount + ", actprice="
				+ actprice + ", amount=" + amount + "]";
	}

	/** default constructor */
	public Orderitem() {
	}

	/** full constructor */
	public Orderitem(Orderform orderid, Commodity commodity, Double discount,
			Double actprice, Double amount) {
		this.orderid = orderid;
		this.commodity = commodity;
		this.discount = discount;
		this.actprice = actprice;
		this.amount = amount;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Orderform getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Orderform orderid) {
		this.orderid = orderid;
	}

	public Commodity getCommodity() {
		return this.commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getActprice() {
		return this.actprice;
	}

	public void setActprice(Double actprice) {
		this.actprice = actprice;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

}