package com.test.bean;

import java.util.Set;

/**
 * Orderform entity. @author MyEclipse Persistence Tools
 */

public class Orderform implements java.io.Serializable {

	// Fields

	private Integer id;
	private Customer customer;
	private String tradedate;
	private String status;
	private Double amount;
	private Set<Orderitem> orderitems;

	// Constructors

	@Override
	public String toString() {
		return "Orderform [id=" + id + ", customer=" + customer
				+ ", tradedate=" + tradedate + ", status=" + status
				+ ", amount=" + amount + ", orderitems=" + orderitems + "]";
	}

	/** default constructor */
	public Orderform() {
	}

	/** full constructor */
	public Orderform(Customer customer, String tradedate, String status,
			Double amount) {
		this.customer = customer;
		this.tradedate = tradedate;
		this.status = status;
		this.amount = amount;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Set<Orderitem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(Set<Orderitem> orderitems) {
		this.orderitems = orderitems;
	}

	public String getTradedate() {
		return this.tradedate;
	}

	public void setTradedate(String tradedate) {
		this.tradedate = tradedate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

}