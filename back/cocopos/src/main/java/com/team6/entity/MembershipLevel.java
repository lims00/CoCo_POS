package com.team6.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class MembershipLevel {
    private int levelId;
    private String levelName;
    private int discountRate;
}
