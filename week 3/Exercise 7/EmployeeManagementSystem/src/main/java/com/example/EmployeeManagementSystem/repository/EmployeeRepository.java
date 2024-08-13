package com.example.EmployeeManagementSystem.repository;

import com.example.EmployeeManagementSystem.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    // Pagination and sorting for finding all employees
    Page<Employee> findAll(Pageable pageable);

    // Pagination and sorting for finding employees by department name
    Page<Employee> findByDepartmentName(String departmentName, Pageable pageable);

    // Custom query using @Query with pagination and sorting
    @Query("SELECT e FROM Employee e WHERE e.department.name = :departmentName")
    Page<Employee> findEmployeesByDepartmentName(@Param("departmentName") String departmentName, Pageable pageable);
}
