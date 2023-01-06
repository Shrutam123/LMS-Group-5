package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Empleave;

public interface EmpleaveRepository extends JpaRepository<Empleave, Integer>{

	//List<Empleave> getReferenceById(int eid);

	List<Empleave> findByEid(int eid);
	

}
