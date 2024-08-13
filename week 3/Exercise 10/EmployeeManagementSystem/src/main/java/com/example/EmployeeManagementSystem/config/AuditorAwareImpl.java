package com.example.EmployeeManagementSystem.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

@Configuration
public class AuditorAwareImpl implements AuditorAware<String> {

    @Override
    public Optional<String> getCurrentAuditor() {
        // Return the username of the logged-in user or a default value
        return Optional.of("system");  // Replace "system" with actual user retrieval logic
    }
}
