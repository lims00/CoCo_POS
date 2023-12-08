package com.team6.entity;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    private int customerId;
    private String firstName;
    private String lastName;
    private String email; // Email 객체로 바꾸면 유효성 검사까지 되는 것 같아요
    private String phoneNumber;  //int ?
    private String address;
}
