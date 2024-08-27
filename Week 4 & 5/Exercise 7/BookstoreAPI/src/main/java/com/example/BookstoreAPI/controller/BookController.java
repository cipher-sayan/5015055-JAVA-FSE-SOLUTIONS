package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.exception.ResourceNotFoundException;
import com.example.bookstoreapi.model.Book;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {

    private List<Book> books = new ArrayList<>();

    public BookController() {
        // Adding some sample books to the list for testing purposes
        books.add(new Book(1L, "Spring in Action", "Craig Walls", 39.99, "9781617294945"));
        books.add(new Book(2L, "Java Concurrency in Practice", "Brian Goetz", 29.99, "9780321349606"));
    }

    // GET: Retrieve a book by ID
    @GetMapping("/{id}")
    public ResponseEntity<Book> getBookById(@PathVariable Long id) {
        Book book = books.stream()
                .filter(b -> b.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id " + id));
        return ResponseEntity.ok(book);
    }

    // POST: Create a new book
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED) // Set the HTTP status to 201 Created
    public Book createBook(@RequestBody Book book) {
        books.add(book);
        return book;
    }

    // PUT: Update a book
    @PutMapping("/{id}")
    public ResponseEntity<Book> updateBook(@PathVariable Long id, @RequestBody Book bookDetails) {
        Book book = books.stream()
                .filter(b -> b.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id " + id));
        book.setTitle(bookDetails.getTitle());
        book.setAuthor(bookDetails.getAuthor());
        book.setPrice(bookDetails.getPrice());
        book.setIsbn(bookDetails.getIsbn());
        return ResponseEntity.ok(book);
    }

    // DELETE: Delete a book
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT) // Set the HTTP status to 204 No Content
    public void deleteBook(@PathVariable Long id) {
        Book book = books.stream()
                .filter(b -> b.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id " + id));
        books.remove(book);
    }

    // GET: Retrieve a book by ID with custom headers
    @GetMapping("/{id}/details")
    public ResponseEntity<Book> getBookDetailsWithHeaders(@PathVariable Long id) {
        Book book = books.stream()
                .filter(b -> b.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new ResourceNotFoundException("Book not found with id " + id));

        HttpHeaders headers = new HttpHeaders();
        headers.add("Custom-Header", "BookDetailsHeader");
        headers.add("Another-Header", "AnotherHeaderValue");
        return ResponseEntity.ok()
                .headers(headers)
                .body(book);
    }
}
