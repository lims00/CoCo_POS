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
        try {
            Product product = productRepository.getById(productId);

            if (product != null) {
                jdbcTemplate.update(INSERT_INTO_CARTITEM_QUERY, cartId, productId, product.getPrice(), quantity);
            } else {
                // product가 null인 경우에 대한 처리
                System.err.println("Product with ID " + productId + " not found.");
                // 또는 예외를 던지거나 다른 적절한 처리 수행
            }
        } catch (Exception e) {
            // 예외 처리 코드 추가
            e.printStackTrace();
        }
    }
}
