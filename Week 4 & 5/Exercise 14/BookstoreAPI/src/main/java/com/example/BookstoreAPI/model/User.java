package com.example.BookstoreAPI.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.Collection;

@Entity
@Table(name = "users")
abstract public class User implements UserDetails {

    @Id
    private Long id;
    private String username;
    private String password;

    // Other fields, constructors, getters, and setters

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // Return user authorities/roles here
        return null; // Implement as needed
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
