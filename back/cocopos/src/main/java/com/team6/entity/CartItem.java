package com.team6.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
    private int cartId;
    private int productId;
    private int unitPrice;
    private int quantity;
}
