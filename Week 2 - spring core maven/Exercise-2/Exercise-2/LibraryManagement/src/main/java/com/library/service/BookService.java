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

public class BookService {
    private BookRepository bookRepository;

    // Setter for bookRepository
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Example method to use the repository
    public void performService() {
        System.out.println("Service is being performed.");
        bookRepository.performRepositoryOperation();
    }
}


