package com.example.BookstoreAPI.controller;

import com.example.BookstoreAPI.assembler.CustomerResourceAssembler;
import com.example.BookstoreAPI.dto.CustomerDTO;
import com.example.BookstoreAPI.model.Customer;
import com.example.BookstoreAPI.service.CustomerService;
import org.springframework.hateoas.EntityModel;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.server.mvc.WebMvcLinkBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    private final CustomerService customerService;
    private final CustomerResourceAssembler customerResourceAssembler;

    public CustomerController(CustomerService customerService, CustomerResourceAssembler customerResourceAssembler) {
        this.customerService = customerService;
        this.customerResourceAssembler = customerResourceAssembler;
    }

    @GetMapping("/{id}")
    public ResponseEntity<EntityModel<CustomerDTO>> getCustomerById(@PathVariable Long id) {
        CustomerDTO customerDTO = customerService.getCustomerById(id);
        EntityModel<CustomerDTO> customerResource = customerResourceAssembler.toModel(customerDTO);
        return ResponseEntity.ok(customerResource);
    }

    @PostMapping
    public ResponseEntity<EntityModel<CustomerDTO>> createCustomer(@RequestBody CustomerDTO customerDTO) {
        CustomerDTO createdCustomer = customerService.createCustomer(customerDTO);
        EntityModel<CustomerDTO> customerResource = customerResourceAssembler.toModel(createdCustomer);
        return ResponseEntity.created(customerResource.getRequiredLink("self").toUri()).body(customerResource);
    }

    @PutMapping("/{id}")
    public ResponseEntity<EntityModel<CustomerDTO>> updateCustomer(@PathVariable Long id, @RequestBody CustomerDTO customerDTO) {
        CustomerDTO updatedCustomer = customerService.updateCustomer(id, customerDTO);
        EntityModel<CustomerDTO> customerResource = customerResourceAssembler.toModel(updatedCustomer);
        return ResponseEntity.ok(customerResource);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable Long id) {
        customerService.deleteCustomer(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<EntityModel<CustomerDTO>>> getAllCustomers() {
        List<EntityModel<CustomerDTO>> customerResources = customerService.getAllCustomers().stream()
                .map(customerResourceAssembler::toModel)
                .collect(Collectors.toList());
        return ResponseEntity.ok(customerResources);
    }
}
