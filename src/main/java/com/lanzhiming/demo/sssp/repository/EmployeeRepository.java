package com.lanzhiming.demo.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lanzhiming.demo.sssp.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee getByLastName(String lastName);
	
}
