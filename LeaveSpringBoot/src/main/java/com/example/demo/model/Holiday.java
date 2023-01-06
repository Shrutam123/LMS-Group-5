package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Holiday {
	@Id
	@Column(unique = true)
	private String doh;
	private String ocassion;
	private String day;
	public String getDoh() {
		return doh;
	}
	public void setDoh(String doh) {
		this.doh = doh;
	}
	public String getOcassion() {
		return ocassion;
	}
	public void setOcassion(String ocassion) {
		this.ocassion = ocassion;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "Holiday [doh=" + doh + ", ocassion=" + ocassion + ", day=" + day + "]";
	}
	
	
	
	

}
