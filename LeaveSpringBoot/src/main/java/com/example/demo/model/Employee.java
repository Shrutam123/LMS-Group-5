package com.example.demo.model;

import java.util.Random;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Employee {
	@Id
	@GeneratedValue
	private int id;
    private String name;
    private String surname;
    private String email;
    private String contact;
    private String dob;
    private String gender;
    private String address;
    private String designation;
    private String role;
    private String report;
    private String project;
    private String password;
    
    
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	
			@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", surname=" + surname + ", email=" + email + ", contact="
				+ contact + ", dob=" + dob + ", gender=" + gender + ", address=" + address + ", designation="
				+ designation + ", role=" + role + ", report=" + report + ", project=" + project + ", password="
				+ password + "]";
	}

			//Auto Password generation
			public String generatePassword(String name) {
				 Random random=new Random();
				 int num=random.nextInt(1000);
				 this.setPassword(name+num);
				 return name+num;
			}
	
	

}
