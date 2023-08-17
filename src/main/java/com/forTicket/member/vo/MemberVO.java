package com.forTicket.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("memberVO")
public class MemberVO {
	private String mem_id;
	private String pwd;
	private String mem_name;
	private String email;
	private String phone1;
	private String phone2;
	private String post;
	private String addr1;
	private String addr2;
	private String b_number;
	private String b_name;
	private String b_phone1;
	private String b_phone2;
	private String b_phone3;
	private String checkbox;
	private String memberCheck;
	private Date joinDate;
	
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getB_number() {
		return b_number;
	}
	public void setB_number(String b_number) {
		this.b_number = b_number;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_phone1() {
		return b_phone1;
	}
	public void setB_phone1(String b_phone1) {
		this.b_phone1 = b_phone1;
	}
	public String getB_phone2() {
		return b_phone2;
	}
	public void setB_phone2(String b_phone2) {
		this.b_phone2 = b_phone2;
	}
	public String getB_phone3() {
		return b_phone3;
	}
	public void setB_phone3(String b_phone3) {
		this.b_phone3 = b_phone3;
	}
	public String getCheckbox() {
		return checkbox;
	}
	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}
	public String getMemberCheck() {
		return memberCheck;
	}
	public void setMemberCheck(String memberCheck) {
		this.memberCheck = memberCheck;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
	
}
