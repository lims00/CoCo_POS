package com.team6.dao;

import com.team6.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepository {

    private static final String INSERT_CUSTOMER_QUERY =
            "INSERT INTO customer(CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES (?, ?, ?, ?, ?, ?)";


    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public Customer saveCustomer(Customer customer) {
        jdbcTemplate.update(INSERT_CUSTOMER_QUERY,
                customer.getCustomerId(),
                customer.getFirstName(),
                customer.getLastName(),
                customer.getEmail(),
                customer.getPhoneNumber(),
                customer.getAddress());
        return customer;
    }

    @Override
    public Customer updateCustomer(Customer customer) {
        return null;
    }

    @Override
    public Customer getById(int customerId) {
        return null;
    }

    @Override
    public String deleteById(int customerId) {
        return null;
    }

    @Override
    public List<Customer> allCustomers() {
        return null;
    }
}
