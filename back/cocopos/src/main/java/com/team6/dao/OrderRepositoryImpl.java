package com.team6.dao;

import com.team6.entity.Orders;
import com.team6.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@Repository
public class OrderRepositoryImpl implements OrderRepository{
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String INSERT_ORDER_QUERY =
            "INSERT INTO orders(OrderID, CustomerID, PaymentMethodID, CouponID, OrderDate, DiscountedTotalAmount, TotalAmount, IsRefunded) VALUES (?, ?, ?,?, ?, ?, ?, ?)";

    private static final String GET_ORDER_BY_ID_QUERY =
            "SELECT * FROM orders WHERE OrderID=?";

    private static final String GET_ALL_ORDERS_QUERY =
            "SELECT * FROM orders";

    @Override
    public Orders createOrder(Orders order) {
        jdbcTemplate.update(INSERT_ORDER_QUERY,
                order.getOrderId(),
                order.getCustomerId(),
                order.getPaymentMethodId(),
                order.getCouponId(),
                order.getOrderDate(),
                order.getDiscountedTotalPrice(),
                order.getTotalAmount(),
                order.isRefunded());
        return order;
    }

    @Override
    public List<Orders> allOrders() {
        return jdbcTemplate.query(GET_ALL_ORDERS_QUERY, (rs, rowNum) -> {
            return new Orders(
                    rs.getInt("OrderID"),
                    rs.getInt("CustomerID"),
                    rs.getInt("PaymentMethodID"),
                    rs.getInt("CouponID"),
                    rs.getString("OrderDate"),
                    rs.getInt("DiscountedTotalAmount"),
                    rs.getInt("TotalAmount"),
                    rs.getBoolean("IsRefunded")
            );
        });
    }
}
