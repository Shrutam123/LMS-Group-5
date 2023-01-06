package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Admin {
	@Id
	private String name;
	private String password;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admin [name=" + name + ", password=" + password + "]";
	}
	
	
	

}
