package com.team6.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddToCartOutput {
    private int productId;
    private String productName;
    private int quantity;
    private double unitPrice;
    private double totalProductPrice;
    private double totalPrice;
}
