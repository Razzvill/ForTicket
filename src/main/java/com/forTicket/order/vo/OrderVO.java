package com.forTicket.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private int order_No;
	private int goods_id;
	private String mem_id; 
	private int s_no; 
	//private int orderNum; 
	private int ordersit; 
	private String orderName; 
	private String orderPhone; 
	private String orderEmail;
	private String orderPay; 
	private String orderCheck;
	private String orderStatus; 
	private Date orderTicketing;
	private Date orderDate; //공연날짜
	private int totalPrice;//총 결제금액
	private String goods_name;
	
	private String goods_place;//공연장소
	private int totalQuantity;//예매수량
	private int goods_price;//상품가격
	private String goods_Time;//공연시간
	
	
	
	
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
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
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getGoods_place() {
		return goods_place;
	}
	public void setGoods_place(String goods_place) {
		this.goods_place = goods_place;
	}
	public int getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_Time() {
		return goods_Time;
	}
	public void setGoods_Time(String goods_Time) {
		this.goods_Time = goods_Time;
	}

	
}
