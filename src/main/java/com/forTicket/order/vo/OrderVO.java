package com.forTicket.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private int order_No;
	private int goods_id;
	private String mem_id; 
	private int s_no; 
	private int orderNum; 
	private int ordersit; 
	private String orderName; 
	private String orderPhone1; 
	private String orderPhone2; 
	private String orderEmail;
	private String orderPay; 
	private String orderCheck;
	private String orderStatus; 
	private Date orderTicketing;
	private Date orderDate; 
	private int order_price;
	
	public int getOrder_No() {
		return order_No;
	}
	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getOrdersit() {
		return ordersit;
	}
	public void setOrdersit(int ordersit) {
		this.ordersit = ordersit;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPhone1() {
		return orderPhone1;
	}
	public void setOrderPhone1(String orderPhone1) {
		this.orderPhone1 = orderPhone1;
	}
	public String getOrderPhone2() {
		return orderPhone2;
	}
	public void setOrderPhone2(String orderPhone2) {
		this.orderPhone2 = orderPhone2;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getOrderPay() {
		return orderPay;
	}
	public void setOrderPay(String orderPay) {
		this.orderPay = orderPay;
	}
	public String getOrderCheck() {
		return orderCheck;
	}
	public void setOrderCheck(String orderCheck) {
		this.orderCheck = orderCheck;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getOrderTicketing() {
		return orderTicketing;
	}
	public void setOrderTicketing(Date orderTicketing) {
		this.orderTicketing = orderTicketing;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	
}
