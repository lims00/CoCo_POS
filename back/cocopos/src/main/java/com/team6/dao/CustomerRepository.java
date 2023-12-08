package com.team6.dao;

import com.team6.entity.Customer;

import java.util.List;
public interface CustomerRepository {
    Customer saveCustomer(Customer customer);
    Customer updateCustomer(Customer customer);
    Customer getById(int customerId);
    String deleteById(int customerId);
    List<Customer> allCustomers();
}
