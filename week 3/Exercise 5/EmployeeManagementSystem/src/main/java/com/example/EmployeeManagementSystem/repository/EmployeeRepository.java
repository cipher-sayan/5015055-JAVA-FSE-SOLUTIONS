package com.example.EmployeeManagementSystem.repository;

import com.example.EmployeeManagementSystem.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    // Find employees by email
    List<Employee> findByEmail(String email);

    // Find employees by department name using method name convention
    List<Employee> findByDepartmentName(String departmentName);

    // Custom query using @Query annotation to find employees by department name
    @Query("SELECT e FROM Employee e WHERE e.department.name = :departmentName")
    List<Employee> findEmployeesByDepartmentName(@Param("departmentName") String departmentName);

    // Find employees whose names contain a specific string
    List<Employee> findByNameContaining(String name);
}
