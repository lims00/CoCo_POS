package com.team6.controller;

import com.team6.dao.OrderRepository;
import com.team6.entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class OrderHistoryController {
    @Autowired
    OrderRepository orderRepository;

    @GetMapping("/orders")
    public List<Orders> getOrders() { return orderRepository.allOrders(); }

}
