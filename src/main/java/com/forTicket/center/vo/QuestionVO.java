package com.forTicket.center.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("questionVO")
public class QuestionVO {
	private int q_No;
	private int q_Mem_Num;
	private String mem_id;
	private String q_Status;
	private String q_Title;
	private String q_content;
	private Date q_creDate;
	private String a_id;
	private String a_reply;
	private Date a_creDate;
	
	public int getQ_Mem_Num() {
		return q_Mem_Num;
	}
	public void setQ_Mem_Num(int q_Mem_Num) {
		this.q_Mem_Num = q_Mem_Num;
	}
	public int getQ_No() {
		return q_No;
	}
	public void setQ_No(int q_No) {
		this.q_No = q_No;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getQ_Status() {
		return q_Status;
	}
	public void setQ_Status(String q_Status) {
		this.q_Status = q_Status;
	}
	public String getQ_Title() {
		return q_Title;
	}
	public void setQ_Title(String q_Title) {
		this.q_Title = q_Title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_creDate() {
		return q_creDate;
	}
	public void setQ_creDate(Date q_creDate) {
		this.q_creDate = q_creDate;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_reply() {
		return a_reply;
	}
	public void setA_reply(String a_reply) {
		this.a_reply = a_reply;
	}
	public Date getA_creDate() {
		return a_creDate;
	}
	public void setA_creDate(Date a_creDate) {
		this.a_creDate = a_creDate;
	}
	
	@Override
	public String toString() {
		return "QuestionVO [q_No=" + q_No + ", mem_id=" + mem_id + ", q_Status=" + q_Status + ", q_Title=" + q_Title
				+ ", q_content=" + q_content + ", q_creDate=" + q_creDate + ", a_id=" + a_id + ", a_reply=" + a_reply
				+ ", a_creDate=" + a_creDate + "]";
	}
	
}
