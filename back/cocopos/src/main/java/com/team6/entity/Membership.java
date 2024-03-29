package com.team6.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Membership {
    private int levelId;
    private int customerId;
    private String joinDate;
    private String expiryDate;
    private String status;
}
