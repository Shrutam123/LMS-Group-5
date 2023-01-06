package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer>{

	Employee getReferenceByNameAndPassword(String name, String password);
	
	List<Employee> findByRole(String role);  //manager 
	
	Employee findById(int id); //reset password
	
	Employee findByNameAndReportIsNull(String Name);
	
	List<Employee> findByEmail(String email); //duplicates
	
	

}
