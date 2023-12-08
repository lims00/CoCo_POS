package com.team6.controller;
import com.team6.dao.CustomerRepository;
import com.team6.dao.CustomerRepositoryImpl;
import com.team6.entity.Customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class CustomerController {
    @Autowired
    CustomerRepository customerRepository;

    @PostMapping("/customer")
    public Customer addCustomer(@RequestBody Customer customer) {
        return customerRepository.saveCustomer(customer);
    }
}
