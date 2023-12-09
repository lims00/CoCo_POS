package com.team6.entity;
import lombok.AllArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerCoupon {
    private int customerId;
    private int couponId;
    private boolean isUsed; // Not used:0, used:1
}
