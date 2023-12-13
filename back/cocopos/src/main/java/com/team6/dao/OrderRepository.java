package com.team6.dao;

import com.team6.entity.Orders;
import com.team6.entity.Product;

import java.util.List;

public interface OrderRepository {
    Orders createOrder(Orders order);

    List<Orders> allOrders();
}
