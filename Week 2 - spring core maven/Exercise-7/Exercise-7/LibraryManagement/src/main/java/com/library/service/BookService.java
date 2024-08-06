/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.library.service;

/**
 *
 * @author sayan
 */

import com.library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {
    private BookRepository bookRepository;
    private String someOtherDependency;

    // Constructor for constructor injection
    @Autowired
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Setter method for setter injection
    @Autowired
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Setter method for other dependency
    public void setSomeOtherDependency(String someOtherDependency) {
        this.someOtherDependency = someOtherDependency;
    }

    // Business method
    public void performService() {
        System.out.println("BookService is performing a service with " + someOtherDependency);
        bookRepository.performRepositoryTask();
    }
}
