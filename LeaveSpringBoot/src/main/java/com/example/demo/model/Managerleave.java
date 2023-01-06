package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Managerleave {
	@Id
	@GeneratedValue
	private int qid;
	private int mid;
	private String fname;
	private String con;
	private String f_date;
	private String t_date;
	private String type;
	private String tdays;
	private String reason;
	private String status;
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getF_date() {
		return f_date;
	}
	public void setF_date(String f_date) {
		this.f_date = f_date;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTdays() {
		return tdays;
	}
	public void setTdays(String tdays) {
		this.tdays = tdays;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Managerleave [qid=" + qid + ", mid=" + mid + ", fname=" + fname + ", con=" + con + ", f_date=" + f_date
				+ ", t_date=" + t_date + ", type=" + type + ", tdays=" + tdays + ", reason=" + reason + ", status="
				+ status + "]";
	}
	
	
	
	
	
	
	
	
	

}
