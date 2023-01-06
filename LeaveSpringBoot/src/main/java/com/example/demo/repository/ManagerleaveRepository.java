package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Managerleave;

public interface ManagerleaveRepository extends JpaRepository<Managerleave, Integer>{
	
	List<Managerleave> findByMid(int mid);

}
