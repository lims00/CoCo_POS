package com.team6.dao;

import com.team6.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.team6.dao.ProductRepository;

@Repository
public class CartItemRepositoryImpl implements CartItemRepository{

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    ProductRepository productRepository;

    private static final String INSERT_INTO_CARTITEM_QUERY =
            "INSERT INTO cartitem(CartID, ProductID, UnitPrice, Quantity) VALUES(?, ?, ?, ?)";

    @Override
    public void createCartItem(int cartId, int productId, int quantity) {
        Product product = productRepository.getById(productId);
        jdbcTemplate.update(INSERT_INTO_CARTITEM_QUERY, cartId, productId, product.getPrice(), quantity);
    }
}
