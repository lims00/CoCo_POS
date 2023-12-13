package com.team6.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddToCartInput {
    private int customerId;
    private int productId;
    private int quantity;
}
