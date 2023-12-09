package com.team6.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int orderId;
    private int customerId;
    private String orderDate;
    private int totalAmount;
    private String paymentMethod;
}
