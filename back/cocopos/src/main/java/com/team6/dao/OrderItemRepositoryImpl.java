package com.team6.dao;

import com.team6.entity.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;
@Repository
public class OrderItemRepositoryImpl implements OrderItemRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String INSERT_ORDERITEM_QUERY =
            "INSERT INTO orderitem(OrderItemID, OrderID, ProductID, Quantity, UnitPrice) VALUES(?, ?, ?, ?, ?)";


    @Override
    public OrderItem createOrderItem(OrderItem orderItem) {
        jdbcTemplate.update(INSERT_ORDERITEM_QUERY,
                orderItem.getOrderItemId(),
                orderItem.getOrderId(),
                orderItem.getProductId(),
                orderItem.getQuantity(),
                orderItem.getUnitPrice());
        return orderItem;
    }
}
