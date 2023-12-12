package com.team6.entity;
import lombok.AllArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Promotion {
    private int promotionId;
    private String promotionName;
    private String startDate;
    private String endDate;
    private int discountRate;
    private String promotionDescription;
}
