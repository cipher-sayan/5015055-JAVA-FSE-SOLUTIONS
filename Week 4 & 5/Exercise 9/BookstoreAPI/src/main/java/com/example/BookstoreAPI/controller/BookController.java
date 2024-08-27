package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.assembler.BookResourceAssembler;
import com.example.BookstoreAPI.dto.BookDTO;
import com.example.BookstoreAPI.model.Book;
import com.example.BookstoreAPI.service.BookService;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/books")
public class BookController {

    private final BookService bookService;
    private final BookResourceAssembler bookResourceAssembler;

    public BookController(BookService bookService, BookResourceAssembler bookResourceAssembler) {
        this.bookService = bookService;
        this.bookResourceAssembler = bookResourceAssembler;
    }

    @GetMapping("/{id}")
    public ResponseEntity<EntityModel<BookDTO>> getBookById(@PathVariable Long id) {
        BookDTO bookDTO = bookService.getBookById(id);
        EntityModel<BookDTO> bookResource = bookResourceAssembler.toModel(bookDTO);
        return ResponseEntity.ok(bookResource);
    }

    @PostMapping
    public ResponseEntity<EntityModel<BookDTO>> createBook(@RequestBody BookDTO bookDTO) {
        BookDTO createdBook = bookService.createBook(bookDTO);
        EntityModel<BookDTO> bookResource = bookResourceAssembler.toModel(createdBook);
        return ResponseEntity.created(bookResource.getRequiredLink("self").toUri()).body(bookResource);
    }

    @PutMapping("/{id}")
    public ResponseEntity<EntityModel<BookDTO>> updateBook(@PathVariable Long id, @RequestBody BookDTO bookDTO) {
        BookDTO updatedBook = bookService.updateBook(id, bookDTO);
        EntityModel<BookDTO> bookResource = bookResourceAssembler.toModel(updatedBook);
        return ResponseEntity.ok(bookResource);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBook(@PathVariable Long id) {
        bookService.deleteBook(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<EntityModel<BookDTO>>> getAllBooks() {
        List<EntityModel<BookDTO>> bookResources = bookService.getAllBooks().stream()
                .map(bookResourceAssembler::toModel)
                .collect(Collectors.toList());
        return ResponseEntity.ok(bookResources);
    }
}
