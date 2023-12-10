package com.team6.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CartRepositoryImpl implements CartRepository{
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String INSERT_CART_QUERY =
            "INSERT INTO cart (CustomerID) VALUES (?)";
    @Override
    public boolean createCart(int customerId) {
        jdbcTemplate.update(INSERT_CART_QUERY, customerId);
        return true;
    }
}
