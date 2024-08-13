package com.example.EmployeeManagementSystem.projections;

public class EmployeeDTO {

    private Long id;
    private String fullName;
    private String email;
    private String departmentName;

    public EmployeeDTO(Long id, String firstName, String lastName, String email, String departmentName) {
        this.id = id;
        this.fullName = firstName + " " + lastName;
        this.email = email;
        this.departmentName = departmentName;
    }

    // Getters and Setters...

    public Long getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getDepartmentName() {
        return departmentName;
    }
}
