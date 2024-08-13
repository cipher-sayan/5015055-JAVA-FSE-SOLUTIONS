package com.example.EmployeeManagementSystem.projections;

import org.springframework.beans.factory.annotation.Value;

public interface EmployeeProjection {

    Long getId();

    @Value("#{target.firstName + ' ' + target.lastName}")
    String getFullName();

    String getEmail();

    String getDepartmentName();
}
