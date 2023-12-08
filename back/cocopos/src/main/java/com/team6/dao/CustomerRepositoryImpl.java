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

    private static final String UPDATE_CUSTOMER_BY_ID_QUERY =
            "UPDATE customer SET(FirstName=?, LastName=?, Email=?, PhoneNumber=?, Address=?) WHERE CustomerID=?";

    private static final String GET_CUSTOMER_BY_ID_QUERY =
            "SELECT * FROM customer WHERE CustomerID=?";

    private static final String GET_ALL_CUSTOMERS_QUERY =
            "SELECT * FROM customer";

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public Customer createCustomer(Customer customer) {
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
        jdbcTemplate.update(UPDATE_CUSTOMER_BY_ID_QUERY,
                customer.getFirstName(),
                customer.getLastName(),
                customer.getEmail(),
                customer.getPhoneNumber(),
                customer.getAddress(),
                customer.getCustomerId());
        return customer;
    }

    @Override
    public Customer getById(int customerId) {
        return jdbcTemplate.queryForObject(GET_CUSTOMER_BY_ID_QUERY, (rs,rowNum) -> {
            return new Customer(
                    rs.getInt("CustomerID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Email"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Address")
            );
        }, customerId);
    }

    @Override
    public String deleteById(int customerId) {
        return null;
    }

    @Override
    public List<Customer> allCustomers() {
        return jdbcTemplate.query(GET_ALL_CUSTOMERS_QUERY, (rs, rowNum) -> {
            return new Customer(
                    rs.getInt("CustomerID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Email"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Address"));
        });
    }
}


