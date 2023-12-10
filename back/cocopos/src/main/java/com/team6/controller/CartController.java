package com.team6.controller;

import com.google.gson.Gson;
import com.team6.dao.*;
import com.team6.entity.Cart;
import com.team6.entity.CustomerCoupon;
import com.team6.entity.Customer;
import com.team6.entity.Membership;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    CustomerCouponRepository customerCouponRepository;

    @GetMapping("/customercart/{customerId}")
    public String customerCart(@PathVariable int customerId) {
        Membership membership = membershipRepository.getByCustomerId(customerId);
        Customer customer = customerRepository.getById(customerId);
        List<CustomerCoupon> customercoupons = customerCouponRepository.getCouponsById(customerId);

        Gson gson = new Gson();
        String json = gson.toJson(customer);
        json = json + gson.toJson(membership) + gson.toJson(customercoupons);
        return json;
    }

}
