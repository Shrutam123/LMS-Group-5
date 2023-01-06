package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Project {
	@Id
	@GeneratedValue
	private int pid;
	private String name;
	private String startd;
	private String endd;
	private String description;
	private String status;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartd() {
		return startd;
	}
	public void setStartd(String startd) {
		this.startd = startd;
	}
	public String getEndd() {
		return endd;
	}
	public void setEndd(String endd) {
		this.endd = endd;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Project [pid=" + pid + ", name=" + name + ", startd=" + startd + ", endd=" + endd + ", description="
				+ description + ", status=" + status + "]";
	}
	
	
	
}
