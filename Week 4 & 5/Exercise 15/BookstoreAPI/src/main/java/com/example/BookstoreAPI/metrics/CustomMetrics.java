package com.example.BookstoreAPI.metrics;

import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class CustomMetrics {

    private final MeterRegistry meterRegistry;

    public CustomMetrics(MeterRegistry meterRegistry) {
        this.meterRegistry = meterRegistry;
    }

    @PostConstruct
    public void registerMetrics() {
        // Register a custom counter
        meterRegistry.counter("custom.metrics.book.created.count");

        // Register a custom gauge (e.g., number of books in the inventory)
        meterRegistry.gauge("custom.metrics.book.inventory.size", 100); // Replace 100 with your inventory size logic
    }
}
