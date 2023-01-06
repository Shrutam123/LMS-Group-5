package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Balance;

public interface BalanceRepository extends JpaRepository<Balance, Integer>{

}
