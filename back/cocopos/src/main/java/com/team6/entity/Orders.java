package com.team6.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
    private int orderId;
    private int customerId;
    private int paymentMethodId;
    private String orderDate;
    private int totalAmount;
}
