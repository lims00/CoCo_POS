package com.team6.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int productId;
    private String name;
    private String description;
    private int price;
    private int discountedPrice; // 이건 따로 빼는게 좋을 것 같아요..
    private int stockQuantity;
    /* Category와 외래키로 연결 되어 있는지 확인 후 추가 */
}
