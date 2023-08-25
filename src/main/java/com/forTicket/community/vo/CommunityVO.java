package com.forTicket.community.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("communityVO")
public class CommunityVO {
	private int c_No;
	private int order_No;
	private String mem_id;
	private String c_title;
	private String c_content;
	private Date c_date;
	
	public int getC_No() {
		return c_No;
	}
	public void setC_No(int c_No) {
		this.c_No = c_No;
	}
	
	public int getOrder_No() {
		return order_No;
	}
	public void setOrder_No(int order_No) {
		this.order_No = order_No;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	
}
