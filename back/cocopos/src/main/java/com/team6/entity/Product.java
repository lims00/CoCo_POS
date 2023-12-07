package com.team6.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int ProductID;
    private String ProductName;
    private int Price;
    private int StockQuantity;
    private int CategoryID;
}
