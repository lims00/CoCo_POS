package com.team6.controller;

import com.google.gson.Gson;
import com.team6.dao.*;
import com.team6.entity.CartItem;
import com.team6.entity.Customer;
import com.team6.entity.Membership;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.List;


@RestController
@CrossOrigin(origins="https://localhost:3000")
public class CartController {
    @Autowired
    CartRepository cartRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    MembershipRepository membershipRepository;

    @Autowired
    CouponRepository couponRepository;

    @GetMapping("/customercart/{customerId}")
    public JSONObject customerCart(@PathVariable int customerId) {
        Membership membership = membershipRepository.getByCustomerId(customerId);
        Customer customer = customerRepository.getById(customerId);

        JSONObject info = new JSONObject();
        Gson gson = new Gson();


        info.put("customerName", customer.getFirstName() + ' ' + customer.getLastName());
        info.put("customerId", customer.getCustomerId());
        info.put("membershipLevel", membership.getLevelId());


        System.out.println(customer.getFirstName() + ' ' + customer.getLastName());
        System.out.println(membership.getLevelId());

        return info;
    }
}
