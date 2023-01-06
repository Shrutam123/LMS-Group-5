package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Empleave;
import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;

@Service
public class LeaveService {
	@Autowired
	EmployeeRepository erep;
	
	public boolean checkduplicates(Employee employee) {
		List<Employee> emp =erep.findByEmail(employee.getEmail());
		if(emp.isEmpty()){
			return true;
			
		}
		else {
			return false;
		}
		
	}
		
		
	}


